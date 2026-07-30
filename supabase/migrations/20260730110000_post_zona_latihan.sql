-- Blog post: "Zona Latihan Bersepeda"
--
-- First Indonesian post for Ascent, which until now had exactly one English
-- post and nothing else. This is the pillar of that cluster: zones are what
-- every other training number is built on top of.
--
-- Careful on one point: Ascent estimates FTP when Strava has no power data, and
-- the post says estimate rather than implying a measurement.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'zona-latihan-bersepeda-heart-rate-ftp',
  'Zona Latihan Bersepeda: Heart Rate, Power, dan FTP',
  'Zona adalah cara menerjemahkan angka mentah menjadi keputusan latihan. Bedanya zona heart rate dan zona power, cara menentukan FTP, dan kenapa hampir semua orang menghabiskan waktu di zona yang salah.',
  $body$Jawaban singkatnya: **zona latihan adalah cara mengubah angka mentah menjadi keputusan.** Tanpa zona, 150 bpm hanyalah 150 bpm. Dengan zona, ia berarti "ini latihan endurance" atau "ini terlalu keras untuk hari pemulihan".

Dan kesalahan paling umum di antara pesepeda amatir bukan latihan terlalu ringan atau terlalu berat. Kesalahannya adalah **selalu berada di tengah** — terlalu keras untuk membangun daya tahan, terlalu ringan untuk membangun ambang batas.

## Dua jenis zona, dan bedanya penting

**Zona heart rate** mengukur *respons* tubuh Anda terhadap usaha. **Zona power** mengukur *usaha* itu sendiri.

Bedanya bukan akademis. Heart rate punya jeda — saat Anda menyerang tanjakan, tenaga naik seketika, sementara detak jantung butuh puluhan detik untuk menyusul. Heart rate juga melayang naik sepanjang perjalanan panjang meski usaha Anda tetap sama, dan berubah karena panas, tidur, kopi, stres, dan dehidrasi. Di Bali, panas saja sudah cukup untuk menggeser detak jantung Anda beberapa denyut sepanjang siang.

Power tidak peduli semua itu. 200 watt hari ini sama dengan 200 watt bulan lalu.

Artinya: **untuk interval pendek, percayai power. Untuk perjalanan panjang, heart rate tetap sangat berguna** — dan kalau Anda tidak punya power meter, heart rate adalah alat yang benar-benar layak dipakai, bukan hadiah hiburan.

## FTP, dan kenapa semua bergantung padanya

**FTP (Functional Threshold Power)** adalah perkiraan tenaga tertinggi yang bisa Anda pertahankan kira-kira satu jam. Semua zona power dihitung sebagai persentase dari angka ini, jadi kalau FTP Anda salah, seluruh zona Anda ikut salah.

Cara paling umum mengukurnya: **tes 20 menit sekuat mungkin, lalu kalikan hasilnya dengan 0,95.** Angka 5% itu memperhitungkan bahwa 20 menit bisa dijalani lebih keras daripada satu jam penuh. Ada juga tes ramp yang lebih pendek dan lebih tidak menyakitkan.

Kalau Anda tidak punya power meter, [Ascent](https://ascent-analytics.doniwirawan.xyz) bisa memberi **estimasi** FTP dari data yang ada di Strava Anda. Perlu ditegaskan: itu estimasi, bukan pengukuran. Cukup untuk menentukan zona dan melihat arah perubahan, tidak cukup untuk dibanggakan di grup WhatsApp.

Satu hal yang sering dilupakan: **FTP berubah.** Setelah beberapa bulan latihan, atau setelah beberapa minggu libur, angkanya bergeser. Zona yang tidak pernah diperbarui perlahan menjadi fiksi.

## Zona power, dan apa gunanya masing-masing

Pembagian yang paling luas dipakai membagi menjadi tujuh tingkat sebagai persentase FTP:

- **Zona 1, di bawah 55%** — pemulihan aktif. Terasa terlalu pelan. Memang harus terasa begitu.
- **Zona 2, 56–75%** — endurance. Anda masih bisa mengobrol dalam kalimat penuh. Di sinilah sebagian besar jam latihan Anda seharusnya berada, dan di sinilah paling sedikit orang mau berada.
- **Zona 3, 76–90%** — tempo. Terasa produktif, dan inilah jebakannya. Cukup melelahkan untuk mengganggu pemulihan, tidak cukup keras untuk memberi rangsangan terbaik.
- **Zona 4, 91–105%** — ambang batas. Ini yang menaikkan FTP Anda. Berat, terkontrol, dan biasanya dijalani sebagai interval.
- **Zona 5, 106–120%** — VO2 max. Interval tiga sampai lima menit yang benar-benar tidak menyenangkan.
- **Zona 6, 121–150%** — anaerobik. Serangan dan sprint panjang.
- **Zona 7, di atas 150%** — sprint pendek. Hitungan detik.

Untuk zona heart rate, pembagiannya lebih sederhana — umumnya lima zona, dihitung dari detak jantung maksimum atau dari ambang laktat Anda. Ascent membaca zona dari profil Strava Anda kalau sudah diatur di sana, atau memperkirakannya dari detak jantung maksimum kalau belum.

Catatan soal rumus **220 dikurangi umur**: itu perkiraan kasar dengan sebaran yang sangat lebar antar-individu. Kalau Anda pernah melihat angka detak jantung tertinggi Anda sendiri di perjalanan yang benar-benar berat, angka itu jauh lebih berguna daripada rumus mana pun.

## Kesalahan yang paling mahal

Sebagian besar pesepeda amatir menjalani hampir seluruh latihannya di zona 3.

Masuk akal secara psikologis: zona 2 terasa terlalu pelan untuk dianggap latihan, dan zona 4 terlalu berat untuk dinikmati. Jadi orang menetap di tengah, di tempat yang terasa seperti kerja keras tanpa benar-benar menjadi kerja keras.

Masalahnya, zona 3 cukup melelahkan untuk mengganggu pemulihan Anda, tapi tidak cukup keras untuk memberi rangsangan yang membuat ambang batas naik. Anda membayar ongkosnya tanpa mendapat hasilnya.

Perbaikannya sederhana dan sulit: **buat hari mudah menjadi benar-benar mudah, dan hari keras menjadi benar-benar keras.** Bagian yang sulit adalah menahan ego di hari mudah.

## Cara melihat zona Anda sendiri

Strava menunjukkan distribusi zona per aktivitas. Yang lebih berguna adalah melihatnya **antar minggu dan antar bulan** — di situlah pola muncul, dan di situlah Anda akan menemukan bahwa "latihan endurance" Anda ternyata separuhnya zona 3.

[Ascent](https://ascent-analytics.doniwirawan.xyz) menyambung ke akun Strava Anda dan menyusun tren itu, termasuk label zona heart rate dan estimasi FTP. Semuanya berjalan di browser Anda: datanya diambil langsung dari Strava oleh peramban Anda sendiri dan tidak melewati server saya. Ada juga mode demo kalau Anda ingin melihat tampilannya sebelum menyambungkan akun.

## FAQ

### FTP itu apa?

Functional Threshold Power — perkiraan tenaga tertinggi yang bisa Anda pertahankan sekitar satu jam. Semua zona power dihitung sebagai persentase dari angka ini.

### Bagaimana cara menghitung FTP?

Cara paling umum: bersepeda sekuat mungkin selama 20 menit, lalu kalikan rata-rata power-nya dengan 0,95. Ada juga tes ramp yang lebih pendek. Tanpa power meter, hasilnya hanya bisa berupa estimasi.

### Zona heart rate atau zona power, mana yang lebih baik?

Power lebih akurat untuk usaha pendek karena tidak punya jeda dan tidak terpengaruh panas atau kelelahan. Heart rate tetap sangat berguna untuk perjalanan panjang, dan merupakan pilihan yang layak kalau Anda tidak punya power meter.

### Kenapa heart rate saya naik padahal kecepatan tetap?

Itu cardiac drift, dan biasanya normal pada perjalanan panjang — dipengaruhi panas, dehidrasi, dan kelelahan. Ini juga alasan heart rate kurang cocok dipakai menilai interval pendek.

### Berapa lama sekali FTP perlu dites ulang?

Umumnya setiap satu sampai dua bulan saat sedang rutin berlatih, atau setelah perubahan besar pada beban latihan. Zona yang tidak diperbarui lama-lama tidak menggambarkan apa pun.

### Apakah rumus 220 dikurangi umur akurat?

Sebagai perkiraan kasar saja. Sebarannya antar-individu sangat lebar. Angka detak jantung tertinggi yang benar-benar pernah Anda catat sendiri jauh lebih berguna.

### Apakah Ascent menyimpan data Strava saya?

Tidak. Data diambil langsung dari Strava oleh browser Anda dan tidak melewati server saya. Cache-nya pun disimpan di peramban Anda sendiri.$body$,
  true,
  '2026-07-30T21:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-zona-latihan.svg'
where slug = 'zona-latihan-bersepeda-heart-rate-ftp';
