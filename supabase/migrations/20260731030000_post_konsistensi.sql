-- Blog post: "Konsistensi Bersepeda"
--
-- Uses the two remaining Ascent screenshots, and covers the axis Eddington does
-- not: Eddington measures repeated distance, this measures repeated days. Ships
-- with its images inline rather than in a follow-up migration.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'konsistensi-bersepeda-heatmap-streak',
  'Konsistensi Bersepeda: Yang Ditunjukkan Heatmap dan Streak Anda',
  'Empat perjalanan seminggu selama sebulan mengalahkan satu perjalanan raksasa, dan grafik setahun penuh menunjukkannya dalam sekali lihat. Cara membaca heatmap kalender, apa arti streak, dan kapan streak justru merugikan.',
  $body$Jawaban singkatnya: **konsistensi mengalahkan intensitas untuk hampir semua orang yang bersepeda bukan untuk lomba** — dan cara tercepat melihat konsistensi Anda sendiri adalah grafik setahun penuh, bukan daftar aktivitas.

Angka bulanan menyembunyikan bentuknya. Empat ratus kilometer sebulan bisa berarti enam belas perjalanan yang rapi, atau tiga perjalanan besar dengan tiga minggu kosong di antaranya. Keduanya terlihat sama di ringkasan, dan sangat berbeda di kaki Anda.

## Heatmap kalender: setahun dalam sekali lihat

Bentuknya kotak-kotak kecil, satu per hari, makin gelap makin sedikit dan makin terang makin banyak. Anda mungkin mengenalnya dari grafik kontribusi GitHub.

<figure>
  <img src="/images/blog/ascent/calSection.png" alt="Kalender aktivitas 12 bulan di Ascent: 82 aktivitas, 64 hari aktif, streak 5 hari, dan kisi kotak harian yang menunjukkan bulan-bulan padat dan bulan-bulan kosong." width="1360" height="840" loading="lazy">
  <figcaption>Empat angka dan satu kisi. Bulan kosong langsung terlihat. Tangkapan layar mode demo — data contoh, bukan akun sungguhan.</figcaption>
</figure>

Yang langsung terbaca dari bentuknya:

- **Baris kosong panjang** — bulan yang hilang. Biasanya ada ceritanya: musim hujan, pekerjaan, sakit, atau kehilangan minat setelah target tercapai.
- **Gerombolan padat lalu jeda** — pola "semangat lalu padam". Umum, dan biasanya tanda beban dinaikkan terlalu cepat sampai tubuh atau jadwal menyerah.
- **Sebaran merata** — yang Anda inginkan, meski tiap kotaknya kecil.
- **Selalu hari yang sama** — misalnya hanya akhir pekan. Bukan masalah, tapi berguna disadari kalau Anda bertanya-tanya kenapa kemajuannya lambat.

Perhatikan juga **hari aktif** dibanding **jumlah aktivitas**. Kalau aktivitasnya jauh lebih banyak daripada hari aktifnya, Anda sering menumpuk dua aktivitas dalam sehari dan mengambil libur lebih banyak dari yang Anda kira.

## Streak: berguna sampai titik tertentu

Streak — jumlah hari berturut-turut — adalah alat motivasi yang sangat efektif. Tidak ingin memutus rantai adalah dorongan yang nyata, dan untuk orang yang kesulitan memulai, itu berharga.

Tapi streak punya sisi gelap yang jarang dibicarakan: **ia menghukum hari istirahat.**

Pemulihan bukan jeda dari latihan. Pemulihan adalah bagian dari latihan — di situlah adaptasi terjadi. Sistem yang membuat Anda merasa gagal karena beristirahat sedang mendorong Anda ke arah yang salah, terutama saat Anda sedang sakit, kurang tidur, atau baru menaikkan beban.

Cara memakainya dengan waras: **jadikan streak sebagai catatan, bukan aturan.** Kalau Anda ingin target berbasis kebiasaan, "empat hari aktif per minggu" jauh lebih sehat daripada "setiap hari tanpa putus", karena ia mengizinkan istirahat tanpa membuat Anda merasa kalah.

## Heatmap peta: ke mana Anda benar-benar pergi

Jenis heatmap yang berbeda, dan mengejutkan dengan caranya sendiri: semua rute Anda ditumpuk di satu peta.

<figure>
  <img src="/images/blog/ascent/heatSection.png" alt="Heatmap peta di Ascent menampilkan seluruh rute aktivitas ditumpuk di atas peta Bali, dengan gerombolan padat di sekitar Denpasar dan jalur menuju daerah pegunungan." width="1360" height="840" loading="lazy">
  <figcaption>Semua rute ditumpuk. Gerombolan padat adalah jalan yang itu-itu saja. Tangkapan layar mode demo.</figcaption>
</figure>

Hampir semua orang menemukan hal yang sama: **beberapa gumpalan sangat padat, dan sisanya kosong.** Kita jauh lebih terpaku pada rute yang sama daripada yang kita kira.

Itu bukan kesalahan — rute yang dikenal itu aman, terukur, dan tidak butuh dipikirkan. Tapi kalau Anda merasa bosan atau merasa mandek, peta itu biasanya menjelaskan kenapa, dan menunjukkan ke arah mana jalan yang belum pernah Anda ambil.

Catatan privasi yang sama seperti biasa: peta yang selalu berpusat di rumah Anda menunjukkan di mana Anda tinggal. Pakai zona privasi Strava kalau Anda membagikannya.

## Apa yang benar-benar layak dikejar

Kalau Anda ingin satu target konsistensi, ini yang menurut saya paling masuk akal untuk kebanyakan orang:

**Jumlah hari aktif per minggu, dirata-ratakan sebulan.** Bukan jarak, bukan kecepatan, bukan streak. Tiga sampai empat hari aktif per minggu yang dipertahankan selama enam bulan akan mengalahkan hampir semua rencana ambisius yang bertahan tiga minggu.

Dan kalau Anda ingin ukuran konsistensi pada jarak yang lebih panjang, itu justru yang diukur [Eddington number](/blog/eddington-number-bersepeda) — angka yang tidak bisa dikarang oleh satu perjalanan besar.

Keduanya, plus heatmap dan kalender di atas, dihitung [Ascent](https://ascent-analytics.doniwirawan.xyz) dari riwayat Strava Anda, di dalam browser Anda sendiri. Ada mode demo kalau ingin melihat dulu.

## FAQ

### Lebih baik sering bersepeda jarak pendek atau sesekali jarak jauh?

Untuk kebanyakan orang yang tidak berlomba, lebih sering dengan jarak lebih pendek. Konsistensi membangun adaptasi dan kebiasaan; perjalanan besar sesekali sulit dipulihkan dan mudah ditinggalkan.

### Apa itu heatmap kalender?

Grafik yang menampilkan satu kotak per hari selama setahun, dengan warna sesuai banyaknya aktivitas hari itu. Berguna karena pola tahunan terlihat sekaligus, bukan satu per satu.

### Apakah streak bersepeda bagus?

Sebagai motivasi, ya. Sebagai aturan, hati-hati — streak menghukum hari istirahat, padahal pemulihan adalah bagian dari latihan. Target berbasis hari aktif per minggu lebih sehat.

### Berapa hari seminggu sebaiknya bersepeda?

Tiga sampai empat hari aktif per minggu yang bisa Anda pertahankan berbulan-bulan lebih berharga daripada rencana enam hari yang bertahan tiga minggu.

### Kenapa rute saya itu-itu saja di heatmap peta?

Karena rute yang dikenal terasa aman dan tidak butuh dipikirkan. Itu wajar. Peta itu berguna justru saat Anda merasa bosan, karena ia menunjukkan arah yang belum pernah diambil.

### Apakah Strava punya heatmap kalender?

Sebagian tampilan tahunan ada di balik langganan. Ascent menghitung kalender, streak, dan heatmap peta dari data yang sama secara gratis di browser Anda.$body$,
  true,
  '2026-07-31T12:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-konsistensi.svg'
where slug = 'konsistensi-bersepeda-heatmap-streak';
