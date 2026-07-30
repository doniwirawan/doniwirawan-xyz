-- Blog post: "Cara Membaca Data Strava Anda"
--
-- The entry point of the Ascent cluster: people have the data already and do not
-- know which numbers matter. Deliberately spends half its length on the numbers
-- Strava shows badly or not at all, since that is the honest reason to use
-- anything on top of it.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'cara-membaca-data-strava',
  'Cara Membaca Data Strava Anda (dan Angka yang Sebenarnya Penting)',
  'Strava menampilkan puluhan angka per aktivitas, dan sebagian besar tidak memberi tahu apa pun yang berguna. Mana yang benar-benar penting, mana yang menyesatkan, dan apa yang tidak ditampilkan sama sekali.',
  $body$Jawaban singkatnya: dari puluhan angka yang ditampilkan Strava per aktivitas, yang benar-benar berguna untuk keputusan latihan cuma segelintir — dan beberapa angka yang paling sering dipamerkan justru yang paling menyesatkan.

Tulisan ini soal mana yang mana.

## Angka yang menyesatkan

**Kecepatan rata-rata.** Angka paling sering dibandingkan orang, dan hampir tidak ada artinya di luar konteks. Kecepatan Anda ditentukan angin, tanjakan, lampu merah, jenis ban, dan apakah Anda menempel di belakang orang lain. Membandingkan kecepatan rata-rata antar-perjalanan yang berbeda rutenya sama saja dengan tidak membandingkan apa pun.

**Kecepatan maksimum.** Ini pada dasarnya laporan tentang seberapa curam turunan yang Anda lewati. Ia juga sering rusak karena kesalahan GPS — jika titik lokasi melompat, kecepatan maksimum ikut melompat.

**Elevasi, sampai batas tertentu.** Angka elevasi bervariasi antar-perangkat, dan perangkat dengan barometer memberi hasil yang berbeda dari yang mengandalkan GPS saja. Bandingkan elevasi antar-perjalanan Anda sendiri dengan perangkat yang sama, jangan antar-orang.

**Kalori.** Ini estimasi di atas estimasi. Berguna sebagai perbandingan kasar antar-perjalanan Anda sendiri, tidak lebih.

## Angka yang benar-benar berguna

**Moving time, bukan elapsed time.** Waktu bergerak adalah beban latihan Anda yang sebenarnya. Waktu total mencakup berhenti di warung kopi, dan itu bukan latihan.

**Distribusi zona.** Berapa lama Anda berada di setiap zona intensitas. Ini yang memberi tahu apakah perjalanan tadi benar-benar perjalanan endurance atau sebenarnya latihan tempo yang menyamar. Penjelasan zonanya ada di [Zona Latihan Bersepeda](/blog/zona-latihan-bersepeda-heart-rate-ftp).

**Kadens.** Berapa putaran per menit yang Anda kayuh. Kadens rendah dengan gir berat memindahkan beban dari sistem kardio ke sendi lutut, dan ini salah satu penyebab nyeri lutut yang paling mudah diperbaiki.

**Heart rate rata-rata dibandingkan dengan perjalanan serupa.** Ini bukan soal angkanya, tapi soal perubahannya. Rute yang sama dengan detak jantung lebih rendah pada kecepatan yang sama berarti Anda membaik. Rute yang sama dengan detak jantung lebih tinggi berarti Anda lelah, kepanasan, atau mulai sakit.

**Normalized power, kalau Anda punya power meter.** Ia memperhitungkan bahwa usaha yang naik-turun lebih melelahkan daripada usaha yang rata, sehingga menggambarkan beban perjalanan bergelombang jauh lebih jujur daripada power rata-rata.

## Yang tidak terlihat dari satu aktivitas

Ini bagian yang paling sering dilewat, dan yang paling penting.

Satu aktivitas hampir tidak memberi tahu apa-apa. Yang memberi tahu adalah **pola antar-minggu dan antar-bulan**:

- Apakah jarak mingguan Anda naik terlalu cepat? Lonjakan beban mendadak adalah penyebab cedera yang jauh lebih umum daripada setelan sepeda.
- Apakah hari mudah Anda benar-benar mudah, atau sebenarnya zona 3 semua?
- Apakah ada pola musiman — bulan yang selalu kosong, hari yang selalu terlewat?
- Apakah konsistensi Anda membaik, atau Anda hanya sesekali melakukan perjalanan besar lalu menghilang dua minggu?

Strava menyimpan semua data untuk menjawab ini, tapi tidak menyusunnya seperti itu. Tampilannya berpusat pada satu aktivitas, dan pada perbandingan dengan orang lain.

## Yang Strava tidak tampilkan sama sekali

Beberapa angka yang menurut saya paling menarik justru tidak ada di sana:

- **Eddington number** — satu angka yang menggambarkan konsistensi jauh lebih jujur daripada total jarak. Saya tulis terpisah soal ini di [Eddington Number](/blog/eddington-number-bersepeda).
- **Heatmap kalender** yang menunjukkan setahun penuh sekaligus, sehingga polanya terlihat langsung.
- **Perbandingan zona antar-bulan**, bukan per aktivitas.

Itu sebagian alasan saya membangun [Ascent](https://ascent-analytics.doniwirawan.xyz): menyambung ke akun Strava Anda dan menyusun ulang data yang sudah Anda miliki menjadi tren, heatmap, dan angka-angka yang tidak ditampilkan di aplikasi aslinya. Semuanya berjalan di browser Anda — data diambil langsung dari Strava oleh peramban Anda dan tidak melewati server saya. Ada mode demo kalau Anda ingin melihat-lihat dulu tanpa menyambungkan akun.

## Kebiasaan yang layak dibangun

**Bandingkan diri Anda dengan diri Anda, bukan dengan orang lain.** Segment leaderboard menyenangkan, tapi orang di atas Anda mungkin sepuluh tahun lebih muda, berlatih dua kali lebih banyak, atau melintas saat angin sedang mendorong dari belakang.

**Lihat tren mingguan, bukan aktivitas tunggal.** Satu perjalanan buruk tidak berarti apa-apa. Empat minggu tren menurun berarti sesuatu.

**Catat konteksnya.** Kurang tidur, sedang stres, cuaca panas — tulis di deskripsi aktivitas. Tiga bulan kemudian, itulah yang menjelaskan kenapa angka hari itu terlihat aneh.

## FAQ

### Angka apa yang paling penting di Strava?

Moving time, distribusi zona, kadens, dan tren heart rate pada rute yang serupa. Kecepatan rata-rata jauh kurang berguna daripada yang orang kira.

### Kenapa kecepatan rata-rata tidak bisa dijadikan patokan?

Karena sangat dipengaruhi angin, tanjakan, lampu merah, dan apakah Anda bersepeda dalam rombongan. Dua perjalanan dengan rute berbeda praktis tidak bisa dibandingkan lewat angka ini.

### Apa bedanya moving time dan elapsed time?

Moving time hanya menghitung saat Anda bergerak; elapsed time menghitung seluruh durasi termasuk berhenti. Untuk menilai beban latihan, moving time yang relevan.

### Kenapa data elevasi berbeda antar perangkat?

Karena perangkat dengan barometer mengukur berbeda dari yang hanya mengandalkan GPS. Bandingkan elevasi antar-perjalanan Anda sendiri dengan perangkat yang sama.

### Apakah perlu berlangganan Strava untuk melihat analisis?

Sebagian analisis Strava ada di balik langganan. Ascent membaca data yang sama lewat API Strava dan menampilkan tren, heatmap, dan Eddington number secara gratis di browser Anda.

### Apakah aman menyambungkan akun Strava ke aplikasi pihak ketiga?

Perhatikan izin yang diminta dan apakah datanya melewati server pihak ketiga. Ascent berjalan sepenuhnya di browser Anda, sumbernya terbuka, dan aksesnya bisa Anda cabut kapan saja dari pengaturan Strava.$body$,
  true,
  '2026-07-30T22:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-baca-strava.svg'
where slug = 'cara-membaca-data-strava';
