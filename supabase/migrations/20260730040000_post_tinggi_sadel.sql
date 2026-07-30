-- Blog post: "Tinggi Sadel Sepeda yang Benar"
--
-- The single highest-intent piece of the bike-fit cluster: people search the
-- saddle height question far more than they search "bike fitting". Anchored to
-- the one angle the analyzer is most confident about, knee flexion at BDC.
--
-- The inseam formulas are presented as starting points, not answers — they are
-- widely published, widely disagreed about, and the angle is the real check.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'tinggi-sadel-sepeda-yang-benar',
  'Tinggi Sadel Sepeda yang Benar: Cara Mengukur dan Tanda Kalau Salah',
  'Rumus inseam memberi Anda titik awal, bukan jawaban. Yang menentukan adalah sudut lutut di titik terbawah kayuhan. Cara mengukurnya, tanda-tanda sadel terlalu tinggi dan terlalu rendah, dan cara menyetel tanpa kehilangan jejak.',
  $body$Jawaban singkatnya: tinggi sadel yang benar adalah tinggi yang membuat **lutut Anda menekuk sekitar 30°–40° saat pedal berada di titik paling bawah**, diukur dari video sambil Anda mengayuh.

Angka itu, bukan rumus. Rumus cuma titik awal.

## Kenapa angka yang Anda baca di tempat lain berbeda

Kalau Anda pernah mencari ini sebelumnya, Anda mungkin menemukan angka **25°–35°**. Itu juga benar — tapi untuk pengukuran yang berbeda.

Angka 25°–35° berasal dari metode Holmes, yang mengukur lutut secara **statis**: kaki berhenti di titik terbawah, diukur dengan goniometer. Sudut yang diukur **dinamis** — sambil orangnya benar-benar mengayuh, dari video — berjalan sekitar delapan derajat lebih besar. Penelitian yang mengukur pesepeda pada posisi alaminya mendapat rata-rata lutut **36° ± 7°**, dan penulisnya memperkirakan itu setara sekitar 28° bila diukur dengan cara Holmes.¹ ²

Jadi 30°–40° dinamis dan 25°–35° statis kira-kira menggambarkan posisi yang sama. Yang penting adalah tahu Anda sedang memakai yang mana. Kalau Anda mengukur dari video, pakai 30°–40°.

## Dua rumus cepat, dan kenapa keduanya cuma titik awal

**Metode inseam.** Berdiri tanpa sepatu, punggung menempel dinding, jepit buku di selangkangan setinggi mungkin seperti posisi sadel, lalu ukur dari lantai ke atas buku. Itu inseam Anda. Kalikan **0,883**. Hasilnya perkiraan jarak dari tengah bottom bracket ke atas sadel, diukur sepanjang seatpost.

**Metode tumit.** Duduk di sadel, taruh tumit di pedal, putar sampai pedal di titik terbawah. Kaki harus lurus penuh tanpa pinggul bergoyang. Saat Anda pindah ke posisi normal — telapak depan di pedal — lutut otomatis akan punya tekukan yang wajar.

Keduanya sah, dan keduanya bisa meleset satu sentimeter atau lebih untuk orang yang sama. Rumus inseam tidak tahu tebal sol sepatu Anda, ketebalan cleat, jenis pedal, atau seberapa jauh pergelangan kaki Anda menekan di bawah kayuhan. Ada orang yang mengayuh dengan tumit turun, ada yang jinjit, dan keduanya butuh tinggi sadel yang berbeda meski inseam-nya persis sama.

Jadi pakai rumus untuk mendapat angka awal. Lalu periksa sudutnya.

## Cara memeriksa sudutnya

Rekam diri Anda dari samping sambil mengayuh santai 20–30 detik, kamera setinggi pinggul, tegak lurus terhadap sepeda. Trainer paling ideal. Masukkan klipnya ke [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz) dan ia akan mencari frame di titik terbawah kayuhan lalu mengukur sudut lutut Anda di situ.

Kalau hasilnya 45°, sadel Anda terlalu rendah. Kalau 25°, terlalu tinggi. Kalau 34°, berhenti menyentuhnya.

Analisisnya berjalan di browser Anda sendiri — videonya tidak diunggah ke mana pun. Panduan merekam yang lebih lengkap ada di [tulisan pengantarnya](/blog/bike-fitting-cek-sendiri-dari-video).

## Tanda sadel terlalu tinggi

- **Jinjit di bawah kayuhan** — pergelangan kaki menurun untuk mencapai pedal.
- **Rasa tidak nyaman di belakang lutut** atau hamstring yang terasa selalu tertarik.
- **Sering menggeser posisi duduk ke depan** tanpa sadar.
- Tekanan pada perineum yang tidak wajar, karena panggul memiring untuk mengejar jarak.

## Tanda sadel terlalu rendah

- **Lutut terasa sangat tertekuk** di puncak kayuhan, seperti berjongkok.
- **Nyeri di depan lutut**, di sekitar atau di bawah tempurung.
- **Paha depan cepat lelah**, sementara napas Anda masih santai.
- **Tenaga terasa hilang** di kayuhan panjang, karena rentang gerak yang efisien tidak terpakai.

Sadel terlalu rendah lebih umum daripada yang orang kira. Ia terasa aman — kaki gampang menjangkau tanah — jadi banyak orang berhenti di situ dan tidak pernah menaikkannya lagi.

## Soal pinggul bergoyang, yang sering disalahpahami

Anda akan sering membaca bahwa pinggul yang bergoyang kiri-kanan berarti sadel terlalu tinggi. Saya dulu menulis dan mempercayai itu juga. Ternyata tidak sesederhana itu.

Penelitian pada pesepeda sehat dengan sadel yang **sudah disetel benar** — pada 85,5% inseam — tetap menemukan gerakan panggul di bidang frontal sekitar **7,1° ± 2,5°**.³ Artinya panggul yang bergerak sedikit adalah hal normal, bukan gejala. Ambang yang masuk akal untuk mulai curiga ada di sekitar 12° puncak-ke-puncak, jauh di atas apa yang kebanyakan orang sebut "bergoyang".

Ada masalah kedua: goyangan panggul dan lutut yang keluar-masuk hanya terlihat dari depan atau belakang, bukan dari samping. Dan pengukuran 2D dari arah itu punya lantai ketelitian sendiri — perbedaan terkecil yang benar-benar bisa dideteksi sekitar 7,5°–8,9°.⁴ Apa pun yang lebih halus dari itu berada di dalam derau pengukuran, sebagus apa pun modelnya.

Kesimpulan praktisnya: **percayai sudut lutut dari samping, jangan menilai dari seberapa "goyang" yang Anda rasakan.** Kalau panggul Anda jelas terlihat terlempar kiri-kanan sampai sulit diabaikan, itu layak dicek. Goyangan halus bukan bukti apa-apa.

## Cara menyetel tanpa kehilangan jejak

Ini bagian yang dulu saya lakukan dengan buruk selama dua tahun.

1. **Catat posisi awal sebelum menyentuh apa pun.** Foto seatpost Anda dengan penggaris menempel, atau ukur dari bottom bracket ke atas sadel dan tulis angkanya. Kalau perubahannya ternyata lebih buruk, Anda butuh jalan pulang.
2. **Ubah 5 mm sekali.** Jangan sepuluh. Perubahan lima milimeter sudah terasa jelas setelah satu jam mengayuh.
3. **Ubah satu hal saja.** Kalau Anda menaikkan sadel dan memajukannya sekaligus, Anda tidak akan tahu mana yang bekerja.
4. **Uji minimal dua atau tiga kali jalan** sebelum menilai. Tubuh butuh waktu beradaptasi, dan hari pertama selalu terasa aneh apa pun yang Anda ubah.
5. **Rekam ulang** dan bandingkan angkanya, bukan perasaannya. Perasaan adalah cara paling mahal untuk menyetel sepeda.

## Kapan harus mengukur ulang

Setiap kali ada yang berubah di antara kaki Anda dan pedal: sepatu baru, cleat baru, pedal baru, sadel baru. Sol sepeda yang lebih tebal beberapa milimeter sudah cukup untuk menggeser sudut lutut Anda.

Juga setelah cedera, dan setelah perubahan besar pada fleksibilitas atau berat badan.

## Kalau ada yang sakit

Tulisan ini soal penyetelan, bukan soal medis. Nyeri yang menetap lebih dari beberapa hari, atau yang memburuk, perlu dilihat fisioterapis atau dokter — bukan diselesaikan dengan menggeser sadel lima milimeter lagi. Saya menulis lebih panjang soal ini di [Nyeri Lutut Saat Bersepeda](/blog/nyeri-lutut-saat-bersepeda).

## FAQ

### Berapa tinggi sadel sepeda yang benar?

Yang menghasilkan sudut lutut sekitar 30°–40° pada titik terbawah kayuhan, tanpa pinggul bergoyang. Sebagai titik awal, inseam Anda dikalikan 0,883 memberi perkiraan jarak dari tengah bottom bracket ke atas sadel.

### Bagaimana cara mengukur inseam untuk sepeda?

Tanpa sepatu, punggung menempel dinding, jepit buku di selangkangan setinggi mungkin, lalu ukur dari lantai ke sisi atas buku. Itu angka inseam Anda — berbeda dari ukuran celana.

### Apa tanda sadel terlalu tinggi?

Kaki jinjit di bawah kayuhan, rasa tidak nyaman di belakang lutut, dan sudut lutut di bawah sekitar 28° pada video. Perlu dicatat: panggul yang bergerak sedikit adalah normal — pesepeda dengan sadel yang sudah benar pun menunjukkan sekitar 7° gerakan panggul — jadi goyangan halus bukan bukti sadel Anda terlalu tinggi.

### Apa tanda sadel terlalu rendah?

Lutut terasa sangat tertekuk, paha depan cepat lelah, dan nyeri di bagian depan lutut. Ini kesalahan yang lebih umum, karena posisi rendah terasa lebih aman.

### Berapa banyak perubahan yang aman sekali setel?

Lima milimeter. Lebih dari itu dan tubuh Anda akan mengompensasi dengan cara yang menyulitkan Anda menilai hasilnya.

### Apakah tinggi sadel road dan gravel sama?

Umumnya mirip, karena keduanya ditentukan panjang tungkai Anda. Yang lebih sering berbeda adalah jangkauan ke setang dan tinggi setangnya, bukan tinggi sadelnya.

### Apakah perlu ukur ulang setelah ganti sepatu?

Ya. Perbedaan tebal sol dan cleat beberapa milimeter langsung mengubah sudut lutut Anda di titik terbawah.

## Rujukan

Rentang sudut di tulisan ini adalah rentang yang dipakai [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz), dan sumbernya tercatat lengkap di [bikefit-research-ranges.md](https://github.com/doniwirawan/bike-fit-analyzer/blob/main/files/bikefit-research-ranges.md).

1. Holliday W, Swart J. *Anthropometrics, flexibility and training history as determinants for bicycle configuration* (2021) — metode Holmes, dan rata-rata sudut sendi pada posisi mengayuh alami: lutut 36° ± 7°, siku 19° ± 8°. [PMC9219349](https://pmc.ncbi.nlm.nih.gov/articles/PMC9219349/)
2. Studi validitas pengukuran dinamis vs statis — sudut dari video sambil mengayuh berjalan sekitar 8° lebih besar daripada angka goniometer statis. [PubMed 24499342](https://pubmed.ncbi.nlm.nih.gov/24499342/)
3. Kinematika bersepeda pada 31 orang dewasa sehat, sadel pada 85,5% inseam — ROM koronal panggul 7,1° ± 2,5°. [PMC8675512](https://pmc.ncbi.nlm.nih.gov/articles/PMC8675512/)
4. Reliabilitas penilaian valgus lutut dari video 2D — SEM 2,72°–3,01°, perbedaan terkecil yang terdeteksi 7,54°–8,93°. [PubMed 22104115](https://pubmed.ncbi.nlm.nih.gov/22104115/)

Bacaan lanjutan yang lebih praktis: [REI — Bike Fit](https://www.rei.com/learn/expert-advice/bike-fit.html), [Liv Cycling — The Importance of Proper Bike Fit](https://www.liv-cycling.com/global/campaigns/the-importance-of-proper-bike-fit/19822), [Road Cycling Academy — Bike Fit Fundamentals](https://roadcyclingacademy.com/bike-fit-fundamentals/), dan [Bikefitting.com](https://www.bikefitting.com/en).$body$,
  true,
  '2026-07-30T14:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-tinggi-sadel.svg'
where slug = 'tinggi-sadel-sepeda-yang-benar';
