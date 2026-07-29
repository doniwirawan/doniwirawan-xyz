// Makes tables in a post sortable by clicking a column header.
//
// Progressive: without JavaScript the table still renders in the order it was
// written, which for a cost breakdown is already a sensible order. This only
// adds the ability to ask "what was most expensive" without reading every row.
(function () {
  var tables = document.querySelectorAll('.post-body table');
  if (!tables.length) return;

  // "11,800,000" and "Rp2.21 million" should both sort as numbers; a component
  // name should not. Returns null when the cell is not really a number.
  function numeric(text) {
    var cleaned = text.replace(/[^0-9.,-]/g, '').replace(/,/g, '');
    if (!cleaned || !/[0-9]/.test(cleaned)) return null;
    var n = parseFloat(cleaned);
    return isNaN(n) ? null : n;
  }

  function cellText(row, index) {
    var cell = row.children[index];
    return cell ? cell.textContent.trim() : '';
  }

  tables.forEach(function (table) {
    var head = table.tHead;
    var body = table.tBodies[0];
    if (!head || !body || body.rows.length < 3) return;

    var headers = head.rows[0] ? head.rows[0].cells : [];
    var original = Array.prototype.slice.call(body.rows);
    var state = { index: -1, dir: 0 };

    Array.prototype.forEach.call(headers, function (th, index) {
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
        // Third click on the same column returns to the written order, which is
        // otherwise unrecoverable without a reload.
        if (state.index === index) {
          state.dir = state.dir === 1 ? -1 : state.dir === -1 ? 0 : 1;
        } else {
          state = { index: index, dir: 1 };
        }

        Array.prototype.forEach.call(headers, function (other) {
          other.classList.remove('is-sorted');
          other.setAttribute('aria-sort', 'none');
          var c = other.querySelector('.sort-caret');
          if (c) c.textContent = '↕';
        });

        var rows;
        if (state.dir === 0) {
          state.index = -1;
          rows = original.slice();
        } else {
          th.classList.add('is-sorted');
          th.setAttribute('aria-sort', state.dir === 1 ? 'ascending' : 'descending');
          caret.textContent = state.dir === 1 ? '↑' : '↓';

          rows = original.slice().sort(function (a, b) {
            var x = cellText(a, index);
            var y = cellText(b, index);
            var nx = numeric(x);
            var ny = numeric(y);
            if (nx !== null && ny !== null) return state.dir * (nx - ny);
            return state.dir * x.localeCompare(y, undefined, { numeric: true });
          });
        }

        rows.forEach(function (row) { body.append(row); });
      });
    });
  });
})();
