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

// Mobile navigation: the hamburger opens the links, and anything that means
// "I'm done here" closes it again.
(function () {
  var toggle = document.querySelector('.nav-toggle');
  var links = document.querySelector('.nav-links');
  if (!toggle || !links) return;

  function setOpen(open) {
    links.classList.toggle('is-open', open);
    toggle.setAttribute('aria-expanded', String(open));
  }

  toggle.addEventListener('click', function (e) {
    e.stopPropagation();
    setOpen(!links.classList.contains('is-open'));
  });

  // Tapping a link, tapping outside, or pressing Escape all close it.
  links.addEventListener('click', function (e) {
    if (e.target.tagName === 'A') setOpen(false);
  });
  document.addEventListener('click', function (e) {
    if (!links.contains(e.target) && e.target !== toggle) setOpen(false);
  });
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') setOpen(false);
  });

  // Coming back to a wide screen should not leave the panel stuck open.
  window.addEventListener('resize', function () {
    if (window.innerWidth > 760) setOpen(false);
  });
})();
