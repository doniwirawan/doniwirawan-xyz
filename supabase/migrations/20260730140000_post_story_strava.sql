-- Blog post: "Cara Membuat Story Strava"
--
-- The commercial-intent end of the Ascent cluster. Strava's own share image is
-- limited and everyone hits that wall; this is the post that catches them at
-- the moment they go looking for something better.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'cara-membuat-story-strava',
  'Cara Membuat Story Strava yang Tidak Membosankan',
  'Gambar bagikan bawaan Strava selalu terlihat sama, dan tidak bisa diubah banyak. Cara membuat kartu aktivitas 1080x1920 dengan tata letak, warna, dan statistik pilihan Anda sendiri — termasuk latar transparan untuk ditempel di atas foto.',
  $body$Jawaban singkatnya: buka [Ascent](https://ascent-analytics.doniwirawan.xyz), sambungkan akun Strava Anda, pilih aktivitasnya, lalu ekspor sebagai kartu **1080×1920** — ukuran yang pas untuk Instagram Story dan TikTok. Ada belasan tata letak, warna bisa diatur, dan latarnya bisa dibuat transparan supaya bisa ditempel langsung di atas foto Anda sendiri.

Gratis, jalan di browser, tanpa watermark.

## Kenapa gambar bawaan Strava terasa terbatas

Fitur bagikan Strava berfungsi, dan itu memang tujuannya. Tapi hasilnya selalu terlihat sama: tata letak yang itu-itu saja, warna yang tidak bisa diubah, dan pilihan statistik yang terbatas.

Kalau Anda memposting beberapa kali seminggu, feed Anda mulai terlihat seperti tangkapan layar berulang. Dan kalau foto Anda bagus, gambar Strava justru menutupinya alih-alih melengkapinya.

## Langkah-langkahnya

1. Buka [ascent-analytics.doniwirawan.xyz](https://ascent-analytics.doniwirawan.xyz).
2. Sambungkan akun Strava Anda. Kalau ingin melihat-lihat dulu, ada **mode demo** dengan data contoh yang tidak butuh akun sama sekali.
3. Pilih aktivitas yang ingin dibagikan.
4. Buka pembuat kartu cerita.
5. Pilih tata letak. Ada belasan — dari yang minimalis, yang menonjolkan peta rute, sampai yang bergaya neon dan sinematik.
6. Pilih statistik yang ingin ditampilkan: jarak, elevasi, waktu, kecepatan, kalori, power, kadens, heart rate. Ambil yang relevan dengan cerita perjalanan itu, bukan semuanya.
7. Atur warna latar, aksen, dan teks. Bisa juga menyembunyikan judul atau tanggal.
8. Ekspor sebagai PNG 1080×1920.

## Bagian yang paling berguna: latar transparan

Ini fitur yang menurut saya paling mengubah hasilnya.

Ekspor kartunya dengan latar transparan, lalu tempel di atas foto Anda sendiri di Instagram Story atau aplikasi edit apa pun. Hasilnya: foto Anda tetap jadi bintangnya, dengan angka-angka melayang di atasnya seolah memang didesain untuk foto itu.

Ini jauh lebih baik daripada menempelkan kotak buram di atas pemandangan yang bagus.

## Beberapa hal yang membuat hasilnya lebih enak dilihat

**Pilih sedikit statistik, jangan semua.** Tiga angka yang dipilih dengan sengaja jauh lebih kuat daripada delapan angka yang menutupi seperempat layar. Untuk perjalanan menanjak, elevasi dan waktu sudah bercerita. Untuk perjalanan panjang, jarak dan waktu bergerak sudah cukup.

**Cocokkan warna aksen dengan fotonya.** Ambil satu warna yang sudah ada di foto — warna jersey, warna langit senja — dan pakai sebagai aksen. Hasilnya langsung terlihat disengaja.

**Beri ruang kosong.** Sisakan bagian atas dan bawah supaya elemen antarmuka Instagram tidak menabrak teks Anda.

**Peta rute tidak selalu perlu.** Layout dengan peta bagus untuk rute yang bentuknya menarik. Untuk perjalanan bolak-balik di jalan yang sama, peta justru mengacaukan komposisi.

## Soal privasi, dan ini penting untuk story

Satu hal yang jarang dipikirkan orang saat memposting peta rute: **peta yang selalu berawal dan berakhir di rumah Anda memberi tahu orang di mana Anda tinggal.**

Strava punya pengaturan zona privasi untuk menyembunyikan area di sekitar titik awal dan akhir. Kalau Anda sering memposting rute, aturlah itu. Atau pilih tata letak yang tidak menampilkan peta sama sekali.

Soal data Anda sendiri: Ascent berjalan di browser Anda. Data diambil langsung dari Strava oleh peramban Anda dan tidak melewati server saya, dan gambarnya dibuat di perangkat Anda. Akses Strava-nya bisa Anda cabut kapan saja dari pengaturan akun Strava.

## Kalau Anda ingin angkanya lebih bermakna

Kartu cerita adalah bagian yang menyenangkan. Bagian yang berguna adalah memahami angkanya: mana yang benar-benar penting dan mana yang tidak, saya tulis di [Cara Membaca Data Strava Anda](/blog/cara-membaca-data-strava).

## FAQ

### Bagaimana cara membuat story Strava yang bagus?

Ekspor kartu aktivitas berukuran 1080×1920 lewat [Ascent](https://ascent-analytics.doniwirawan.xyz), pilih tata letak dan warna sendiri, dan gunakan latar transparan supaya bisa ditempel di atas foto Anda.

### Ukuran story Instagram berapa?

1080×1920 piksel, rasio 9:16. Ukuran yang sama berlaku untuk TikTok dan Reels.

### Apakah gratis dan ada watermark?

Gratis, dan tanpa watermark.

### Apakah bisa dipakai tanpa akun Strava?

Bisa, lewat mode demo dengan data contoh. Untuk memakai aktivitas Anda sendiri, akun Strava perlu disambungkan.

### Apakah bisa dipakai di HP?

Bisa. Ascent berjalan di browser HP dan bisa dipasang sebagai aplikasi layar depan lewat PWA.

### Statistik apa saja yang bisa ditampilkan?

Jarak, elevasi, waktu, kecepatan, kalori, power, kadens, dan heart rate, dengan pilihan menyembunyikan judul atau tanggal.

### Apakah aman memposting peta rute saya?

Perhatikan bahwa rute yang selalu berawal dan berakhir di rumah menunjukkan lokasi tempat tinggal Anda. Gunakan zona privasi Strava, atau pilih tata letak tanpa peta.$body$,
  true,
  '2026-07-31T09:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-story-strava.svg'
where slug = 'cara-membuat-story-strava';
