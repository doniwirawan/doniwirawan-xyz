-- Against the corrected total the frame is 23.45% of the bike, which rounds to
-- 23, not the 24 the post carried over from the old total. Groupset (50.79%)
-- and wheelset (6.24%) still round to the 51% and 6% already stated.

update public.posts
set body = replace(body, 'Frame: approximately 24%', 'Frame: approximately 23%')
where slug = 'building-my-dream-gravel-bike';
