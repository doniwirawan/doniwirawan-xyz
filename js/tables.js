// Turns the plain markdown tables in a post into something you can actually
// interrogate: sort, filter, see each figure as a share of the column, and copy
// the whole thing out as CSV.
//
// Everything here is an enhancement layered on top of a table that already
// renders correctly. With JavaScript off you get the table as written, which
// for a cost breakdown is already a sensible order.
(function () {
  var tables = document.querySelectorAll('.post-body table');
  if (!tables.length) return;

  // "11,800,000" is a number. "Shimano GRX RX820" is not. Currency symbols and
  // thousands separators are stripped; anything left with a digit in it counts.
  function numeric(text) {
    var cleaned = text.replace(/[^0-9.,-]/g, '').replace(/,/g, '');
    if (!cleaned || !/[0-9]/.test(cleaned)) return null;
    var n = parseFloat(cleaned);
    return isNaN(n) ? null : n;
  }

  function cellText(row, i) {
    return row.children[i] ? row.children[i].textContent.trim() : '';
  }

  function enhance(table) {
    var head = table.tHead;
    var body = table.tBodies[0];
    if (!head || !body || !head.rows[0] || body.rows.length < 3) return;

    var headers = Array.prototype.slice.call(head.rows[0].cells);
    var rows = Array.prototype.slice.call(body.rows);
    var columns = headers.length;

    // A column counts as numeric when nearly all of its cells parse as numbers,
    // so one stray "n/a" does not disqualify a column of money.
    var numericCols = [];
    for (var c = 0; c < columns; c++) {
      var parsed = 0;
      for (var r = 0; r < rows.length; r++) {
        if (numeric(cellText(rows[r], c)) !== null) parsed++;
      }
      if (parsed >= rows.length * 0.8) numericCols.push(c);
    }

    // ── shell ───────────────────────────────────────────────────────────────
    var wrap = document.createElement('div');
    wrap.className = 'table-wrap';
    table.parentNode.insertBefore(wrap, table);

    var bar = document.createElement('div');
    bar.className = 'table-bar';

    var search = document.createElement('input');
    search.type = 'search';
    search.className = 'table-search';
    search.placeholder = 'Filter rows…';
    search.setAttribute('aria-label', 'Filter table rows');

    var count = document.createElement('span');
    count.className = 'table-count';

    var copy = document.createElement('button');
    copy.type = 'button';
    copy.className = 'table-copy';
    copy.textContent = 'Copy CSV';

    bar.append(search, count, copy);

    var scroll = document.createElement('div');
    scroll.className = 'table-scroll';

    wrap.append(bar, scroll);
    scroll.append(table);

    // ── share bars ──────────────────────────────────────────────────────────
    // A number is hard to weigh against fifteen other numbers. A bar behind it
    // is not — this is what makes "the groupset is half the bike" visible.
    var maxima = {};
    numericCols.forEach(function (c) {
      var max = 0;
      rows.forEach(function (row) {
        var n = numeric(cellText(row, c));
        if (n !== null && n > max) max = n;
      });
      maxima[c] = max || 1;

      rows.forEach(function (row) {
        var cell = row.children[c];
        var n = numeric(cell ? cell.textContent : '');
        if (!cell || n === null) return;
        var text = cell.textContent;
        cell.textContent = '';
        cell.classList.add('has-bar');

        var fill = document.createElement('span');
        fill.className = 'cell-bar';
        fill.style.width = Math.max(n / maxima[c] * 100, 0) + '%';

        var value = document.createElement('span');
        value.className = 'cell-value';
        value.textContent = text;

        cell.append(fill, value);
      });
    });

    // ── totals ──────────────────────────────────────────────────────────────
    var tfoot = null;
    if (numericCols.length) {
      tfoot = document.createElement('tfoot');
      var trTotal = document.createElement('tr');
      for (var i = 0; i < columns; i++) {
        var cell = document.createElement('td');
        if (i === 0) cell.textContent = 'Total';
        else if (numericCols.indexOf(i) !== -1) cell.className = 'total-value';
        if (headers[i] && headers[i].getAttribute('align') === 'right') {
          cell.setAttribute('align', 'right');
        }
        trTotal.append(cell);
      }
      tfoot.append(trTotal);
      table.append(tfoot);
    }

    function visible() {
      return rows.filter(function (row) { return row.style.display !== 'none'; });
    }

    function refreshTotals() {
      if (!tfoot) return;
      var shown = visible();
      var cells = tfoot.rows[0].cells;
      numericCols.forEach(function (c) {
        var sum = 0;
        shown.forEach(function (row) {
          var n = numeric(cellText(row, c));
          if (n !== null) sum += n;
        });
        cells[c].textContent = sum.toLocaleString();
      });
      count.textContent = shown.length === rows.length
        ? rows.length + ' rows'
        : shown.length + ' of ' + rows.length + ' rows';
    }

    // ── sorting ─────────────────────────────────────────────────────────────
    var state = { index: -1, dir: 0 };

    headers.forEach(function (th, index) {
      var label = th.textContent.trim();
      th.classList.add('sortable');
      th.setAttribute('aria-sort', 'none');

      var button = document.createElement('button');
      button.type = 'button';
      button.className = 'sort-btn';
      button.textContent = label;

      var caret = document.createElement('span');
      caret.className = 'sort-caret';
      caret.textContent = '↕';
      button.append(caret);

      th.textContent = '';
      th.append(button);

      button.addEventListener('click', function () {
        // Third click returns to the written order, which is otherwise
        // unrecoverable without reloading the page.
        if (state.index === index) {
          state.dir = state.dir === 1 ? -1 : state.dir === -1 ? 0 : 1;
        } else {
          state = { index: index, dir: 1 };
        }

        headers.forEach(function (other) {
          other.classList.remove('is-sorted');
          other.setAttribute('aria-sort', 'none');
          var c = other.querySelector('.sort-caret');
          if (c) c.textContent = '↕';
        });

        var ordered;
        if (state.dir === 0) {
          state.index = -1;
          ordered = rows.slice();
        } else {
          th.classList.add('is-sorted');
          th.setAttribute('aria-sort', state.dir === 1 ? 'ascending' : 'descending');
          caret.textContent = state.dir === 1 ? '↑' : '↓';

          ordered = rows.slice().sort(function (a, b) {
            var x = cellText(a, index), y = cellText(b, index);
            var nx = numeric(x), ny = numeric(y);
            if (nx !== null && ny !== null) return state.dir * (nx - ny);
            return state.dir * x.localeCompare(y, undefined, { numeric: true });
          });
        }

        ordered.forEach(function (row) { body.append(row); });
      });
    });

    // ── filtering ───────────────────────────────────────────────────────────
    search.addEventListener('input', function () {
      var q = search.value.trim().toLowerCase();
      rows.forEach(function (row) {
        row.style.display = !q || row.textContent.toLowerCase().indexOf(q) !== -1
          ? '' : 'none';
      });
      refreshTotals();
    });

    // ── copy ────────────────────────────────────────────────────────────────
    copy.addEventListener('click', function () {
      var lines = [headers.map(function (th) { return th.textContent.trim(); })];
      visible().forEach(function (row) {
        lines.push(Array.prototype.map.call(row.children, function (td) {
          return td.textContent.trim();
        }));
      });

      var csv = lines.map(function (cols) {
        return cols.map(function (v) {
          return /[",\n]/.test(v) ? '"' + v.replace(/"/g, '""') + '"' : v;
        }).join(',');
      }).join('\n');

      var done = function (ok) {
        copy.textContent = ok ? 'Copied' : 'Press Ctrl+C';
        setTimeout(function () { copy.textContent = 'Copy CSV'; }, 1600);
      };

      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(csv).then(function () { done(true); },
                                                function () { done(false); });
      } else {
        done(false);
      }
    });

    // ── chart ───────────────────────────────────────────────────────────────
    // Worth drawing only when there is one thing being measured against a list
    // of names. Two numeric columns is a different chart, and this is not it.
    var chart = null;
    if (numericCols.length === 1 && numericCols[0] !== 0) {
      chart = buildChart(rows, headers, numericCols[0], maxima[numericCols[0]]);
      wrap.insertBefore(chart, scroll);

      var views = document.createElement('div');
      views.className = 'table-views';
      var asChart = document.createElement('button');
      asChart.type = 'button';
      asChart.className = 'view-btn is-active';
      asChart.textContent = 'Chart';
      var asTable = document.createElement('button');
      asTable.type = 'button';
      asTable.className = 'view-btn';
      asTable.textContent = 'Table';
      views.append(asChart, asTable);
      bar.insertBefore(views, copy);

      var show = function (wantChart) {
        chart.hidden = !wantChart;
        scroll.hidden = wantChart;
        asChart.classList.toggle('is-active', wantChart);
        asTable.classList.toggle('is-active', !wantChart);
        // Filtering and sorting act on the table; hide those while charting.
        search.hidden = wantChart;
      };
      asChart.onclick = function () { show(true); };
      asTable.onclick = function () { show(false); };
      show(true);
    }

    refreshTotals();
  }

  // A horizontal bar chart: one measure across a list of names, so every bar is
  // the same hue — colouring by size would just restate the bar length. Sorted
  // biggest first, because the ranking is the whole point.
  function buildChart(rows, headers, col, max) {
    var labelCol = col === 0 ? 1 : 0;
    var measure = headers[col] ? headers[col].textContent.trim() : 'Value';

    var items = rows.map(function (row) {
      return {
        name: cellText(row, labelCol),
        value: numeric(cellText(row, col)) || 0,
        raw: cellText(row, col),
      };
    }).filter(function (d) { return d.value > 0; })
      .sort(function (a, b) { return b.value - a.value; });

    var total = items.reduce(function (n, d) { return n + d.value; }, 0);

    var box = document.createElement('div');
    box.className = 'chart';
    box.setAttribute('role', 'img');
    box.setAttribute('aria-label', measure + ' by ' +
      (headers[labelCol] ? headers[labelCol].textContent.trim().toLowerCase() : 'item') +
      ', largest first. The table view lists every value.');

    var plot = document.createElement('div');
    plot.className = 'chart-plot';

    items.forEach(function (d, i) {
      var share = total ? (d.value / total * 100) : 0;

      var row = document.createElement('div');
      row.className = 'chart-row';
      row.tabIndex = 0;
      // Hover and keyboard focus reveal the same thing.
      row.setAttribute('aria-label', d.name + ': ' + d.raw + ', ' + share.toFixed(1) + '% of total');

      var name = document.createElement('span');
      name.className = 'chart-name';
      name.textContent = d.name;

      var track = document.createElement('span');
      track.className = 'chart-track';
      var fill = document.createElement('span');
      fill.className = 'chart-fill';
      fill.style.width = (d.value / max * 100) + '%';
      track.append(fill);

      // Label the top three only: the ones the story is about. The rest are a
      // hover or a glance at the table away.
      var value = document.createElement('span');
      value.className = 'chart-value' + (i < 3 ? '' : ' is-quiet');
      value.textContent = i < 3 ? d.raw : '';
      track.append(value);

      var tip = document.createElement('span');
      tip.className = 'chart-tip';
      tip.textContent = d.raw + '  ·  ' + share.toFixed(1) + '%';
      row.append(name, track, tip);

      plot.append(row);
    });

    var note = document.createElement('p');
    note.className = 'chart-note';
    note.textContent = 'Hover or focus a bar for its value and share. Switch to Table for every figure.';

    box.append(plot, note);
    return box;
  }

  Array.prototype.forEach.call(tables, enhance);
})();
