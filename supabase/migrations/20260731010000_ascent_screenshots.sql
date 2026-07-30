-- Put real screenshots of Ascent into the four Ascent posts.
--
-- Self-hosted under /images/blog/ascent/ rather than hotlinked from the app
-- repo, same as every other image on this site. All five are the project's own
-- demo-mode captures — sample data, a sample athlete, no real Strava account —
-- and the captions say so, because a dashboard screenshot with numbers in it
-- reads as someone's real training unless you tell the reader otherwise.
--
-- Raw <figure> rather than markdown image syntax: style.css already carries
-- .post-body figure and figcaption, and markdown has no caption. Width and
-- height are the real pixel dimensions so the page does not jump while they
-- load.
--
-- Anchored on unique sentences in each body. If an anchor ever stops matching
-- the update silently does nothing, so the verification query after this
-- migration checks every post actually ended up with an image.

-- Zona latihan: the dashboard overview, in the section about seeing your own
-- distribution.
update public.posts set body = replace(body,
  'Ada juga mode demo kalau Anda ingin melihat tampilannya sebelum menyambungkan akun.',
  'Ada juga mode demo kalau Anda ingin melihat tampilannya sebelum menyambungkan akun.

<figure>
  <img src="/images/blog/ascent/overview.png" alt="Dashboard Ascent menampilkan ringkasan statistik: total aktivitas, jarak, waktu bergerak, elevasi, Eddington number, rata-rata kecepatan dan rata-rata heart rate." width="1360" height="840" loading="lazy">
  <figcaption>Ringkasan di Ascent. Tangkapan layar mode demo — data contoh, bukan akun sungguhan.</figcaption>
</figure>')
where slug = 'zona-latihan-bersepeda-heart-rate-ftp';

-- Baca data Strava: the activity detail, which happens to show moving time and
-- elapsed time side by side — the exact distinction that paragraph is making.
update public.posts set body = replace(body,
  'Waktu total mencakup berhenti di warung kopi, dan itu bukan latihan.',
  'Waktu total mencakup berhenti di warung kopi, dan itu bukan latihan.

<figure>
  <img src="/images/blog/ascent/activity-detail.png" alt="Detail satu aktivitas di Ascent: jarak 76,2 km, waktu bergerak 3 jam 13 menit, waktu total 3 jam 55 menit, kadens rata-rata 93 rpm, heart rate rata-rata 143 bpm." width="900" height="900" loading="lazy">
  <figcaption>Perhatikan selisih waktu bergerak dan waktu total — 42 menit pada satu perjalanan. Tangkapan layar mode demo.</figcaption>
</figure>')
where slug = 'cara-membaca-data-strava';

-- Baca data Strava, second image: the trends view, in the section arguing that
-- one activity tells you nothing.
update public.posts set body = replace(body,
  'Apakah konsistensi Anda membaik, atau Anda hanya sesekali melakukan perjalanan besar lalu menghilang dua minggu?',
  'Apakah konsistensi Anda membaik, atau Anda hanya sesekali melakukan perjalanan besar lalu menghilang dua minggu?

<figure>
  <img src="/images/blog/ascent/trendsSection.png" alt="Halaman tren di Ascent: grafik jarak mingguan, perbandingan jarak bulanan antar tahun, rata-rata kecepatan per bulan, dan komposisi jenis aktivitas." width="1360" height="840" loading="lazy">
  <figcaption>Pola yang cuma muncul kalau dilihat antar-minggu dan antar-bulan. Tangkapan layar mode demo.</figcaption>
</figure>')
where slug = 'cara-membaca-data-strava';

-- Eddington: the screen itself, which also shows the "one more ride of at least
-- 54 km" line the post describes.
update public.posts set body = replace(body,
  'Berjalan di browser Anda, dengan mode demo kalau Anda ingin melihat dulu.',
  'Berjalan di browser Anda, dengan mode demo kalau Anda ingin melihat dulu.

<figure>
  <img src="/images/blog/ascent/eddington.png" alt="Halaman Eddington number di Ascent menampilkan angka 53, keterangan bahwa untuk mencapai 54 dibutuhkan satu perjalanan lagi sejauh minimal 54 km, dan grafik batang perjalanan diurutkan dari terjauh." width="1360" height="840" loading="lazy">
  <figcaption>E = 53, dan satu perjalanan lagi sejauh minimal 54 km untuk naik satu tingkat. Tangkapan layar mode demo.</figcaption>
</figure>')
where slug = 'eddington-number-bersepeda';

-- Story: the generator, which shows the transparent-background checkerboard and
-- the stat picker the post spends its middle section on.
update public.posts set body = replace(body,
  '8. Ekspor sebagai PNG 1080×1920.',
  '8. Ekspor sebagai PNG 1080×1920.

<figure>
  <img src="/images/blog/ascent/story-popup.png" alt="Pembuat kartu cerita di Ascent: pilihan tata letak, tema warna dan aksen, daftar centang statistik yang ingin ditampilkan, dan pratinjau kartu dengan latar transparan." width="1180" height="920" loading="lazy">
  <figcaption>Pemilih statistik, tema, dan tata letak, dengan pratinjau berlatar transparan. Tangkapan layar mode demo.</figcaption>
</figure>')
where slug = 'cara-membuat-story-strava';
