-- Blog post: "Half My Bike Budget Went to the Groupset. I Regret It."
--
-- The third of the bike posts, and the one that answers the first: the build
-- post established the groupset as 51% of the bike's value, so the title picks
-- that number up. Published as written — flowing prose with no section headings,
-- which is how it was sent.

insert into public.posts (slug, title, excerpt, body, published, published_at)
values (
  'half-my-bike-budget-went-to-the-groupset',
  'Half My Bike Budget Went to the Groupset. I Regret It.',
  'The GRX 820 is smoother and more refined, and I understand why people like it. But next to a Sensah Empire Pro at a fraction of the price, I do not think it earned the premium — and replacing one torn hood cover cost me an import from China and most of an afternoon.',
  $body$One thing I kind of regret is putting so much money into building a high-end GRX 820 groupset instead of just focusing on more affordable bikes.

Ironically, I don't regret my Camp SR3D build with the Sensah Empire Pro 12-speed groupset at all. It has been surprisingly good. The GRX 820 definitely has a different character. It's smoother, more refined, and I understand why many people like it. But for me personally, I don't think it's worth the price premium.

One advantage of Shimano is that replacement parts are generally much easier to find. That was one of the reasons I chose it. But even then, I still ran into problems. When I needed a replacement hood cover, I couldn't find one locally and had to import it from China. Thankfully, Hendra, the CEO of Element, helped me bring it in.

Another thing that surprised me was the hood cover itself. The material feels more plasticky than I expected. Replacing it was much harder than it should have been. Unlike Shimano road shifters, where you can usually slide the hood on from the front quite easily because the material is more flexible and rubber-like, the GRX hood was so stiff that I couldn't install it that way. I actually tried, and ended up tearing the hood.

In the end, I had to remove almost everything: the handlebar tape, the shifter, and even disconnect the shift cable just to fit a new hood cover. It turned what should have been a simple maintenance job into something much more time-consuming.

I'm not saying the GRX 820 is a bad groupset. It isn't. It has its own strengths and it's built for a different purpose. I just don't think it gave me enough additional value compared to much cheaper options. Looking back, I probably would have been happier spending less on the groupset and putting that money toward other upgrades or even another bike.$body$,
  true,
  '2026-07-29T11:00:00+08:00'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-groupset-regret.svg'
where slug = 'half-my-bike-budget-went-to-the-groupset';
