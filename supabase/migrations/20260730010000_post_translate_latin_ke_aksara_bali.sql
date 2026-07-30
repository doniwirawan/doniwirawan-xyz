-- Blog post: "Cara Translate Latin ke Aksara Bali Online"
--
-- The Indonesian half of the same search demand: "translate latin ke aksara
-- bali", "latin ke aksara bali", "aksara bali online", "menulis aksara bali
-- online". Practical rather than explanatory — the English post covers the how
-- and the why, this one is the steps and the four things that go wrong.
--
-- lang is set explicitly: the column defaults to 'en', and this is Indonesian.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'cara-translate-latin-ke-aksara-bali',
  'Cara Translate Latin ke Aksara Bali Online',
  'Panduan singkat mengubah tulisan Latin ke Aksara Bali lewat browser: langkahnya, empat kesalahan yang paling sering muncul, dan cara memeriksa hasilnya sebelum dipakai.',
  $body$Jawaban singkatnya: buka [Aksara Bali](https://aksarabali.doniwirawan.xyz), ketik teks Latin Anda di kolom input, dan aksaranya muncul langsung di sebelahnya. Gratis, jalan di browser, tanpa akun, dan tidak ada yang dikirim ke mana pun.

Bagian yang lebih panjang adalah memastikan hasilnya benar. Itu isi tulisan ini.

## Langkah-langkahnya

1. Buka [aksarabali.doniwirawan.xyz](https://aksarabali.doniwirawan.xyz) di HP atau laptop.
2. Ketik teks Latin di kolom input. Konversinya berjalan huruf demi huruf, jadi Anda melihat aksaranya terbentuk sambil mengetik.
3. Pilih mode kalau perlu: **auto-detect**, **Sanskerta saja**, atau **Bali saja**. Untuk nama orang dan kata sehari-hari, auto sudah cukup. Untuk mantra, nama pura, atau istilah keagamaan, pilih Sanskerta.
4. Tekan tombol salin. Hasilnya teks Unicode sungguhan — bukan gambar — jadi bisa ditempel ke dokumen, caption, atau berkas desain.
5. Periksa. Selalu periksa. Empat hal di bawah ini yang paling sering meleset.

## Empat kesalahan yang paling sering terjadi

### 1. Huruf `e` yang sebenarnya ada dua

Dalam ejaan kita, `e` pada *sate* dan `e` pada *empat* ditulis persis sama. Dalam Aksara Bali keduanya tanda yang berbeda: yang satu **taling**, yang satu **pepet**.

Alat konversi mana pun harus menebak di sini, karena informasinya memang tidak ada di teks Latin. Untuk kata umum tebakannya biasanya benar. Untuk nama keluarga, tebakan itu lima puluh-lima puluh. Kalau nama Anda mengandung `e`, ini karakter pertama yang harus dicek.

### 2. `ng` dan `ny` bukan dua huruf

*nga* dan *nya* masing-masing satu aksara, bukan gabungan n + g atau n + y. Dan `ng` di akhir kata bukan huruf sama sekali, melainkan tanda bernama **cecek** yang duduk di atas suku kata sebelumnya. Ini biasanya sudah ditangani otomatis. Kalau hasilnya terasa aneh, coba pisahkan suku katanya dan lihat bagian mana yang berubah.

### 3. Konsonan yang menumpuk

Dalam *sastra*, `s` dan `t` bertemu tanpa vokal di antaranya. Aksara Bali tidak membiarkan konsonan telanjang di tengah kata: huruf kedua turun ke bawah sebagai **gantungan**, atau menempel di sampingnya sebagai **gempelan**.

**Adeg-adeg** — tanda yang mematikan vokal bawaan — secara konvensi dipakai di akhir kata, bukan di tengahnya. Kalau Anda melihat adeg-adeg nongol di tengah kata pada hasil konversi, itu bagian yang perlu diperbaiki manual.

### 4. Kata serapan Sanskerta

*Dharma*, *yadnya*, *swastyastu* — kata serapan cenderung mempertahankan ejaan aslinya, bukan ditulis ulang mengikuti bunyinya hari ini. Tidak ada cara menebaknya dari huruf Latin saja; harus tahu katanya. Konverternya membawa basis data seratusan istilah Sanskerta untuk kasus ini, dan mode **Sanskerta** membuatnya berhenti menebak.

Satu catatan yang sering dikira bug: `v` dan `w` diperlakukan sama, karena Aksara Bali memang tidak punya *v*. *Vishnu* dan *Wisnu* keluar identik. Itu memang jawabannya.

## Kalau hasilnya jadi kotak-kotak

Berarti perangkat tempat Anda menempelkan teksnya belum punya font Aksara Bali. Teksnya sendiri baik-baik saja — hanya tidak ada bentuk huruf untuk digambar. Saya tulis terpisah soal ini: [Aksara Bali Anda Jadi Kotak? Ini Sebabnya](/blog/aksara-bali-jadi-kotak-di-hp).

## Kapan sebaiknya jangan langsung pakai hasilnya

Untuk papan nama resmi, undangan cetak, prasasti, keperluan upacara, atau tato — jangan pakai hasil konversi tanpa diperiksa orang yang benar-benar paham pasang aksara.

Konvensi transliterasi berbeda antar daerah dan antar ahli, dan alat ini memilih satu jalur di antaranya. Untuk papan nama publik di Bali ada aturannya sendiri: [Pergub Bali No. 80 Tahun 2018](https://jdih.baliprov.go.id/produk-hukum/peraturan/abstrak/24665) mengatur bahwa aksara Bali ditulis **di atas** huruf Latin pada papan nama kantor, jalan, bangunan, dan fasilitas umum. Jadi bukan cuma soal ejaannya benar, tapi juga tata letaknya.

Alat ini dibuat untuk belajar. Ketik nama Anda, lihat ke mana tanda vokalnya menempel, ubah satu huruf, lihat apa yang bergeser. Buat saya itu jauh lebih cepat daripada menghafal tabel aksara. Kalau Anda ingin tahu apa yang sebenarnya terjadi di balik kolom input itu, versi panjangnya ada di [How a Balinese Script Translator Actually Works](/blog/how-a-balinese-script-translator-works).

## FAQ

### Apakah ini menerjemahkan bahasa Indonesia ke bahasa Bali?

Bukan. Yang diubah tulisannya, bukan bahasanya. Kalau Anda mengetik kalimat Indonesia, hasilnya kalimat Indonesia yang ditulis dengan aksara Bali. Menariknya, itu justru yang diminta Pergub 80/2018 untuk papan nama: bahasanya tetap Indonesia, aksaranya Bali.

### Perlu bayar atau daftar akun?

Tidak. Konverternya gratis dan tanpa akun. Akun baru dipakai kalau Anda ingin menyimpan skor kuis dan riwayat latihan.

### Bisa dipakai offline?

Bisa. Versi webnya bisa dipasang sebagai PWA, dan ada [aplikasi Android](https://play.google.com/store/apps/details?id=xyz.doniwirawan.aksara_bali_mobile) yang jalan sepenuhnya offline, lengkap dengan kuis, latihan menulis, dan referensi aksara.

### Bagaimana cara mengetik langsung dengan aksara Bali?

Ada papan ketik Aksara Bali di halaman latihan, dengan tab terpisah untuk aksara wianjana, pangangge, dan tanda baca.

### Hasilnya bisa dipakai untuk desain?

Bisa. Hasilnya teks Unicode, jadi bisa ditempel ke aplikasi desain selama fontnya tersedia di komputer Anda. Aplikasi Androidnya juga bisa mengekspor PNG transparan.

### Apakah hasilnya pasti benar?

Tidak ada alat konversi yang bisa menjanjikan itu, termasuk yang saya buat. Untuk belajar dan keperluan sehari-hari, hasilnya sangat membantu. Untuk sesuatu yang permanen, mintalah orang yang paham pasang aksara memeriksanya dulu.$body$,
  true,
  '2026-07-30T10:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-latin-ke-aksara.svg'
where slug = 'cara-translate-latin-ke-aksara-bali';
