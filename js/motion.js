// Motion for Dawn Ride: GSAP + ScrollTrigger, with Lenis as the one and only
// smooth-scroll engine.
//
// Everything here is additive. The HTML is complete without this file, and
// under prefers-reduced-motion it does nothing: no smooth scroll, no scrubbing,
// every element simply sits in its final state.
//
// The `motion` class on <html> (set in the head) is what hides the hero's
// starting states. If this file arrives too late, the head script has already
// removed that class and shown everything; then only the effects that never
// hide content (smooth scroll, route line, parallax) run.
(function () {
  var root = document.documentElement;
  var reduce = window.matchMedia('(prefers-reduced-motion: reduce)');

  if (reduce.matches || !window.gsap || !window.ScrollTrigger) {
    root.classList.remove('motion');
    return;
  }

  window.__motion = true;
  var intro = root.classList.contains('motion');
  var gsap = window.gsap;
  var ScrollTrigger = window.ScrollTrigger;
  gsap.registerPlugin(ScrollTrigger);

  var $ = function (sel, ctx) { return (ctx || document).querySelector(sel); };
  var $$ = function (sel, ctx) { return Array.prototype.slice.call((ctx || document).querySelectorAll(sel)); };

  // ── smooth scroll ──
  var lenis = null;
  if (window.Lenis) {
    lenis = new window.Lenis({ anchors: true, autoRaf: false });
    lenis.on('scroll', ScrollTrigger.update);
    gsap.ticker.add(raf);
    gsap.ticker.lagSmoothing(0);
  }
  function raf(time) { if (lenis) lenis.raf(time * 1000); }

  var ctx = gsap.context(function () {});
  var mm = gsap.matchMedia();

  // ── split headings into words, keeping one unsplit accessible name ──
  function split(el) {
    var text = el.textContent.trim().replace(/\s+/g, ' ');
    var label = document.createElement('span');
    label.className = 'sr-only';
    label.textContent = text;
    var visual = document.createElement('span');
    visual.setAttribute('aria-hidden', 'true');
    var words = text.split(' ');
    words.forEach(function (w, i) {
      var mask = document.createElement('span');
      mask.className = 'split-mask';
      var word = document.createElement('span');
      word.className = 'split-word';
      word.textContent = w;
      mask.append(word);
      visual.append(mask);
      if (i < words.length - 1) visual.append(' ');
    });
    el.replaceChildren(label, visual);
    return $$('.split-word', el);
  }

  // ── count-up for numbers that are already written in their final form ──
  function countUp(el, delay) {
    var to = parseFloat(el.getAttribute('data-count'));
    if (!isFinite(to)) return;
    var decimals = parseInt(el.getAttribute('data-decimals') || '0', 10);
    var prefix = el.getAttribute('data-prefix') || '';
    var suffix = el.getAttribute('data-suffix') || '';
    var state = { v: 0 };
    var write = function () {
      el.textContent = prefix + state.v.toLocaleString('en-US', {
        minimumFractionDigits: decimals, maximumFractionDigits: decimals,
      }) + suffix;
    };
    write();
    return gsap.to(state, {
      v: to, duration: 1.8, delay: delay || 0, ease: 'power3.out', onUpdate: write,
      onComplete: function () { state.v = to; write(); },
    });
  }

  ctx.add(function () {
    // ── hero intro: the sun rises, the name unmasks, the portrait settles ──
    var sun = $('.hero-sun');
    var lines = $$('.hero-name .line > span');
    var portrait = $('.hero-portrait');
    var aksara = $('.hero-aksara .aksara');

    if (intro && sun) {
      gsap.set(lines, { y: 0, yPercent: 105 });
      gsap.set(aksara, { clipPath: 'inset(0 100% 0 0)' });
      var tl = gsap.timeline({ defaults: { ease: 'expo.out' } });
      tl.fromTo(sun, { y: 160, scale: .82, opacity: 0 }, { y: 0, scale: 1, opacity: 1, duration: 2.4, ease: 'power2.out' }, 0)
        .to(lines, { yPercent: 0, duration: 1.4, stagger: .12 }, .2)
        .fromTo(portrait, { opacity: 0, scale: .97, transformOrigin: '50% 100%' }, { opacity: 1, scale: 1, duration: 1.6 }, .45)
        .to(aksara, { clipPath: 'inset(0 0% 0 0)', duration: 1.4, ease: 'power3.inOut' }, .9);
    }

    if (sun) {
      // Scrolling out of the hero, the sun keeps climbing and the name lifts.
      gsap.timeline({
        scrollTrigger: { trigger: '.hero', start: 'top top', end: 'bottom top', scrub: true },
      })
        .to(sun, { yPercent: -45, ease: 'none' }, 0)
        .to('.hero-name', { yPercent: -18, ease: 'none' }, 0)
        .to(portrait, { yPercent: 8, ease: 'none' }, 0);
    }

    // Pointer drift on the hero, for fine pointers only. Additive: it returns
    // to rest when the pointer leaves or the window loses focus.
    mm.add('(pointer: fine) and (min-width: 761px)', function () {
      var hero = $('.hero');
      if (!hero || !portrait) return;
      var px = gsap.quickTo(portrait, 'x', { duration: .9, ease: 'power3.out' });
      var sx = gsap.quickTo(sun, 'x', { duration: 1.4, ease: 'power3.out' });
      var pending = false, lastX = 0;
      function move(e) {
        lastX = e.clientX;
        if (pending) return;
        pending = true;
        requestAnimationFrame(function () {
          pending = false;
          var n = lastX / window.innerWidth - .5;
          px(n * 18);
          sx(n * -36);
        });
      }
      function rest() { px(0); sx(0); }
      hero.addEventListener('pointermove', move);
      hero.addEventListener('pointerleave', rest);
      window.addEventListener('blur', rest);
      return function () {
        hero.removeEventListener('pointermove', move);
        hero.removeEventListener('pointerleave', rest);
        window.removeEventListener('blur', rest);
      };
    });

    // ── legs ──
    $$('.leg').forEach(function (leg) {
      var fill = $('.route-fill', leg);
      if (fill) {
        gsap.fromTo(fill, { '--p': 0 }, {
          '--p': 1, ease: 'none',
          scrollTrigger: { trigger: leg, start: 'top 75%', end: 'bottom 75%', scrub: true },
        });
      }

      var dot = $('.waypoint .wp-dot', leg);
      var title = $('.leg-title[data-split]', leg);
      if (!intro) return;

      var words = title ? split(title) : [];
      var tl = gsap.timeline({ scrollTrigger: { trigger: leg, start: 'top 80%', once: true } });
      if (dot) tl.fromTo(dot, { scale: 0 }, { scale: 1, duration: .6, ease: 'back.out(3)' }, 0);
      if (words.length) tl.fromTo(words, { yPercent: 110 }, { yPercent: 0, duration: 1.1, stagger: .07, ease: 'expo.out' }, .05);
    });

    // ── blocks that fade up as they arrive ──
    if (intro) {
      gsap.set('[data-reveal]', { y: 48 });
      ScrollTrigger.batch('[data-reveal]', {
        start: 'top 88%', once: true,
        onEnter: function (els) {
          gsap.to(els, { opacity: 1, y: 0, duration: 1.1, stagger: .1, ease: 'expo.out' });
        },
      });
    }

    // ── app screenshots drift inside their frames ──
    $$('[data-parallax]').forEach(function (img) {
      gsap.fromTo(img, { yPercent: -5, scale: 1.12 }, {
        yPercent: 5, scale: 1.12, ease: 'none',
        scrollTrigger: { trigger: img.parentNode, start: 'top bottom', end: 'bottom top', scrub: true },
      });
    });

    // ── ride photos float at different speeds (desktop grid only) ──
    mm.add('(min-width: 641px)', function () {
      $$('.photos img[data-speed]').forEach(function (img) {
        var s = parseFloat(img.getAttribute('data-speed')) || 0;
        gsap.fromTo(img.parentNode, { y: -s * 5 }, {
          y: s * 5, ease: 'none',
          scrollTrigger: { trigger: '.photos', start: 'top bottom', end: 'bottom top', scrub: true },
        });
      });
    });

    // ── the footer's name slides home at dusk ──
    var mark = $('[data-footer-mark]');
    if (mark) {
      gsap.fromTo(mark, { xPercent: 14 }, {
        xPercent: 0, ease: 'none',
        scrollTrigger: { trigger: '.footer', start: 'top bottom', end: 'top 35%', scrub: true },
      });
    }
  });

  // The home page calls these when its live data arrives.
  window.motion = {
    lenis: lenis,
    refresh: function () { ScrollTrigger.refresh(); },
    counted: function (nodes, odo) {
      ScrollTrigger.refresh();
      if (!intro) return;
      ctx.add(function () {
        Array.prototype.forEach.call(nodes, function (el, i) {
          ScrollTrigger.create({
            trigger: el, start: 'top 92%', once: true,
            onEnter: function () { countUp(el, i * .08); },
          });
        });
        var o = odo && $('[data-count]', odo);
        if (o) {
          gsap.fromTo(odo, { opacity: 0 }, { opacity: 1, duration: .8 });
          countUp(o, 0);
        }
      });
    },
  };

  // Fonts and late images change heights; measure again once they settle.
  if (document.fonts && document.fonts.ready) document.fonts.ready.then(function () { ScrollTrigger.refresh(); });
  window.addEventListener('load', function () { ScrollTrigger.refresh(); });
  // Live data (posts, stats, books) lands at unpredictable times and changes
  // the page height; stale trigger positions would leave blocks unrevealed.
  var lastH = 0, resizeTimer = 0;
  if (window.ResizeObserver) {
    new ResizeObserver(function () {
      var h = document.body.scrollHeight;
      if (Math.abs(h - lastH) < 2) return;
      lastH = h;
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(function () { ScrollTrigger.refresh(); }, 150);
    }).observe(document.body);
  }

  // Someone switching reduced motion on mid-visit gets the final state at once.
  function teardown() {
    mm.revert();
    ctx.revert();
    ScrollTrigger.getAll().forEach(function (t) { t.kill(); });
    gsap.ticker.remove(raf);
    if (lenis) { lenis.destroy(); lenis = null; }
    if (window.motion) window.motion.lenis = null;
    root.classList.remove('motion');
    $$('[data-reveal], .hero-sun, .hero-portrait, .hero-name .line > span').forEach(function (el) {
      el.style.opacity = ''; el.style.transform = '';
    });
  }
  if (reduce.addEventListener) reduce.addEventListener('change', function (e) { if (e.matches) teardown(); });
  window.addEventListener('pagehide', function (e) { if (!e.persisted) teardown(); });
})();
