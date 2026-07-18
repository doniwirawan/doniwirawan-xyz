-- Add the "Rumah Susun Bali" infographic to the Bali land-use post. The image
-- lives in the public `blog` storage bucket (uploaded with `supabase storage
-- cp`), the same bucket the admin editor uploads post images to.
--
-- It is dropped in right after the paragraph that argues for building upward —
-- which is what the infographic illustrates — and also set as the cover so it
-- shows on the /blog index. The renderer skips the hero when the cover equals
-- the body's first image, so it prints once, in place.

update public.posts
set body = replace(
      body,
      'tanpa harus mengorbankan sawah berikutnya.',
      'tanpa harus mengorbankan sawah berikutnya.' || E'\n\n' ||
      '![Infografik konsep rumah susun Bali: hunian vertikal dengan pura di puncak, balai banjar, unit hunian, dan ruang komunal — hemat lahan tanpa mengorbankan sawah.](https://srzohrmbbxkecagwyzhb.supabase.co/storage/v1/object/public/blog/illustration-bangunan3lantai.png)'
    ),
    cover_url = 'https://srzohrmbbxkecagwyzhb.supabase.co/storage/v1/object/public/blog/illustration-bangunan3lantai.png'
where slug = 'bali-tidak-kehabisan-tanah';
