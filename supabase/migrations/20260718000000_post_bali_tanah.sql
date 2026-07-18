-- Blog post: "Bali Tidak Kehabisan Tanah. Kita Kehabisan Cara Berpikir."
-- Content lives in the posts table, so a new post is an insert. The title is a
-- column of its own (api/post.js renders it as the <h1>), so the body starts at
-- the first paragraph, without the markdown heading.

insert into public.posts (slug, title, excerpt, body, published, published_at)
values (
  'bali-tidak-kehabisan-tanah',
  'Bali Tidak Kehabisan Tanah. Kita Kehabisan Cara Berpikir.',
  'Bali tidak kehabisan tanah — kita kehabisan cara berpikir. Kita terus membangun ke samping dan memakan sawah, padahal kita hidup di pulau yang tak bisa diperluas.',
  $body$Saya lahir dan besar di Bali. Saya mencintai pulau ini bukan karena brosur pariwisatanya, melainkan karena hal-hal kecil yang semakin sulit ditemukan. Sawah yang masih bisa memantulkan langit sore. Jalan desa yang belum dipenuhi tembok beton. Rumah-rumah yang masih memberi ruang bagi angin untuk lewat.

Namun setiap kali saya pulang dan berkendara, rasanya Bali berubah sedikit lebih cepat daripada ingatan saya mampu mengejarnya.

Sawah lain menghilang.

Rumah lain berdiri.

Lalu kita berkata, "Memang penduduk bertambah."

Saya tidak yakin sesederhana itu.

Masalahnya bukan semata-mata kita membangun terlalu banyak. Masalahnya adalah kita hampir selalu membangun ke samping.

Setiap keluarga membutuhkan sebidang tanah baru. Setiap anak membutuhkan rumah baru di sebelah rumah orang tuanya. Lama-kelamaan sawah berubah menjadi jalan kecil, lalu menjadi deretan rumah satu lantai, lalu menjadi kompleks yang dulunya adalah lahan produktif.

Ironisnya, kita hidup di sebuah pulau.

Pulau tidak bisa diperluas.

Tanah tidak bisa diproduksi.

Yang bisa diubah hanyalah cara kita menggunakannya.

Saya sering bertanya-tanya, mengapa rumah dua atau tiga lantai masih terasa seperti sesuatu yang "mewah" di Bali? Padahal di kota-kota yang lahannya terbatas, membangun ke atas adalah solusi yang masuk akal. Dengan luas tanah yang sama, sebuah keluarga bisa memiliki ruang hidup yang lebih layak tanpa harus mengorbankan sawah berikutnya.

Mungkin memang ada tantangan budaya, biaya konstruksi, atau kebiasaan turun-temurun. Semua itu layak didiskusikan. Tetapi saya rasa diskusi itu perlu dimulai sekarang, sebelum pilihan kita semakin sedikit.

Bagi saya, sawah bukan sekadar objek yang bagus difoto menggunakan drone.

Sawah adalah alasan mengapa Bali memiliki identitas.

Ketika sawah habis, kita kehilangan lebih dari sekadar pemandangan. Kita kehilangan sistem irigasi, kehilangan ruang terbuka, kehilangan udara yang lebih sejuk, kehilangan cerita yang diwariskan selama ratusan tahun.

Yang lebih menyedihkan, kerusakan itu hampir selalu permanen.

Sawah bisa berubah menjadi rumah dalam waktu beberapa bulan.

Tetapi rumah hampir tidak pernah berubah kembali menjadi sawah.

Karena itu saya semakin percaya bahwa pembangunan yang baik bukanlah pembangunan yang paling cepat, melainkan pembangunan yang paling hemat menggunakan tanah.

Lalu pikiran saya sering berlanjut ke pertanyaan yang lebih besar.

Mengapa rasanya Bali sering tidak benar-benar memiliki kebebasan menentukan masa depannya sendiri?

Saya tahu ini pandangan yang mungkin tidak semua orang setujui.

Ketika saya mengatakan "Bali harus lebih merdeka", yang saya maksud pertama-tama bukanlah slogan, melainkan kemampuan untuk menentukan prioritasnya sendiri. Pulau dengan kondisi geografis, budaya, dan ekonomi yang sangat berbeda seharusnya diberi ruang lebih besar untuk mengatur dirinya sesuai kebutuhan lokal.

Kebijakan yang berhasil di Jakarta belum tentu tepat diterapkan di Bali.

Masalah Bali bukan masalah megapolitan.

Masalah kita adalah keterbatasan lahan, keseimbangan antara pariwisata dan kehidupan warga, pelestarian budaya, air bersih, kemacetan, serta keberlanjutan sawah.

Sering kali saya juga merasa politik di Bali terlalu banyak meniru kebiasaan politik nasional. Perebutan kekuasaan, polarisasi, dan praktik korupsi seolah menjadi sesuatu yang dianggap lumrah. Padahal Bali memiliki tradisi sosial yang sangat kuat. Kita mengenal gotong royong, banjar, dan musyawarah jauh sebelum istilah-istilah modern menjadi populer.

Saya justru berharap kita berani mengambil yang baik dari luar tanpa menyalin yang buruk.

Saya tidak memiliki semua jawabannya.

Saya hanya seorang web developer yang kebetulan sering memperhatikan perubahan di sekitar saya. Mungkin karena saya terbiasa berpikir tentang sistem. Ketika sebuah sistem rusak, biasanya bukan karena satu kesalahan besar, melainkan karena banyak keputusan kecil yang terlihat masuk akal jika dilihat satu per satu.

Satu rumah.

Satu sawah.

Satu izin.

Satu kompromi.

Diulang ribuan kali.

Lalu suatu hari kita bertanya mengapa Bali sudah tidak terasa seperti Bali.

Saya tidak anti pembangunan.

Saya ingin Bali berkembang.

Saya ingin anak-anak muda memiliki rumah.

Saya ingin ekonomi bertumbuh.

Saya ingin investasi datang.

Tetapi saya juga ingin ketika cucu saya nanti berdiri di sebuah bukit di Bali, mereka masih bisa melihat hamparan hijau yang membuat pulau ini berbeda dari tempat lain.

Kemajuan tidak seharusnya diukur dari berapa banyak beton yang berhasil kita tuang.

Kadang kemajuan justru terlihat dari berapa banyak yang berhasil kita pertahankan.$body$,
  true,
  now()
)
on conflict (slug) do nothing;
