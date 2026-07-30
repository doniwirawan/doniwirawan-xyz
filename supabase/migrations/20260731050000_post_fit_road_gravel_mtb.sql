-- Blog post: "Bike Fit untuk Road, Gravel, dan MTB"
--
-- The analyzer takes a --bike-type flag that changes the torso target
-- (road_endurance, road_race, tt_tri, gravel, mtb, city), and none of the seven
-- fit posts explain why that setting exists. This is that post, and the one
-- that says which parts of a fit carry across bikes and which do not.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'bike-fit-road-gravel-mtb',
  'Bike Fit untuk Road, Gravel, dan MTB: Apa yang Berubah dan Apa yang Tidak',
  'Tinggi sadel Anda ditentukan kaki Anda, jadi ia hampir sama di semua sepeda. Yang berubah adalah bagian depan. Kenapa target sudut badan berbeda per jenis sepeda, dan apa yang bisa disalin antar sepeda.',
  $body$Jawaban singkatnya: **tinggi sadel Anda hampir sama di semua sepeda, karena yang menentukannya adalah panjang kaki Anda.** Yang berubah adalah bagian depan — seberapa jauh dan seberapa rendah Anda meraih setang.

Itu juga alasan alat pengukur fit punya pilihan jenis sepeda: rentang sudut badan yang wajar untuk sepeda road endurance bukan rentang yang wajar untuk MTB.

## Yang bisa disalin antar sepeda

**Tinggi sadel.** Kaki Anda tidak berubah saat Anda ganti sepeda. Sudut lutut di titik terbawah kayuhan tetap patokannya, dan tetap sekitar 30°–40° diukur dari video. Caranya ada di [Tinggi Sadel Sepeda yang Benar](/blog/tinggi-sadel-sepeda-yang-benar).

Satu catatan: ukur dari **bottom bracket ke atas sadel**, bukan dari tanah, dan ingat bahwa sepatu berbeda atau cleat berbeda menggeser angkanya beberapa milimeter.

**Posisi cleat.** Kaki yang sama, sepatu yang sama, sudut yang sama. Kalau Anda memakai sepatu berbeda untuk tiap sepeda, samakan pengaturannya. Tiga sumbunya ada di [Posisi Cleat Sepeda yang Benar](/blog/posisi-cleat-sepeda-yang-benar).

**Maju-mundur sadel**, kurang lebih. Ini mengikuti proporsi tubuh Anda lebih daripada mengikuti sepedanya.

## Yang berubah, dan kenapa

Bagian depan sepeda. Semua perbedaan ada di sini.

**Road race** menempatkan Anda paling rendah dan paling membungkuk. Sudut badan yang lebih kecil dari garis horizontal, jangkauan lebih jauh, setang lebih rendah. Aerodinamis, dan menuntut fleksibilitas serta kekuatan badan yang tidak dimiliki semua orang.

**Road endurance** — jenis yang dipakai kebanyakan orang — menaruh Anda sedikit lebih tegak. Head tube lebih tinggi, jangkauan sedikit lebih pendek. Ini rentang yang saya pakai sebagai bawaan di [Bike Fit Analyzer](https://bikefit.doniwirawan.xyz): sudut badan sekitar 40°–50° dari horizontal.

**Gravel** lebih tegak lagi, dengan setang lebih lebar dan sering sedikit mengembang ke luar. Alasannya bukan kenyamanan semata: di permukaan lepas Anda butuh kendali dan ruang gerak, dan posisi yang terlalu tertutup membuat sepeda sulit dikendalikan saat roda depan bergerak sendiri.

**MTB** paling tegak dari semuanya, dan sizing-nya praktis ditentukan **reach**, bukan panjang seat tube. Ditambah dropper post, tinggi sadel Anda memang berubah-ubah sepanjang perjalanan — itu fiturnya. Angka fit yang berlaku adalah tinggi sadel saat mengayuh, bukan saat menuruni turunan.

**TT dan triatlon** adalah dunia yang berbeda sepenuhnya. Panggul diputar ke depan, posisi jauh lebih tertutup, dan rentang sudut untuk posisi road **tidak berlaku sama sekali** di sana. Kalau alat pengukur Anda diatur ke road dan Anda merekam posisi TT, angkanya akan salah dan terlihat meyakinkan — kombinasi terburuk.

## Kesalahan yang paling sering

**Menyalin posisi road ke gravel apa adanya.** Anda akan berakhir terlalu membungkuk dan terlalu tertutup untuk permukaan yang menuntut kendali.

**Menyalin posisi pro.** Sudut badan pembalap sangat rendah karena mereka melatihnya bertahun-tahun. Menyalin posisinya tanpa menyalin tahun-tahunnya adalah cara cepat menyakiti punggung sendiri.

**Menganggap sepeda kedua tidak perlu diukur.** Geometri berbeda berarti hasil berbeda, meski tinggi sadelnya Anda samakan. Rekam ulang di tiap sepeda.

**Menyetel semua sepeda ke rentang yang paling agresif** karena angkanya terlihat lebih "benar". Rentang yang benar adalah rentang untuk jenis sepeda dan tubuh Anda hari ini.

## Kalau Anda punya lebih dari satu sepeda

Urutan yang saya sarankan: **selesaikan sepeda yang paling sering Anda pakai lebih dulu, sampai benar-benar beres.** Baru pindah ke yang berikutnya, mulai dari menyalin tinggi sadel dan posisi cleat, lalu ukur bagian depannya secara terpisah.

Catat angkanya di suatu tempat yang tidak akan hilang — foto seatpost dengan penggaris, catatan di ponsel, apa saja. Enam bulan lagi Anda tidak akan ingat, dan mengukur ulang dari nol jauh lebih menyebalkan daripada menuliskannya sekarang.

Cara merekam dan mengukurnya sama untuk semua jenis sepeda, dan ada di [Bike Fitting Itu Apa, dan Cara Mengeceknya Sendiri dari Video](/blog/bike-fitting-cek-sendiri-dari-video).

## FAQ

### Apakah tinggi sadel road dan gravel sama?

Hampir sama, karena ditentukan panjang kaki Anda. Yang lebih sering berbeda adalah jangkauan dan tinggi setang.

### Kenapa target sudut badan berbeda per jenis sepeda?

Karena tujuan posisinya berbeda. Road race mengejar aerodinamika dengan posisi rendah; gravel dan MTB butuh posisi lebih tegak untuk kendali di permukaan lepas.

### Bolehkah menyalin setelan sepeda road ke sepeda gravel?

Salin tinggi sadel dan posisi cleat. Jangan salin posisi setangnya — gravel umumnya menuntut posisi lebih tegak dan setang lebih lebar.

### Bagaimana bike fit untuk MTB dengan dropper post?

Patokannya tetap tinggi sadel saat Anda mengayuh. Dropper memang dirancang untuk diturunkan di turunan, dan itu tidak mengubah angka fit Anda.

### Apakah rentang sudut ini berlaku untuk sepeda TT atau triatlon?

Tidak. Posisi TT memutar panggul ke depan dan sangat berbeda. Memakai rentang road untuk posisi TT menghasilkan angka yang salah tapi terlihat meyakinkan.

### Apakah sepeda kedua saya perlu diukur ulang?

Ya. Geometri yang berbeda menghasilkan sudut yang berbeda meski tinggi sadelnya Anda samakan.

### Sepeda mana yang sebaiknya disetel lebih dulu?

Yang paling sering Anda pakai, sampai benar-benar beres. Baru pindah ke berikutnya dengan menyalin tinggi sadel dan cleat sebagai titik awal.$body$,
  true,
  '2026-07-31T14:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-fit-jenis-sepeda.svg'
where slug = 'bike-fit-road-gravel-mtb';
