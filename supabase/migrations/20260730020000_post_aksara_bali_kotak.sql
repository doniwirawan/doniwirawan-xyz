-- Blog post: "Aksara Bali Anda Jadi Kotak? Ini Sebabnya"
--
-- The third of the Aksara Bali set, and the one the other two hand off to. It
-- answers the question people actually hit right after converting: the tofu
-- boxes. Also the only place the Bali Simbar problem is written down, which is
-- the more damaging half of the story.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'aksara-bali-jadi-kotak-di-hp',
  'Aksara Bali Anda Jadi Kotak? Ini Sebabnya',
  'Kotak-kotak kosong itu bukan berarti teksnya rusak — perangkat Anda hanya belum punya fontnya. Penjelasan singkat soal Unicode, font warisan seperti Bali Simbar, dan cara memastikan tulisan Anda bertahan.',
  $body$Jawaban singkatnya: teks Anda kemungkinan besar baik-baik saja. Yang tidak ada adalah **fontnya**.

Kotak kosong itu punya nama sendiri: *tofu*. Itu yang digambar sebuah aplikasi ketika ia menerima karakter yang sah tetapi tidak punya satu pun bentuk huruf untuk menampilkannya. Karakternya tetap ada, tetap bisa dicari, tetap bisa disalin. Hanya tidak bisa digambar.

## Kenapa ini sering terjadi pada Aksara Bali

Aksara Bali punya bloknya sendiri di Unicode, U+1B00 sampai U+1B7F, yang masuk sejak Unicode 5.0 pada 2006. Standarnya sudah lama ada.

Yang tidak otomatis ada adalah fontnya. Windows, iOS, dan sebagian besar Android tidak memaketkan font Aksara Bali secara bawaan. Latin, Arab, Tionghoa, Jepang — hampir selalu ada. Aksara daerah Indonesia: tergantung nasib.

Jadi urutan kejadiannya biasanya begini. Anda konversi di [Aksara Bali](https://aksarabali.doniwirawan.xyz), aksaranya tampil rapi di situs itu — karena situsnya memang membawa font Noto Sans Balinese sendiri — lalu Anda tempel ke WhatsApp atau Word, dan berubah jadi deretan kotak. Bukan hasil konversinya yang salah. Aplikasi tujuannya yang tidak punya fontnya.

## Cara memperbaikinya

**Di komputer:** pasang fontnya. Noto Sans Balinese dan Noto Serif Balinese tersedia gratis dari Google Fonts. Unduh, buka berkasnya, pasang, lalu **buka ulang** aplikasi yang tadi menampilkan kotak — kebanyakan aplikasi hanya memindai daftar font saat dijalankan.

**Di ponsel:** ini lebih sulit, dan jujur saja sering tidak bisa. Android dan iOS umumnya tidak mengizinkan pemasangan font sistem tanpa akses khusus. Beberapa merek Android sudah menyertakan Noto Balinese, banyak yang belum. Kalau ponsel Anda termasuk yang belum, jalan yang realistis adalah memakai aplikasi yang membawa fontnya sendiri — [aplikasi Android Aksara Bali](https://play.google.com/store/apps/details?id=xyz.doniwirawan.aksara_bali_mobile) memaketkan Noto Sans Balinese, jadi tampilannya benar terlepas dari apa yang ada di sistem.

**Untuk desain dan cetak:** pasang fontnya di komputer, lalu sematkan font itu ke berkas atau ubah teksnya menjadi *outline* sebelum dikirim ke percetakan. Kalau tidak, mesin di sana akan melihat kotak yang sama.

## Kotak versus teks yang memang bukan teks

Ada satu kasus di mana masalahnya bukan font: **font warisan non-Unicode**.

Sebelum Aksara Bali masuk Unicode, cara umum menulisnya adalah dengan font seperti Bali Simbar, yang memetakan bentuk aksara Bali ke posisi karakter Latin. Anda mengetik `k`, layar menampilkan aksara *ka*. Kelihatannya benar, dan untuk zamannya itu solusi yang cerdas.

Masalahnya, di dalam berkas itu tetap huruf `k`. Bukan aksara Bali. Komputer tidak tahu ada aksara Bali di situ sama sekali.

Akibatnya berantai: teks itu tidak bisa dicari, tidak terbaca pembaca layar, tidak bisa disalin ke tempat lain tanpa membawa font yang sama persis, dan tidak akan pernah dikenali mesin pencari sebagai aksara Bali. Ganti fontnya ke font lain dan yang muncul bukan kotak, melainkan huruf Latin acak yang tidak ada artinya.

Itu cara membedakannya, dan cukup diingat satu kalimat ini: **kotak berarti teksnya benar tapi fontnya kurang; huruf Latin acak berarti teksnya memang bukan aksara Bali.**

Kalau Anda mewarisi berkas lama berisi teks Bali Simbar, teks itu perlu diketik ulang atau dikonversi. Tidak ada cara membalikkannya secara otomatis dengan andal.

## Kenapa ini penting

Satu papan nama bisa saja pakai gambar dan selesai. Tapi arsip desa, situs web, dokumen, dan tulisan yang Anda ingin masih terbaca sepuluh tahun lagi — semuanya bergantung pada teks yang benar-benar teks.

Sejak [Pergub Bali No. 80 Tahun 2018](https://jdih.baliprov.go.id/produk-hukum/peraturan/abstrak/24665), aksara Bali wajib ditulis di atas huruf Latin pada papan nama kantor, jalan, bangunan, dan fasilitas umum. Aturan itu menghasilkan sangat banyak aksara Bali baru di ruang publik. Kalau semuanya lahir sebagai gambar atau sebagai teks Bali Simbar, dari sisi komputer aksara itu tetap tidak ada.

Itu sebabnya konverter saya mengeluarkan Unicode, bukan gambar. Kotak-kotak memang menjengkelkan, tapi bisa diperbaiki dengan memasang font. Teks yang sebenarnya bukan teks tidak bisa diperbaiki tanpa mengetik ulang semuanya.

Kalau Anda sampai di sini karena baru saja mengonversi sesuatu, langkah dan kesalahan yang umum saya tulis di [Cara Translate Latin ke Aksara Bali Online](/blog/cara-translate-latin-ke-aksara-bali).

## FAQ

### Kenapa aksara Bali tampil benar di satu aplikasi tapi jadi kotak di aplikasi lain?

Karena font dicari per aplikasi. Browser dan aplikasi modern bisa mengunduh font web sendiri; aplikasi lain bergantung sepenuhnya pada font yang terpasang di sistem.

### Font apa yang sebaiknya dipasang?

Noto Sans Balinese atau Noto Serif Balinese dari Google Fonts. Keduanya gratis dan mengikuti Unicode.

### Apakah teks saya rusak kalau tampil sebagai kotak?

Tidak. Salin dan tempel ke perangkat yang punya fontnya, dan aksaranya muncul utuh.

### Bagaimana cara tahu teks lama saya Unicode atau Bali Simbar?

Ganti fontnya menjadi Arial atau font Latin biasa. Kalau muncul kotak — atau aksara Bali yang tetap tampil benar — teksnya Unicode. Kalau muncul huruf Latin acak, teksnya font warisan dan perlu diketik ulang.

### Apakah ada cara menghindari masalah ini sama sekali?

Untuk keperluan tampilan, ubah teks menjadi outline atau gambar setelah tata letaknya jadi. Untuk arsip dan web, simpan tetap sebagai teks Unicode dan biarkan pembaca yang memasang fontnya. Yang pertama menjaga tampilan, yang kedua menjaga isinya.

### Blok Unicode aksara Bali yang mana?

U+1B00 sampai U+1B7F, ditambahkan pada Unicode 5.0 tahun 2006. Kalau sebuah alat mengaku menghasilkan aksara Bali tapi keluarannya tidak berada di rentang itu, keluarannya bukan aksara Bali.$body$,
  true,
  '2026-07-30T11:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-aksara-kotak.svg'
where slug = 'aksara-bali-jadi-kotak-di-hp';
