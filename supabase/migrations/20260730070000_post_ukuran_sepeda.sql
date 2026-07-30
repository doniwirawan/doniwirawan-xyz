-- Blog post: "Ukuran Sepeda Sesuai Tinggi Badan"
--
-- The step before bike fitting, and the one with the most search volume in the
-- whole cluster. Deliberately ends by handing off to the fit posts: a frame size
-- is a one-time decision, the fit is the thing you keep adjusting.
--
-- No table: /js/tables.js turns post tables into charts, and a height-to-size
-- lookup is not a thing anyone wants plotted.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'ukuran-sepeda-sesuai-tinggi-badan',
  'Ukuran Sepeda Sesuai Tinggi Badan (dan Kenapa Tabel Itu Sering Salah)',
  'Tabel ukuran frame memberi Anda titik awal, bukan jawaban. Inseam lebih menentukan daripada tinggi badan, reach adalah satu-satunya hal yang tidak bisa diperbaiki setelah membeli, dan dua orang setinggi sama bisa butuh ukuran berbeda.',
  $body$Jawaban singkatnya: **tabel ukuran frame berdasarkan tinggi badan adalah titik awal yang layak, dan hanya itu.** Yang lebih menentukan adalah panjang tungkai dan panjang badan Anda — dan dua orang dengan tinggi persis sama bisa membutuhkan ukuran frame yang berbeda.

Kalau Anda sedang memilih sepeda dan sudah menemukan tabel "tinggi 170 cm → frame 54", tulisan ini menjelaskan kenapa angka itu benar untuk sebagian orang dan meleset untuk sebagian lainnya.

## Kisaran kasar, dengan semua peringatannya

Untuk sepeda road, ukuran frame biasanya ditulis dalam sentimeter (panjang seat tube) atau huruf S/M/L. Kisaran yang umum dipakai:

- **155–165 cm** → sekitar 48–50, atau XS/S
- **165–172 cm** → sekitar 51–53, atau S
- **172–178 cm** → sekitar 54–55, atau M
- **178–185 cm** → sekitar 56–58, atau L
- **185–192 cm** → sekitar 58–60, atau XL

Sekarang peringatannya. **Setiap merek mengukur berbeda.** Frame 54 dari satu merek bisa setara 56 dari merek lain, karena geometri modern tidak lagi seragam dan banyak merek sudah pindah ke S/M/L justru karena angka sentimeter menyesatkan. Jangan pernah memesan berdasarkan angka saja tanpa melihat tabel geometri merek yang bersangkutan.

## Kenapa tinggi badan bukan ukuran yang tepat

Tinggi badan adalah jumlah dari dua hal yang sepeda perlakukan sangat berbeda: **panjang tungkai** dan **panjang badan plus lengan**.

Dua orang setinggi 175 cm bisa sangat berbeda. Yang satu berkaki panjang dan bertubuh pendek; yang satu sebaliknya. Orang pertama butuh seatpost lebih tinggi tapi jangkauan ke setang yang lebih pendek. Orang kedua kebalikannya. Tabel yang hanya bertanya tinggi badan tidak tahu apa-apa soal ini.

Karena itu, kalau Anda hanya bisa mengukur satu hal, ukur **inseam**: berdiri tanpa sepatu dengan punggung menempel dinding, jepit buku di selangkangan setinggi mungkin, lalu ukur dari lantai ke atas buku. Angka itu lebih berguna daripada tinggi badan Anda, dan juga yang dipakai untuk memperkirakan tinggi sadel.

## Yang bisa diperbaiki, dan yang tidak

Ini bagian yang paling penting saat memilih ukuran, dan yang paling sering dilewat.

**Bisa diperbaiki setelah membeli:** tinggi sadel, maju-mundur sadel, tinggi setang (lewat spacer dan arah stem), panjang stem, lebar setang, posisi cleat. Semuanya murah, dan sebagian gratis.

**Tidak bisa diperbaiki:** panjang efektif frame — kombinasi **reach** dan **stack** dalam tabel geometri. Kalau frame terlalu panjang untuk Anda, stem terpendek yang masuk akal pun tidak akan menyelamatkannya; sepedanya akan terasa terlalu jauh selamanya, dan punggung Anda yang membayar. Kalau terlalu pendek, Anda akan berakhir dengan stem yang sangat panjang dan sepeda yang terasa aneh saat menikung.

Karena itu, kalau Anda berada di antara dua ukuran, pertanyaannya bukan "yang mana yang lebih dekat" tapi **"yang mana yang salahnya bisa saya perbaiki"**. Umumnya, ambil yang lebih kecil dan perbaiki dengan stem serta seatpost, terutama kalau fleksibilitas Anda belum bagus.

## Cek fisik yang masih layak dilakukan

**Standover.** Berdiri mengangkangi sepeda dengan kaki rata di lantai. Harus ada jarak antara Anda dan top tube. Ini pemeriksaan keamanan dasar, bukan penentu ukuran — sepeda modern dengan top tube miring hampir selalu lolos, jadi lolos di sini tidak berarti ukurannya benar.

**Coba naiki, kalau bisa.** Lima menit di atas sepeda memberi tahu lebih banyak daripada satu jam membaca tabel geometri. Kalau Anda membeli online dan tidak bisa mencoba, cari orang dengan tinggi dan proporsi mirip yang sudah memakai model itu.

## Gravel, MTB, dan sepeda lipat

**Gravel** umumnya memakai penomoran yang sama dengan road, dengan geometri yang sedikit lebih santai. **MTB** hampir seluruhnya sudah pakai S/M/L dan lebih ditentukan oleh reach daripada seat tube. **Sepeda lipat** biasanya satu ukuran dengan rentang penyetelan yang lebar, jadi kecocokannya lebih banyak ditentukan tinggi sadel dan setang.

## Setelah sepedanya datang

Ukuran frame adalah keputusan sekali seumur sepeda. Setelan adalah yang Anda urus terus-menerus, dan itu yang benar-benar menentukan nyaman atau tidak.

Langkah berikutnya ada di [Bike Fitting Itu Apa, dan Cara Mengeceknya Sendiri dari Video](/blog/bike-fitting-cek-sendiri-dari-video) — termasuk cara mengecek posisi Anda dari satu klip video lewat [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz), gratis dan tanpa mengunggah videonya ke mana pun.

## FAQ

### Ukuran sepeda untuk tinggi 170 cm berapa?

Umumnya sekitar frame 52–54 untuk road, atau S–M. Tapi itu titik awal: proporsi tungkai dan badan Anda, serta cara tiap merek mengukur, bisa menggeser jawabannya satu ukuran ke mana pun.

### Lebih baik ambil ukuran lebih besar atau lebih kecil?

Umumnya yang lebih kecil, karena kekurangan panjang bisa ditambal dengan stem lebih panjang dan seatpost lebih tinggi, sedangkan frame yang terlalu panjang tidak bisa dipendekkan.

### Apa yang lebih penting, tinggi badan atau inseam?

Inseam, kalau Anda hanya bisa mengukur satu. Ia menentukan tinggi sadel, dan bersama panjang badan menentukan apakah jangkauan ke setang masuk akal untuk Anda.

### Apa itu stack dan reach?

Reach adalah jarak horizontal dari bottom bracket ke bagian atas head tube; stack adalah jarak vertikalnya. Keduanya menggambarkan bentuk frame jauh lebih baik daripada angka seat tube, dan hampir semua merek mencantumkannya di tabel geometri.

### Kenapa ukuran frame merek A dan merek B berbeda?

Karena geometri modern tidak seragam, dan angka sentimeter hanya mengukur seat tube — bukan panjang efektif sepeda. Bandingkan stack dan reach, bukan angka ukurannya.

### Apakah salah ukuran bisa diperbaiki dengan bike fitting?

Sebagian. Fitting bisa memperbaiki banyak hal, tapi tidak bisa memendekkan frame. Kalau reach-nya terlalu jauh sejak awal, batasnya akan terasa.$body$,
  true,
  '2026-07-30T17:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-ukuran-sepeda.svg'
where slug = 'ukuran-sepeda-sesuai-tinggi-badan';
