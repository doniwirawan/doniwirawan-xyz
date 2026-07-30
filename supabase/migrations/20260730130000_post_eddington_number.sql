-- Blog post: "Eddington Number"
--
-- Almost no Indonesian-language competition on this term, and Ascent already
-- computes it — a rare case where the tool has a feature nobody is searching for
-- yet because nobody has explained it in the language.

insert into public.posts (slug, title, excerpt, body, published, published_at, lang)
values (
  'eddington-number-bersepeda',
  'Eddington Number: Angka yang Lebih Jujur daripada Total Jarak',
  'Total jarak bisa dikarang oleh satu perjalanan heroik setahun sekali. Eddington number tidak bisa. Satu angka yang mengukur konsistensi, kenapa ia makin sulit dinaikkan, dan cara menghitungnya.',
  $body$Jawaban singkatnya: **Eddington number Anda adalah angka E terbesar di mana Anda sudah pernah bersepeda sejauh minimal E kilometer, pada E hari yang berbeda.**

E = 70 berarti Anda pernah menempuh 70 km atau lebih, sebanyak 70 kali. Bukan sekali. Tujuh puluh kali.

Itu sebabnya angka ini jauh lebih sulit dipalsukan daripada total jarak.

## Kenapa total jarak menipu

Total jarak tahunan bisa didominasi oleh beberapa perjalanan besar. Seseorang yang bersepeda 200 km sekali sebulan dan tidak menyentuh sepeda selebihnya bisa punya total tahunan yang mengesankan, dan kebugaran yang tidak mengesankan.

Eddington number menolak itu sepenuhnya. Ia hanya naik kalau Anda melakukan hal yang cukup jauh, **berulang kali**. Satu perjalanan heroik tidak menggeser angkanya sama sekali.

## Asal namanya

Dari Arthur Eddington, astrofisikawan Inggris yang juga pesepeda serius. Ia melacak angka ini untuk dirinya sendiri, dan komunitas sepeda mengadopsi idenya.

Ini juga menjelaskan kenapa banyak orang menghitungnya dalam mil, bukan kilometer — Eddington orang Inggris. Kalau Anda membandingkan angka dengan orang lain, **pastikan satuannya sama.** E = 100 dalam mil adalah pencapaian yang jauh berbeda dari E = 100 dalam kilometer.

## Kenapa ia makin sulit dinaikkan

Ini bagian yang membuat angka ini menarik, dan sedikit kejam.

Untuk naik dari E = 50 ke E = 51, Anda tidak cukup melakukan satu perjalanan 51 km. Anda butuh **51 hari berbeda** yang masing-masing minimal 51 km. Semua perjalanan Anda yang berjarak tepat 50 km tiba-tiba tidak terhitung lagi.

Artinya makin tinggi angka Anda, makin banyak perjalanan yang dibutuhkan untuk naik satu tingkat saja. Pertumbuhannya melambat dengan sendirinya, dan itulah yang membuatnya menjadi ukuran konsistensi jangka panjang, bukan ukuran satu musim.

Efek sampingnya menyenangkan: begitu Anda tahu angka Anda, Anda jadi tahu persis berapa perjalanan lagi yang dibutuhkan untuk naik satu tingkat — dan berapa jarak minimum tiap perjalanan itu. Itu target yang jauh lebih konkret daripada "bersepeda lebih banyak".

## Cara menghitungnya

Secara manual: urutkan semua perjalanan Anda dari yang terjauh ke yang terdekat. Telusuri dari atas sambil menghitung. Berhenti di titik di mana nomor urut perjalanan melampaui jaraknya. Angka terakhir sebelum itu adalah E Anda.

Contoh kecil. Misalkan perjalanan Anda: 90, 80, 70, 60, 50 km.

- Perjalanan ke-1 berjarak 90 → 90 ≥ 1, lanjut.
- Perjalanan ke-2 berjarak 80 → 80 ≥ 2, lanjut.
- Perjalanan ke-3 berjarak 70 → 70 ≥ 3, lanjut.
- Perjalanan ke-4 berjarak 60 → 60 ≥ 4, lanjut.
- Perjalanan ke-5 berjarak 50 → 50 ≥ 5, lanjut.

Dengan lima perjalanan, E Anda 5. Untuk E = 6 Anda butuh perjalanan keenam sejauh minimal 6 km. Untuk E = 60 Anda butuh 60 perjalanan sejauh minimal 60 km — dan di situlah angkanya mulai terasa.

Melakukan ini dengan tangan pada ratusan aktivitas jelas tidak masuk akal. [Ascent](https://ascent-analytics.doniwirawan.xyz) menghitungnya otomatis dari riwayat Strava Anda, dan menunjukkan berapa perjalanan lagi yang Anda butuhkan untuk naik satu tingkat. Berjalan di browser Anda, dengan mode demo kalau Anda ingin melihat dulu.

## Cara membacanya dengan waras

Angka ini mengukur konsistensi pada jarak menengah ke atas. Ia **tidak** mengukur kecepatan, tanjakan, atau kebugaran.

Pesepeda yang fokus ke kriterium atau ke tanjakan pendek yang brutal akan punya E rendah dan kaki yang jauh lebih kuat daripada saya. Itu bukan kekurangan angka ini — itu hanya berarti angka ini mengukur hal lain.

Dan seperti semua metrik tunggal, ia bisa merusak kalau Anda mengejarnya secara membabi buta. Menambah jarak hanya untuk melewati ambang tertentu, di hari yang seharusnya jadi hari pemulihan, adalah cara yang bagus untuk mengubah statistik menyenangkan menjadi cedera.

Anggap saja sebagai catatan sejarah yang jujur. Bukan target latihan.

## FAQ

### Eddington number itu apa?

Angka E terbesar di mana Anda sudah bersepeda minimal E kilometer pada E hari yang berbeda. E = 70 berarti tujuh puluh perjalanan yang masing-masing minimal 70 km.

### Kenapa Eddington number lebih baik daripada total jarak?

Karena tidak bisa didominasi beberapa perjalanan besar. Ia hanya naik kalau Anda menempuh jarak tertentu berulang kali, jadi yang diukur adalah konsistensi.

### Bagaimana cara menghitung Eddington number?

Urutkan semua perjalanan dari terjauh ke terdekat, lalu telusuri sambil menghitung sampai nomor urut melampaui jaraknya. Angka terakhir sebelum titik itu adalah E Anda.

### Eddington number dihitung dalam kilometer atau mil?

Keduanya dipakai. Karena Eddington orang Inggris, banyak yang menghitung dalam mil. Pastikan satuannya sama sebelum membandingkan dengan orang lain.

### Kenapa Eddington number saya naiknya lambat sekali?

Karena setiap kenaikan satu tingkat membutuhkan satu set perjalanan yang seluruhnya lebih panjang. Naik dari 50 ke 51 berarti membutuhkan 51 perjalanan minimal 51 km, dan semua perjalanan 50 km Anda tidak lagi terhitung.

### Apakah Strava menampilkan Eddington number?

Tidak. Datanya ada di akun Anda, tapi angkanya tidak dihitung di sana. Ascent menghitungnya dari riwayat Strava Anda di dalam browser.

### Apakah Eddington number mengukur kebugaran?

Tidak langsung. Ia mengukur konsistensi pada jarak menengah ke atas, bukan kecepatan, tanjakan, atau kekuatan.$body$,
  true,
  '2026-07-30T23:00:00+08:00',
  'id'
);

update public.posts
set cover_url = 'https://doniwirawan.xyz/images/blog/cover-eddington.svg'
where slug = 'eddington-number-bersepeda';
