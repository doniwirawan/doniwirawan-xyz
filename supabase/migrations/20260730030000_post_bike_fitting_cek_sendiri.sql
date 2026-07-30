-- Blog post: "Bike Fitting Itu Apa, dan Cara Mengeceknya Sendiri dari Video"
--
-- The pillar of four Indonesian bike-fit posts. The cycling posts on this site
-- are all in English and all about money; nothing here answers "bike fitting
-- adalah" or "cara bike fitting sendiri", which is what people actually search.
--
-- The four angle ranges quoted are the ones Bike Fit Analyzer grades against,
-- taken from its own report format — not invented here.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'bike-fitting-cek-sendiri-dari-video',
  'Bike Fitting Itu Apa, dan Cara Mengeceknya Sendiri dari Video',
  'Bike fitting adalah menyesuaikan sepeda ke tubuh Anda, bukan sebaliknya. Empat sudut yang diukur seorang fitter, cara merekam video yang layak dibaca, dan batas jelas dari mengecek sendiri.',
  $body$Jawaban singkatnya: **bike fitting adalah proses menyesuaikan sepeda ke tubuh Anda, bukan tubuh Anda ke sepeda.** Yang diubah tinggi sadel, maju-mundur sadel, panjang dan tinggi stem, posisi cleat. Yang diukur sudut tubuh Anda saat mengayuh.

Dan sebagian besar dari pengukuran itu bisa Anda lakukan sendiri dengan satu video dari samping.

Saya tulis ini karena selama dua tahun saya menyetel sadel dua milimeter sekali, tanpa mencatat apa pun, lalu lupa posisi awalnya. Itu bukan menyetel. Itu menebak dalam gelap.

## Kenapa posisi lebih penting daripada yang dikira

Dalam satu jam bersepeda dengan kadens 85 rpm, lutut Anda menekuk dan lurus sekitar lima ribu kali. Kesalahan kecil pada tinggi sadel tidak terasa di kayuhan pertama. Ia terasa di kayuhan keempat ribu, dan biasanya terasa di tempat yang tidak Anda duga.

Ini juga sebabnya sepeda mahal tidak otomatis nyaman. Frame karbon dengan posisi yang salah tetap sepeda yang salah — cuma lebih ringan.

## Empat sudut yang dilihat seorang fitter

Ini yang diukur [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz) dari video Anda, lengkap dengan rentang targetnya untuk posisi road:

- **Sudut lutut di titik terbawah kayuhan — target 30°–40°.** Ini penentu tinggi sadel, dan yang paling sering meleset. Lebih dari 40° biasanya berarti sadel terlalu rendah.
- **Sudut badan dari garis horizontal — target 40°–50°.** Seberapa membungkuk Anda. Dipengaruhi panjang stem, tinggi stem, dan maju-mundur sadel.
- **Sudut siku — target 15°–30°.** Siku yang terkunci lurus berarti jangkauan Anda terlalu jauh, dan semua getaran jalan naik langsung ke bahu.
- **Sudut bahu — target 80°–95°.** Hubungan antara badan dan lengan. Kalau ini meleset sementara yang lain tampak wajar, biasanya masalahnya di stem.

Rentang itu bukan hukum. Pembalap, pesepeda santai, dan orang dengan riwayat cedera punya angka yang berbeda. Target sudut badan bahkan berbeda menurut jenis sepeda — road endurance, road race, gravel, MTB, dan TT punya angka sendiri-sendiri. Anggap sebagai rentang wajar, bukan nilai ujian.

Satu hal yang perlu Anda tahu sebelum membandingkan dengan angka dari sumber lain: **rentang di atas adalah rentang dinamis**, diukur dari video sambil orangnya mengayuh. Banyak panduan mengutip angka statis — lutut 25°–35° dari metode Holmes, misalnya — yang diukur dengan kaki berhenti dan goniometer. Pengukuran dinamis berjalan sekitar delapan derajat lebih besar, jadi keduanya sebenarnya menggambarkan posisi yang sama.¹ ² Membandingkan angka dinamis Anda dengan target statis adalah cara paling mudah untuk menyimpulkan hal yang salah.

## Cara merekam videonya

Ini sembilan puluh persen dari hasilnya. Video yang salah menghasilkan angka yang salah, dan angka yang salah lebih berbahaya daripada tidak punya angka sama sekali.

1. **Benar-benar dari samping.** Kamera tegak lurus terhadap sepeda, lensa mengarah lurus ke Anda. Bukan serong sedikit. Serong sedikit sudah cukup untuk membuat sudut lutut meleset beberapa derajat.
2. **Setinggi pinggul.** Letakkan HP di atas sesuatu yang stabil, kira-kira setinggi pinggul atau setinggi as bottom bracket.
3. **Sisi yang dekat kamera harus bersih.** Botol minum, kipas angin, tas — singkirkan semua yang bisa menutupi kaki dan lengan yang dekat kamera.
4. **Kayuh santai dan stabil 20–30 detik.** Trainer paling ideal karena sepeda tidak bergerak. Kadens normal, bukan sprint.
5. **Cahaya cukup.** Makin terang, makin sedikit blur, makin akurat pembacaan sendinya.
6. **Pegang setang seperti biasanya Anda pegang** — untuk kebanyakan orang berarti di hood, dan konsisten sepanjang klip.
7. **Posisi road, bukan TT atau tri.** Rentang sudut di atas untuk sepeda road dan trainer.

Lalu buka [bikefit.doniwirawan.xyz](https://bikefit.doniwirawan.xyz), masukkan klipnya, dan tunggu. Videonya diproses di dalam browser Anda, di perangkat Anda. Tidak diunggah ke mana pun, tidak disimpan, dan saya tidak pernah melihatnya. Itu bukan fitur tambahan — itu alasan alatnya dibangun seperti itu. Tidak ada orang yang harus mengirim video tubuhnya ke orang asing hanya untuk tahu sadelnya kelewat tinggi.

## Cara membaca hasilnya

Hasilnya berupa warna per sudut: hijau berarti aman, oranye berarti di batas, merah berarti perlu diperbaiki. Lalu ada satu kalimat instruksi, misalnya *"lutut 45° di titik terbawah → sadel terlalu rendah, naikkan sekitar 20 mm."*

Dua hal yang membuat angkanya lebih bisa dipercaya daripada satu tangkapan layar: titik terbawah kayuhan diambil sebagai **median dari beberapa kayuhan**, bukan dari satu frame, sehingga satu frame yang blur tidak menyeret hasilnya. Dan penilaiannya memberi **toleransi sekitar 2,5°** di tepi setiap rentang, karena video HP memang hanya bisa membaca sampai beberapa derajat. Kalau sudut Anda berada tepat di garis batas, alat ini tidak akan berpura-pura yakin.

Aturan yang saya pakai sesudah itu cuma satu, dan ini yang dulu tidak saya lakukan:

**Ubah satu hal saja, lalu rekam ulang.**

Kalau Anda menaikkan sadel dan menggeser stem sekaligus, lalu terasa lebih enak, Anda tidak tahu mana yang bekerja. Dan kalau terasa lebih buruk, Anda tidak tahu mana yang harus dikembalikan. Catat angka awalnya sebelum menyentuh apa pun — foto seatpost dengan penggaris sudah cukup.

## Batasnya, dan ini penting

Kamera HP melihat dua dimensi. Ia tidak melihat pergelangan kaki Anda yang jatuh ke dalam, perbedaan panjang tungkai, panggul yang tidak simetris, atau cedera lama yang sedang Anda hindari tanpa sadar. Fitter yang baik melihat itu semua, dan melihat Anda bergerak.

Jadi: **alat ini bukan bike fitting, dan bukan nasihat medis.** Kalau ada yang sakit dan menetap, temui fisioterapis atau dokter, bukan situs web. Kalau Anda mampu membayar fitter profesional, bayar. Ini untuk orang yang tidak akan pernah ke fitter, dan selama ini cuma menebak — termasuk saya, dulu.

Kalau Anda penasaran berapa sebenarnya total biaya memiliki sepeda di luar harga sepedanya, saya pernah hitung semuanya di [The Hidden Cost of Owning a Bicycle](/blog/the-hidden-cost-of-owning-a-bicycle).

## Lanjutannya

Tiga tulisan berikutnya membedah satu per satu keluhan yang paling sering muncul:

- [Tinggi Sadel Sepeda yang Benar](/blog/tinggi-sadel-sepeda-yang-benar) — cara mengukur, dan tanda kalau salah.
- [Nyeri Lutut Saat Bersepeda](/blog/nyeri-lutut-saat-bersepeda) — apa yang biasanya salah di posisi Anda.
- [Sakit Punggung dan Leher Saat Bersepeda](/blog/sakit-punggung-dan-leher-saat-bersepeda) — soal jangkauan ke setang.

## FAQ

### Bike fitting itu apa?

Proses menyesuaikan ukuran dan posisi sepeda agar cocok dengan tubuh dan cara Anda mengayuh. Yang disetel antara lain tinggi sadel, posisi maju-mundur sadel, panjang dan tinggi stem, serta posisi cleat. Tujuannya kenyamanan, efisiensi, dan mengurangi risiko cedera akibat gerakan berulang.

### Apakah bisa bike fitting sendiri di rumah?

Sebagian besar bisa, kalau Anda punya cara mengukur. Merekam diri dari samping lalu mengukur sudut sendi adalah metode yang sama yang dipakai fitter dengan perangkat lunak mereka — bedanya mereka juga melihat hal-hal yang tidak tertangkap kamera 2D.

### Berapa lama sekali perlu dicek ulang?

Setiap kali ada yang berubah: sepatu baru, cleat baru, sadel baru, atau setelah cedera. Selain itu, kalau ada keluhan baru yang muncul terus di tempat yang sama.

### Apakah videonya diunggah ke server?

Tidak. Analisisnya berjalan di dalam browser Anda, di perangkat Anda. Sumber kodenya publik, jadi Anda bisa memeriksa sendiri bahwa saya tidak berbohong soal ini.

### Apakah alat ini bisa menggantikan bike fitter profesional?

Tidak. Alat ini memberi Anda angka untuk dipegang, bukan penilaian menyeluruh. Fitter yang baik melihat gerakan tiga dimensi, riwayat cedera, dan hal-hal yang tidak muncul di rekaman dari satu sisi.

### Apakah gratis?

Ya, dan tetap gratis. Tidak perlu akun.

### Dari mana rentang sudutnya berasal?

Dari literatur bike fitting, bukan dari tebakan saya. Sumbernya tercatat di repositori alatnya dan diringkas di bagian rujukan di bawah.

## Rujukan

Rentang sudut di tulisan ini adalah rentang yang dipakai [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz), dan sumbernya tercatat lengkap di [bikefit-research-ranges.md](https://github.com/doniwirawan/bike-fit-analyzer/blob/main/files/bikefit-research-ranges.md).

1. Holliday W, Swart J. *Anthropometrics, flexibility and training history as determinants for bicycle configuration* (2021) — metode Holmes, dan rata-rata sudut sendi pada posisi mengayuh alami: lutut 36° ± 7°, siku 19° ± 8°. [PMC9219349](https://pmc.ncbi.nlm.nih.gov/articles/PMC9219349/)
2. Studi validitas pengukuran dinamis vs statis — sudut dari video sambil mengayuh berjalan sekitar 8° lebih besar daripada angka goniometer statis. [PubMed 24499342](https://pubmed.ncbi.nlm.nih.gov/24499342/)
3. Kinematika bersepeda pada 31 orang dewasa sehat, sadel pada 85,5% inseam — ROM koronal panggul 7,1° ± 2,5°. [PMC8675512](https://pmc.ncbi.nlm.nih.gov/articles/PMC8675512/)
4. Reliabilitas penilaian valgus lutut dari video 2D — SEM 2,72°–3,01°, perbedaan terkecil yang terdeteksi 7,54°–8,93°. [PubMed 22104115](https://pubmed.ncbi.nlm.nih.gov/22104115/)

Bacaan lanjutan yang lebih praktis: [REI — Bike Fit](https://www.rei.com/learn/expert-advice/bike-fit.html), [Liv Cycling — The Importance of Proper Bike Fit](https://www.liv-cycling.com/global/campaigns/the-importance-of-proper-bike-fit/19822), [Road Cycling Academy — Bike Fit Fundamentals](https://roadcyclingacademy.com/bike-fit-fundamentals/), dan [Bikefitting.com](https://www.bikefitting.com/en).$body$,
  true,
  '2026-07-30T13:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-bike-fitting.svg'
where slug = 'bike-fitting-cek-sendiri-dari-video';
