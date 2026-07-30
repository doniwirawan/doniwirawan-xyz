-- Two dead links went out in the Aksara Bali posts. Both verified 404 against a
-- known-good control, with a browser user agent, so neither is bot-blocking.
--
-- 1. The Google Play listing for the Aksara Bali Android app does not exist
--    publicly: the app is still on the internal test track, so the store URL
--    404s for everyone. Pointed at the GitHub releases page instead, which is
--    where the APK actually is and what the project's own README links to.
--
-- 2. The JDIH abstract page for Pergub Bali 80/2018 has moved or been retired;
--    only the JDIH root still resolves. Replaced with the Dinas Kebudayaan
--    page for the same regulation, which is an official provincial source and
--    reads better than a bare PDF.
--
-- Written as replace() over every post so it stays correct regardless of which
-- posts happen to carry the links.

update public.posts
set body = replace(
  body,
  'https://play.google.com/store/apps/details?id=xyz.doniwirawan.aksara_bali_mobile',
  'https://github.com/doniwirawan/aksara-bali/releases/latest'
)
where body like '%play.google.com/store/apps/details?id=xyz.doniwirawan.aksara_bali_mobile%';

update public.posts
set body = replace(
  body,
  'https://jdih.baliprov.go.id/produk-hukum/peraturan/abstrak/24665',
  'https://disbud.baliprov.go.id/pergub-nomor-80-tahun-2018-tentang-perlindungan-dan-penggunaan-bahasa-aksara-dan-sastra-bali-serta-penyelenggaraan-bulan-bahasa-bali-share-krama-bali/'
)
where body like '%jdih.baliprov.go.id/produk-hukum/peraturan/abstrak/24665%';
