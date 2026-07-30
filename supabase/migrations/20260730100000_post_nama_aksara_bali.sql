-- Blog post: "Menulis Nama dalam Aksara Bali"
--
-- The highest-intent query in the Aksara Bali cluster: people do not search for
-- a transliterator in the abstract, they search because they want to see their
-- own name. The three existing posts explain the system; this one answers the
-- actual errand, and is the natural place for the tattoo warning.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'menulis-nama-dalam-aksara-bali',
  'Menulis Nama Anda dalam Aksara Bali',
  'Mengetik nama ke konverter butuh sepuluh detik. Memastikan hasilnya benar butuh sedikit lebih lama — terutama kalau nama Anda mengandung huruf e, atau huruf yang tidak dimiliki aksara Bali sama sekali.',
  $body$Jawaban singkatnya: buka [Aksara Bali](https://aksarabali.doniwirawan.xyz), ketik nama Anda, dan aksaranya muncul saat itu juga. Gratis, jalan di browser, tanpa akun.

Bagian yang lebih panjang adalah memeriksa apakah hasilnya benar. Nama adalah kasus tersulit untuk alat konversi mana pun, dan alasannya menarik.

## Kenapa nama justru paling sulit

Konverter bekerja jauh lebih baik pada kata biasa, karena kata biasa ada di kamus. Nama tidak.

Kalau Anda mengetik *sekolah*, alatnya tahu kata itu dan tahu vokal mana yang dipakai. Kalau Anda mengetik nama keluarga Anda, ia hanya melihat sederet huruf Latin dan harus menebak — dan ada beberapa hal yang memang tidak bisa ditebak dari huruf Latin saja.

## Empat hal yang perlu Anda periksa

### 1. Huruf `e`, hampir selalu

Dalam ejaan kita, `e` pada *Dewi* dan `e` pada *Gede* bisa saja bunyinya berbeda, tapi ditulis dengan huruf yang sama. Dalam Aksara Bali keduanya tanda yang berbeda: **taling** untuk yang satu, **pepet** untuk yang lain.

Tidak ada informasi di teks Latin yang bisa memberitahu alat mana yang Anda maksud. Ia akan menebak, dan untuk nama tebakan itu kira-kira lima puluh-lima puluh.

**Cara memastikannya: ucapkan nama Anda keras-keras.** Anda tahu bunyinya; alatnya tidak. Kalau hasilnya tidak cocok, itu satu tanda yang perlu diganti, bukan seluruh namanya.

### 2. Huruf yang tidak dimiliki aksara Bali

Tidak ada *v* dalam Aksara Bali. Nama yang ditulis dengan *v* dalam huruf Latin akan ditulis dengan **wa** — jadi *Vina* dan *Wina* keluar identik. Itu bukan kesalahan alatnya; itu memang bagaimana aksara ini bekerja.

Huruf seperti *f*, *q*, *x*, dan *z* juga bukan bunyi asli dalam sistem ini. Nama-nama serapan yang mengandungnya biasanya ditulis dengan pendekatan bunyi terdekat, dan di sinilah konvensi antar-penulis paling banyak berbeda. Kalau nama Anda mengandung huruf-huruf ini, hasil konversi sebaiknya dianggap sebagai usulan, bukan jawaban.

### 3. Nama berakar Sanskerta

Banyak nama di Bali berakar dari Sanskerta atau Jawa Kuno. Kata-kata seperti itu cenderung mempertahankan ejaan aslinya, bukan ditulis ulang mengikuti bunyinya hari ini.

Kalau nama Anda termasuk kategori ini, pilih mode **Sanskerta** di konverternya. Alatnya membawa basis data seratusan istilah Sanskerta, dan mode itu membuatnya berhenti menebak.

### 4. Gelar dan awalan

Nama Bali sering datang bersama penanda seperti **I** dan **Ni**, dan urutan kelahiran seperti **Wayan**, **Made**, **Nyoman**, dan **Ketut**. Semuanya bisa dikonversi seperti bagian nama lainnya — hanya perlu diperiksa satu per satu, karena masing-masing punya ejaan yang sudah mapan dan orang di sekitar Anda kemungkinan besar tahu bentuk yang benar.

## Kalau hasilnya jadi kotak-kotak

Berarti perangkat tempat Anda menempelkan hasilnya belum punya font Aksara Bali. Teksnya sendiri baik-baik saja. Penjelasan lengkapnya ada di [Aksara Bali Anda Jadi Kotak? Ini Sebabnya](/blog/aksara-bali-jadi-kotak-di-hp).

## Sebelum Anda menatokannya

Bagian ini yang paling penting di seluruh tulisan.

**Jangan gunakan hasil konversi untuk tato, prasasti, undangan cetak, papan nama, atau keperluan upacara tanpa diperiksa orang yang benar-benar paham pasang aksara.**

Alasannya bukan karena alatnya buruk. Alasannya adalah karena konvensi transliterasi berbeda antar daerah dan antar ahli, alat ini memilih satu jalur di antaranya, dan huruf `e` di nama Anda adalah tebakan. Tato salah ejaan adalah jenis kesalahan yang tidak bisa dibatalkan dengan tombol undo.

Cara memeriksanya tidak sulit: tunjukkan hasilnya ke guru bahasa Bali, penyuluh bahasa Bali di kabupaten Anda, atau siapa pun di keluarga yang belajar aksara di sekolah. Sepuluh menit percakapan itu jauh lebih murah daripada penyesalan permanen.

Untuk belajar, mencoba, memposting, dan memahami cara kerjanya — silakan pakai sepuasnya. Itu memang gunanya. Ketik nama Anda, lihat ke mana tanda vokalnya menempel, ubah satu huruf, lihat apa yang bergeser. Cara itu mengajarkan sistemnya jauh lebih cepat daripada tabel aksara.

Latar belakang cara kerjanya ada di [How a Balinese Script Translator Actually Works](/blog/how-a-balinese-script-translator-works), dan langkah praktisnya di [Cara Translate Latin ke Aksara Bali Online](/blog/cara-translate-latin-ke-aksara-bali).

## FAQ

### Bagaimana cara menulis nama saya dalam aksara Bali?

Ketik nama Anda di [konverter Aksara Bali](https://aksarabali.doniwirawan.xyz), lalu periksa hasilnya — terutama huruf `e`, dan huruf yang tidak dimiliki aksara Bali seperti *v*, *f*, *q*, *x*, dan *z*.

### Kenapa nama saya terlihat berbeda dari tulisan tangan teman saya?

Paling sering karena huruf `e`: pepet dipakai ketika yang Anda maksud taling, atau sebaliknya. Penyebab kedua adalah nama berakar Sanskerta yang mempertahankan ejaan aslinya.

### Apakah huruf V ada dalam aksara Bali?

Tidak. Nama yang mengandung *v* ditulis dengan **wa**, sehingga *Vina* dan *Wina* menghasilkan aksara yang sama.

### Bolehkah hasilnya langsung dipakai untuk tato?

Sebaiknya tidak, tanpa diperiksa orang yang paham pasang aksara. Konvensi transliterasi berbeda-beda dan huruf `e` pada nama adalah hasil tebakan. Tato tidak bisa dibatalkan.

### Apakah gratis dan perlu daftar akun?

Gratis, dan konverternya tidak perlu akun. Semuanya diproses di browser Anda dan tidak ada yang dikirim ke mana pun.

### Bisakah hasilnya dipakai untuk desain undangan?

Untuk draf dan eksplorasi, ya. Untuk yang benar-benar dicetak, mintalah orang yang paham aksara memeriksanya lebih dulu, dan pastikan berkas desainnya membawa fontnya atau teksnya sudah diubah menjadi outline.$body$,
  true,
  '2026-07-30T20:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-nama-aksara.svg'
where slug = 'menulis-nama-dalam-aksara-bali';
