-- Blog post: "Segment, PR, KOM, dan Local Legend di Strava"
--
-- Fills the last obvious gap in the Ascent set: the social/competitive layer,
-- which none of the other four posts touch. Takes the position that the
-- leaderboard is the least trustworthy number on Strava and the PR is the most
-- useful one, which is the opposite of how most people use them.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'segment-pr-kom-strava',
  'Segment, PR, KOM, dan Local Legend di Strava: Apa Bedanya',
  'Papan peringkat segment adalah angka paling tidak bisa dipercaya di Strava, dan PR Anda sendiri adalah yang paling berguna. Apa arti masing-masing istilah, dan kenapa membandingkan diri dengan orang lain di sana sering menyesatkan.',
  $body$Jawaban singkatnya: **PR adalah angka yang berguna, KOM adalah angka yang menyenangkan, dan papan peringkat segment adalah angka yang paling tidak bisa dipercaya di Strava.**

Ketiganya sering dianggap sejenis. Padahal cuma satu yang benar-benar mengukur sesuatu tentang Anda.

## Istilahnya, satu per satu

**Segment** adalah potongan jalan atau jalur yang dibuat pengguna — tanjakan, jalan lurus, satu tikungan panjang. Sekali dibuat, setiap orang yang melintasinya otomatis masuk ke papan peringkatnya. Anda tidak perlu mendaftar; cukup lewat.

**PR (Personal Record)** adalah waktu tercepat Anda sendiri di segment itu. Ini perbandingan Anda dengan Anda.

**KOM / QOM (King / Queen of the Mountain)** adalah waktu tercepat di antara semua orang. Namanya menyebut gunung, tapi berlaku untuk semua segment, termasuk jalan datar.

**Local Legend** berbeda sendiri, dan sering disalahpahami: ia diberikan kepada orang yang **paling sering** melintasi segment itu dalam 90 hari terakhir — bukan yang paling cepat. Ini penghargaan untuk konsistensi, bukan kecepatan, dan justru lebih relevan bagi kebanyakan orang.

**Best effort** adalah hal lain lagi: waktu atau tenaga terbaik Anda pada durasi atau jarak standar, dihitung dari seluruh riwayat Anda dan tidak terikat pada segment mana pun.

## Kenapa papan peringkat tidak bisa dipercaya

Bukan karena orang curang — meski itu juga terjadi. Karena **segment tidak mengendalikan variabel apa pun.**

- **Angin.** Segment datar sepanjang lima kilometer dengan angin buritan adalah olahraga yang berbeda dari segment yang sama saat angin melawan. Papan peringkat tidak mencatat cuaca.
- **Rombongan.** Menempel di belakang sekelompok pesepeda menghemat tenaga secara besar-besaran. Waktunya masuk ke papan peringkat yang sama dengan orang yang melakukannya sendirian.
- **Lampu merah dan lalu lintas.** Banyak segment perkotaan praktis diundi oleh lampu lalu lintas.
- **GPS.** Titik lokasi bisa melompat, terutama di antara gedung tinggi atau di bawah pepohonan rapat. Waktu segment yang mustahil sering hanya kesalahan perangkat.
- **Kendaraan yang salah unggah.** Perjalanan mobil atau motor yang diunggah sebagai bersepeda akan muncul di papan peringkat sampai ada yang menandainya.
- **Turunan.** Segment menurun lebih mengukur keberanian dan risiko daripada kebugaran. Mengejar KOM di turunan adalah cara yang buruk untuk memperlakukan tubuh Anda.

Artinya orang di atas Anda mungkin bukan lebih kuat. Ia mungkin lewat di hari yang lebih beruntung.

## Yang benar-benar berguna

**PR Anda di segment yang sama, dari waktu ke waktu.** Ini yang mendekati eksperimen terkendali: rute yang sama, tanjakan yang sama, tubuh yang sama. Kalau waktu Anda membaik selama beberapa bulan, itu berarti sesuatu.

Lebih baik lagi kalau Anda melihatnya bersama detak jantung. **Waktu yang sama dengan detak jantung lebih rendah** adalah tanda kemajuan yang lebih jujur daripada sekadar waktu yang lebih cepat, karena ia menunjukkan usaha yang lebih ringan untuk hasil yang sama. Angka-angka lain yang layak diperhatikan ada di [Cara Membaca Data Strava Anda](/blog/cara-membaca-data-strava).

**Local Legend**, kalau Anda mengejar sesuatu. Ia menghargai muncul berulang kali, yang jauh lebih terkendali daripada mengejar waktu tunggal — dan konsistensi memang yang paling berpengaruh untuk kebanyakan orang. Soal itu ada di [Konsistensi Bersepeda](/blog/konsistensi-bersepeda-heatmap-streak).

## Soal keselamatan, dan ini bukan basa-basi

Segment berada di jalan umum yang dipakai orang lain: mobil, motor, pejalan kaki, anjing, anak-anak.

Mengejar KOM berarti mengendarai sepeda secepat mungkin di jalan yang tidak ditutup untuk Anda. Segment menurun dan segment perkotaan yang melewati persimpangan adalah yang paling berbahaya, dan Strava sendiri sudah menghapus sebagian papan peringkat menurun karena alasan ini.

Papan peringkat tidak tahu ada mobil keluar dari gang. Anda yang tahu.

## Cara memakainya dengan waras

Pakai segment sebagai **penanda pribadi**, bukan sebagai kompetisi. Pilih dua atau tiga segment di rute yang sering Anda lewati — sebaiknya menanjak, karena tanjakan lebih tahan terhadap angin dan efek rombongan — lalu pantau waktu Anda sendiri di situ beberapa bulan sekali.

Itu memberi Anda tes kebugaran gratis yang berulang, tanpa membandingkan diri dengan orang yang kondisinya tidak Anda ketahui.

[Ascent](https://ascent-analytics.doniwirawan.xyz) menampilkan segment dan best effort Anda bersama tren lainnya, dihitung di dalam browser Anda dari riwayat Strava Anda sendiri. Ada mode demo kalau ingin melihat dulu. Proyek independen, tidak berafiliasi dengan Strava, Inc.

## FAQ

### KOM di Strava itu apa?

King of the Mountain — waktu tercepat di antara semua orang pada sebuah segment. QOM adalah versi untuk perempuan. Meski namanya menyebut gunung, berlaku juga untuk segment datar.

### Apa bedanya PR dan KOM?

PR adalah rekor Anda sendiri di segment itu; KOM adalah rekor semua orang. PR yang berguna untuk menilai kemajuan Anda.

### Local Legend itu apa?

Penghargaan untuk orang yang paling **sering** melintasi sebuah segment dalam 90 hari terakhir — bukan yang paling cepat. Ini mengukur konsistensi.

### Kenapa waktu segment orang lain terlihat mustahil?

Bisa karena angin buritan, menempel di rombongan, kesalahan GPS, atau perjalanan bermotor yang salah diunggah sebagai bersepeda. Papan peringkat tidak mengendalikan variabel apa pun.

### Apakah aman mengejar KOM?

Segment berada di jalan umum yang tidak ditutup. Segment menurun dan yang melewati persimpangan adalah yang paling berisiko. Perlakukan segment sebagai penanda pribadi, bukan lintasan balap.

### Segment apa yang paling baik dipakai untuk memantau kemajuan?

Segment menanjak di rute yang sering Anda lewati, karena tanjakan lebih tahan terhadap pengaruh angin dan rombongan dibanding jalan datar.

### Apa itu best effort di Strava?

Waktu atau tenaga terbaik Anda pada durasi dan jarak standar, dihitung dari seluruh riwayat Anda, dan tidak terikat pada segment tertentu.$body$,
  true,
  '2026-07-31T15:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-segment-kom.svg'
where slug = 'segment-pr-kom-strava';
