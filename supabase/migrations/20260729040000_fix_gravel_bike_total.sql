-- The bike total was short by 175,000 — exactly the Bar Tape line, which is in
-- the table but was missing from the sum. The fifteen line items add up to
-- 23,231,292, not 23,056,292, which moves the grand total with it.
--
-- Line items are untouched: the receipts were right, the addition was not.
-- replace() catches both places each figure appears (the bold total under the
-- breakdown, and the Total Project Cost table).

update public.posts
set body = replace(
             replace(body, '23,056,292', '23,231,292'),
             '25,314,508', '25,489,508')
where slug = 'building-my-dream-gravel-bike';
