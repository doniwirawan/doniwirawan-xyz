// Theme switch. The head script has already picked the starting theme — this
// only handles clicks, and remembers the choice from then on.
(function () {
  var button = document.querySelector('.theme-toggle');
  if (!button) return;

  button.addEventListener('click', function () {
    var next = document.documentElement.getAttribute('data-theme') === 'light'
      ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', next);
    button.setAttribute('aria-label', next === 'light' ? 'Switch to dark mode' : 'Switch to light mode');
    try { localStorage.setItem('theme', next); } catch (e) { /* private mode */ }
  });
})();

// The bar is clear over the hero and turns solid once the page scrolls.
(function () {
  var nav = document.querySelector('.nav');
  if (!nav) return;
  var ticking = false;
  function update() {
    ticking = false;
    nav.classList.toggle('is-scrolled', window.scrollY > 24);
  }
  window.addEventListener('scroll', function () {
    if (!ticking) { ticking = true; requestAnimationFrame(update); }
  }, { passive: true });
  update();
})();

// Mobile navigation: the menu button opens a full-screen list of links, and
// anything that means "I'm done here" closes it again.
(function () {
  var toggle = document.querySelector('.nav-toggle');
  var links = document.querySelector('.nav-links');
  if (!toggle || !links) return;
  links.setAttribute('data-lenis-prevent', '');

  function setOpen(open) {
    links.classList.toggle('is-open', open);
    links.closest('.nav').classList.toggle('menu-open', open);
    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Close menu' : 'Menu');
    document.documentElement.style.overflow = open ? 'hidden' : '';
    var lenis = window.motion && window.motion.lenis;
    if (lenis) { if (open) lenis.stop(); else lenis.start(); }
  }

  toggle.addEventListener('click', function (e) {
    e.stopPropagation();
    setOpen(!links.classList.contains('is-open'));
  });

  // Tapping a link, tapping outside, or pressing Escape all close it.
  links.addEventListener('click', function (e) {
    if (e.target.closest('a')) setOpen(false);
  });
  document.addEventListener('click', function (e) {
    if (links.classList.contains('is-open') && !links.contains(e.target) && !toggle.contains(e.target)) setOpen(false);
  });
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && links.classList.contains('is-open')) { setOpen(false); toggle.focus(); }
  });

  // Coming back to a wide screen should not leave the panel stuck open.
  window.addEventListener('resize', function () {
    if (window.innerWidth > 860 && links.classList.contains('is-open')) setOpen(false);
  });
})();
