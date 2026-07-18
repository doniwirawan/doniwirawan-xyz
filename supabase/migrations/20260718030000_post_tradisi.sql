-- Blog post: "Tradisi yang Bertahan Harus Berani Berubah"
-- Content lives in the posts table, so a new post is an insert. The title is a
-- column of its own (api/post.js renders it as the <h1>), so the body starts at
-- the first paragraph, without the markdown heading.

insert into public.posts (slug, title, excerpt, body, published, published_at)
values (
  'tradisi-yang-bertahan-harus-berani-berubah',
  'Tradisi yang Bertahan Harus Berani Berubah',
  'Banten kini bercampur plastik dan styrofoam, dan alam tak bisa menerima apa pun tanpa batas. Tradisi yang kuat bukan yang menolak perubahan, tetapi yang menjaga nilai intinya — termasuk membersihkan alam setelah ritual.',
  $body$Saya tumbuh di Bali. Saya tumbuh bersama canang, banten, upacara, gamelan, dan segala sesuatu yang membuat pulau ini terasa hidup. Saya tidak pernah melihat tradisi sebagai beban. Justru saya melihatnya sebagai salah satu alasan mengapa Bali berbeda dari tempat lain.

Karena itulah saya merasa semakin gelisah.

Keresahan saya bukan karena tradisinya. Keresahan saya adalah karena kita mulai sulit membedakan mana yang merupakan esensi dari tradisi, dan mana yang sekadar kebiasaan yang diwariskan tanpa pernah lagi dipertanyakan.

Saya sering bertanya kepada diri sendiri: jika tujuan sebuah persembahan adalah ungkapan rasa syukur, apakah cara kita memperlakukan persembahan setelah ritual selesai juga tidak seharusnya mencerminkan rasa syukur itu?

Hari ini, kita menghadapi masalah yang mungkin tidak pernah dibayangkan oleh leluhur kita: volume sampah yang jauh lebih besar daripada kemampuan alam untuk mengurainya.

Banten modern tidak lagi sepenuhnya terdiri dari bahan alami. Banyak yang menggunakan plastik, styrofoam, pita sintetis, kemasan sekali pakai, hingga berbagai material yang bertahan puluhan bahkan ratusan tahun di alam.

Ini jelas perlu berubah.

Tetapi bahkan jika seluruh banten kembali menggunakan bahan alami sekalipun, menurut saya pertanyaannya belum selesai.

Banyak orang berkata, "Kan itu daun, nanti juga terurai."

Benar.

Namun daun yang dibuang oleh satu orang berbeda dengan daun yang dibuang oleh jutaan orang, setiap hari, sepanjang tahun, pada tempat yang sama.

Alam mampu mengurai.

Bukan berarti alam mampu menerima apa pun dalam jumlah tak terbatas.

Saya sering teringat Sungai Gangga di India.

Bagi ratusan juta orang, sungai itu adalah tempat yang sangat suci. Tempat beribadah. Tempat melakukan ritual. Tempat abu jenazah dihanyutkan. Tempat berbagai persembahan dilepaskan ke air.

Saya tidak sedang menghakimi keyakinan siapa pun.

Tetapi jika seseorang yang tidak memahami konteks spiritual itu berdiri di tepi sungai, apa yang mereka lihat?

Mereka melihat sungai yang dipenuhi sampah, sisa persembahan, limbah, dan polusi.

Kesuciannya dipercaya oleh manusia.

Kebersihannya ditentukan oleh tindakan manusia.

Dua hal itu tidak selalu berjalan bersamaan.

Saya khawatir Bali bisa mengarah ke sana jika kita tidak mulai berpikir ulang.

Kita sering mengatakan laut itu suci.

Kita mengatakan sungai itu suci.

Kita mengatakan gunung itu suci.

Tetapi alam tidak memahami konsep "suci" seperti manusia memahaminya.

Sungai tidak tahu bahwa yang masuk ke dalamnya adalah persembahan.

Laut tidak tahu bahwa yang terapung adalah bagian dari ritual.

Secara fisika dan biologi, semuanya tetap menjadi material yang harus diuraikan. Sebagian membusuk, sebagian menyumbat aliran air, sebagian berubah menjadi limbah, dan sebagian lagi tidak pernah benar-benar hilang.

Menghormati alam tidak cukup hanya dengan menyebutnya suci.

Menghormati alam berarti memastikan tindakan kita tidak merusaknya.

Saya justru berpikir bahwa menjaga kebersihan setelah ritual adalah bagian dari ritual itu sendiri.

Mungkin inilah saatnya kita berani bertanya.

Apakah semua persembahan harus dihanyutkan?

Apakah semua harus dibiarkan di alam?

Apakah ada cara yang lebih bertanggung jawab tanpa mengurangi makna spiritualnya?

Sejarah menunjukkan bahwa tradisi selalu berubah.

Leluhur kita tidak hidup dengan plastik.

Mereka tidak mengenal styrofoam.

Mereka tidak menghasilkan jutaan ton sampah setiap tahun.

Kalau mereka hidup pada zaman yang berbeda, bukankah masuk akal jika cara menjalankan tradisi juga menyesuaikan tantangan zamannya?

Bagi saya, mempertanyakan cara bukan berarti menolak tradisi.

Justru itu adalah bentuk kepedulian agar tradisi tetap bisa bertahan.

Saya percaya agama dan budaya yang kuat bukanlah yang menolak perubahan, melainkan yang mampu mempertahankan nilai-nilai intinya sambil memperbaiki praktik-praktik yang sudah tidak sesuai dengan realitas.

Esensi persembahan bukanlah di mana akhirnya dibuang.

Esensinya ada pada ketulusan.

Esensinya ada pada rasa syukur.

Esensinya ada pada hubungan manusia dengan Tuhan, sesama manusia, dan alam.

Kalau setelah sebuah upacara selesai kita meninggalkan tumpukan sampah di sungai, di pantai, atau di hutan, saya rasa ada sesuatu yang perlu kita renungkan bersama.

Bukan karena iman kita kurang.

Tetapi karena mungkin cara kita menjalankan iman belum sepenuhnya selaras dengan tanggung jawab kita terhadap lingkungan.

Saya tidak menulis ini untuk menyalahkan siapa pun.

Saya menulis ini karena saya ingin Bali tetap menjadi Bali.

Pulau yang indah bukan hanya karena pura-puranya berdiri megah, tetapi juga karena sungainya tetap jernih, lautnya tetap bersih, dan alamnya tetap mampu menghidupi generasi berikutnya.

Tradisi yang baik tidak takut dievaluasi.

Karena tujuan akhirnya bukan mempertahankan setiap kebiasaan, melainkan mempertahankan nilai yang membuat kebiasaan itu lahir sejak awal.$body$,
  true,
  now()
)
on conflict (slug) do nothing;
