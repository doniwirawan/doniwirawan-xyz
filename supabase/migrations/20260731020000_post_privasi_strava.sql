-- Blog post: "Aman Nggak Menyambungkan Strava ke Aplikasi Pihak Ketiga?"
--
-- Real search intent, and the one post in the Ascent set where the honest
-- answer is also the strongest pitch. Written as a checklist for judging any
-- third-party Strava app, with Ascent answered against that checklist rather
-- than exempted from it.
--
-- Precise about the one server hop that does exist: the OAuth code exchange
-- goes through a stateless function because the client secret cannot ship to a
-- browser. The activity data never does. Saying "everything runs in the
-- browser" without that footnote would be the kind of small overstatement this
-- post is telling people to look for.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'aman-connect-strava-ke-aplikasi-pihak-ketiga',
  'Aman Nggak Menyambungkan Strava ke Aplikasi Pihak Ketiga?',
  'Setiap aplikasi analitik Strava meminta akses ke seluruh riwayat aktivitas Anda, termasuk yang privat. Lima pertanyaan untuk menilai apakah sebuah aplikasi layak diberi akses itu, dan cara mencabutnya.',
  $body$Jawaban singkatnya: **tergantung ke mana data Anda pergi setelah izin diberikan** — dan itu pertanyaan yang bisa Anda jawab sendiri sebelum menekan tombol Connect.

Yang perlu dipahami dulu: hampir semua aplikasi analitik Strava meminta izin membaca **seluruh** riwayat aktivitas Anda, termasuk aktivitas privat. Itu memang dibutuhkan untuk membangun statistik. Tapi itu juga akses yang besar, dan pantas dipikirkan sebentar.

## Yang tidak pernah Anda serahkan

Satu hal yang sering disalahpahami: **Anda tidak pernah memberikan kata sandi Strava Anda.**

Proses login memakai OAuth. Anda diarahkan ke situs Strava sendiri, masuk di sana, dan Strava yang memberi tahu aplikasi bahwa Anda mengizinkan. Aplikasinya tidak pernah melihat kata sandi Anda, dan tidak bisa melihatnya.

Kalau ada aplikasi yang meminta Anda mengetik kata sandi Strava di dalam aplikasinya sendiri, itu bukan OAuth. Tinggalkan.

## Izin apa saja yang diminta

Umumnya empat, dan ada gunanya tahu artinya:

- **`read`** — profil publik dasar.
- **`activity:read_all`** — membaca semua aktivitas Anda, termasuk yang privat. Ini yang paling besar, dan yang dibutuhkan untuk membuat statistik yang lengkap.
- **`profile:read_all`** — profil lengkap: nama, foto, statistik.
- **`activity:write`** — menulis ke akun Anda, misalnya memperbarui judul aktivitas. Kalau sebuah aplikasi hanya menampilkan grafik tapi meminta izin menulis, tanyakan kenapa.

## Lima pertanyaan sebelum menekan Connect

**1. Ke mana data aktivitasnya pergi?** Ini pertanyaan terpenting. Ada dua model. Aplikasi bisa mengambil data Strava **langsung dari browser Anda** dan mengolahnya di perangkat Anda, atau menariknya ke **server mereka** dan menyimpannya. Model kedua bukan otomatis buruk — sinkronisasi antar-perangkat butuh itu — tapi artinya salinan riwayat Anda ada di komputer orang lain, tunduk pada keamanan dan kebijakan mereka.

**2. Berapa lama disimpan, dan bisakah dihapus?** Cari tombol putuskan sambungan yang benar-benar menghapus, bukan sekadar keluar.

**3. Apakah ada penjelasan yang spesifik?** "Kami menghargai privasi Anda" tidak berarti apa-apa. "Token disimpan di localStorage peramban Anda, cache aktivitas kedaluwarsa dalam 6 jam, tidak ada basis data di sisi kami" bisa diperiksa.

**4. Apakah kodenya bisa dilihat?** Sumber terbuka tidak menjamin apa-apa dengan sendirinya, tapi ia membuat klaim bisa diperiksa oleh siapa saja yang mau.

**5. Apakah izin yang diminta masuk akal untuk fungsinya?** Aplikasi yang hanya menggambar grafik tidak butuh izin menulis.

## Cara mencabut aksesnya

Ini bagian yang paling sering tidak diketahui orang, dan paling penting: **Anda memegang kendali, selalu.**

Buka [strava.com/settings/apps](https://www.strava.com/settings/apps). Di sana ada daftar semua aplikasi yang pernah Anda beri izin, dan tombol untuk mencabutnya satu per satu. Cabut yang sudah tidak Anda pakai. Lakukan sekarang kalau Anda belum pernah memeriksanya — daftarnya biasanya lebih panjang dari yang Anda ingat.

Mencabut akses tidak menghapus data Anda di Strava. Ia hanya memutus akses aplikasi tersebut.

## Ascent, dijawab dengan daftar yang sama

Tidak adil kalau saya membuat daftar periksa lalu mengecualikan alat saya sendiri. Jadi:

**Data aktivitas Anda diambil langsung oleh peramban Anda dari API Strava, dan tidak melewati server saya.** Statistik, grafik, heatmap, dan kartu cerita semuanya dihitung di perangkat Anda.

**Ada satu hal yang melewati server, dan saya sebutkan karena postingan ini soal ketelitian.** Saat login, Strava mengirim satu kode sekali pakai, dan kode itu harus ditukar menjadi token dengan menyertakan *client secret* aplikasi. Client secret tidak boleh dikirim ke browser siapa pun, jadi penukaran itu dilakukan oleh satu fungsi kecil di server yang menambahkan rahasia tersebut, meneruskannya ke Strava, lalu mengembalikan tokennya. **Fungsi itu tidak menyimpan apa pun.** Setelah itu, tidak ada lagi yang lewat sana.

**Token dan cache aktivitas disimpan di `localStorage` peramban Anda**, per atlet, dengan masa berlaku cache 6 jam supaya tidak menarik ulang data setiap kali dibuka.

**Tidak ada basis data di sisi saya.** Kodenya punya opsi cache jarak jauh untuk sinkronisasi antar-perangkat, tapi mati secara bawaan. Kalau Anda menyalakannya sendiri, datanya masuk ke proyek Supabase **milik Anda**, bukan milik saya.

**Menghapusnya:** tombol Disconnect di aplikasi menghapus token dan cache, lalu cabut aksesnya di pengaturan Strava.

**Kodenya publik**, jadi semua di atas bisa Anda periksa sendiri, bukan sekadar dipercaya: [Ascent](https://ascent-analytics.doniwirawan.xyz), dan ada mode demo dengan data contoh kalau Anda ingin melihat-lihat tanpa menyambungkan akun sama sekali.

Ascent adalah proyek independen dan tidak berafiliasi dengan Strava, Inc.

## Satu hal lain: peta rute Anda

Ini soal privasi yang tidak berhubungan dengan aplikasi pihak ketiga, dan lebih sering jadi masalah nyata.

Rute yang selalu berawal dan berakhir di rumah Anda memberi tahu siapa pun yang melihatnya di mana Anda tinggal, dan jam berapa Anda biasanya tidak ada di rumah. Strava punya pengaturan zona privasi untuk menyembunyikan area di sekitar titik awal dan akhir. Kalau Anda memposting aktivitas secara publik, aturlah itu.

## FAQ

### Apakah aman menyambungkan Strava ke aplikasi pihak ketiga?

Tergantung aplikasinya. Anda tidak pernah menyerahkan kata sandi karena prosesnya memakai OAuth, tapi Anda memberi akses baca ke seluruh riwayat aktivitas termasuk yang privat. Periksa ke mana data itu pergi setelahnya.

### Apakah aplikasi pihak ketiga bisa melihat kata sandi Strava saya?

Tidak. Anda masuk di situs Strava sendiri dan aplikasinya hanya menerima token. Kalau ada aplikasi yang meminta kata sandi Strava langsung, jangan gunakan.

### Bagaimana cara mencabut akses aplikasi dari Strava?

Buka [strava.com/settings/apps](https://www.strava.com/settings/apps), lalu cabut aplikasi yang tidak lagi Anda pakai. Aksesnya berhenti seketika.

### Apa arti izin activity:read_all?

Izin membaca semua aktivitas Anda, termasuk yang ditandai privat. Dibutuhkan aplikasi analitik untuk menghitung statistik yang lengkap.

### Apakah Ascent menyimpan data Strava saya di server?

Tidak. Data aktivitas diambil peramban Anda langsung dari Strava dan diolah di perangkat Anda. Hanya penukaran kode login yang melewati satu fungsi tanpa penyimpanan, karena client secret tidak boleh dikirim ke browser.

### Apakah mencabut akses menghapus data saya di Strava?

Tidak. Mencabut akses hanya memutus izin aplikasi tersebut. Data Anda di Strava tetap utuh.

### Apakah sumber terbuka berarti otomatis aman?

Tidak otomatis, tapi klaimnya jadi bisa diperiksa siapa saja. Itu lebih baik daripada janji yang tidak bisa diverifikasi.$body$,
  true,
  '2026-07-31T11:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-privasi-strava.svg'
where slug = 'aman-connect-strava-ke-aplikasi-pihak-ketiga';

-- The FAQ on the reading-Strava-data post says Ascent runs "sepenuhnya di
-- browser". The activity data does; the login code exchange does not. Tightened
-- so it matches what the new privacy post spells out.
update public.posts
set body = replace(body,
  'Ascent berjalan sepenuhnya di browser Anda, sumbernya terbuka, dan aksesnya bisa Anda cabut kapan saja dari pengaturan Strava.',
  'Data aktivitas Ascent diolah di browser Anda dan tidak melewati server saya — hanya penukaran kode login yang lewat satu fungsi tanpa penyimpanan. Sumbernya terbuka, dan aksesnya bisa dicabut kapan saja dari pengaturan Strava. Rinciannya saya tulis di [Aman Nggak Menyambungkan Strava ke Aplikasi Pihak Ketiga?](/blog/aman-connect-strava-ke-aplikasi-pihak-ketiga).')
where slug = 'cara-membaca-data-strava';
