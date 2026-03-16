class Symptom {
  final String id;
  final String title;
  final String description;

  Symptom({
    required this.id,
    required this.title,
    required this.description,
  });
}

class Disease {
  final String id;
  final String name;
  final String description;
  final String treatment;
  final String prevention;
  final Map<String, double> symptomWeights;
  final String imageUrl;

  Disease({
    required this.id,
    required this.name,
    required this.description,
    required this.treatment,
    required this.prevention,
    required this.symptomWeights,
    required this.imageUrl,
  });
}

class ExpertSystemData {
  static final List<Symptom> symptoms = [
    Symptom(id: 'g01', title: 'Bercak coklat pada daun', description: 'Terdapat bercak berbentuk oval dengan warna coklat di tengah dan tepi kemerahan.'),
    Symptom(id: 'g02', title: 'Daun menguning', description: 'Daun berubah warna menjadi kuning mulai dari ujung atau tepi daun.'),
    Symptom(id: 'g03', title: 'Daun mengering', description: 'Daun menjadi kering dan mati, biasanya dimulai dari bagian bawah tanaman.'),
    Symptom(id: 'g04', title: 'Bercak basah pada daun', description: 'Terdapat bercak kebasah-basahan pada daun yang menyebar.'),
    Symptom(id: 'g05', title: 'Pertumbuhan kerdil', description: 'Tanaman padi tidak tumbuh secara normal, terlihat lebih pendek dari biasanya.'),
    Symptom(id: 'g06', title: 'Anakan berkurang', description: 'Jumlah anakan padi lebih sedikit dari batas normal.'),
    Symptom(id: 'g07', title: 'Garis kuning memanjang', description: 'Terdapat garis-garis berwarna kuning yang memanjang sejajar dengan tulang daun.'),
    Symptom(id: 'g08', title: 'Daun melintir', description: 'Daun padi terlihat melintir atau menggulung ke arah dalam.'),
    Symptom(id: 'g09', title: 'Terdapat lendir bakteri', description: 'Pada pagi hari atau cuaca lembab, keluar lendir berwarna kekuningan dari daun yang terinfeksi.'),
    Symptom(id: 'g10', title: 'Malai hampa', description: 'Malai padi tidak berisi atau hampa, seringkali berwarna putih (beluk).'),
    Symptom(id: 'g11', title: 'Pangkal batang membusuk', description: 'Bagian pangkal batang menjadi lunak, berwarna coklat kehitaman, dan membusuk.'),
    Symptom(id: 'g12', title: 'Bau busuk', description: 'Tercium bau busuk yang menyengat dari pangkal batang atau akar tanaman.'),
    Symptom(id: 'g13', title: 'Selubung daun membusuk', description: 'Selubung daun mengalami pembusukan, biasanya disertai bercak.'),
    Symptom(id: 'g14', title: 'Terdapat tepung putih', description: 'Permukaan daun atau batang ditutupi lapisan seperti tepung berwarna putih (miselium jamur).'),
    Symptom(id: 'g15', title: 'Akar berwarna hitam', description: 'Akar tanaman padi berwarna hitam dan mudah putus.'),
    Symptom(id: 'g16', title: 'Daun berwarna oranye', description: 'Daun padi berubah warna menjadi oranye kemerahan, terutama pada daun tua.'),
    Symptom(id: 'g17', title: 'Pucuk mati (Sundep)', description: 'Titik tumbuh atau pucuk batang mati dan mudah dicabut.'),
    Symptom(id: 'g18', title: 'Batang mudah patah', description: 'Batang padi menjadi rapuh dan sangat mudah patah jika terkena angin.'),
    Symptom(id: 'g19', title: 'Bercak belah ketupat', description: 'Terdapat lesi atau bercak berbentuk seperti belah ketupat pada daun.'),
    Symptom(id: 'g20', title: 'Leher malai busuk', description: 'Bagian leher malai membusuk (neck blast), menyebabkan malai patah.'),
  ];

  static final List<Disease> diseases = [
    Disease(
      id: 'p01',
      name: 'Penyakit Blast (Pyricularia oryzae)',
      description: 'Penyakit jamur yang menyerang daun dan leher malai padi. Penyakit ini sangat merusak bila menyerang pada fase generatif, menyebabkan patah leher (neck blast) dan bulir hampa.',
      treatment: '1. Aplikasikan fungisida berbahan aktif trisiklazol atau benomil pada fase pembentukan anakan maksimum dan fase bunting.\n2. Segera semprotkan fungisida jika melihat gejala awal bercak belah ketupat.',
      prevention: '1. Gunakan varietas padi yang tahan terhadap blast (seperti Inpari 32 HDB, Inpari 33).\n2. Atur jarak tanam agar tidak terlalu rapat (gunakan sistem legowo).\n3. Hindari penggunaan pupuk Nitrogen (N) yang berlebihan karena akan membuat tanaman lebih rentan.',
      symptomWeights: {'g19': 0.8, 'g20': 0.9, 'g01': 0.6, 'g03': 0.4},
      imageUrl: 'https://imgs.search.brave.com/SAB0WZdH9R6fdHHQFTK0eZodh0klenllGzI3THkrGNg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cGxhbnR3aXNlLm9y/Zy9rbm93bGVkZ2Vi/YW5rL2ZhY3RzaGVl/dGFkbWluL3VwbG9h/ZHMvZmFjdHNoZWV0/cy84NTFhNmUxYi0y/NmNiLTQ3MzMtYWQz/Ny0zNDljYThmMWJk/ODYucG5n',
    ),
    Disease(
      id: 'p02',
      name: 'Hawar Daun Bakteri / Kresek',
      description: 'Penyakit bakteri (Xanthomonas oryzae pv. oryzae) yang menyebabkan daun mengering seperti tersiram air panas, dimulai dari tepi atau ujung daun, lalu meluas ke seluruh bagian daun.',
      treatment: '1. Semprotkan bakterisida yang berbahan aktif tembaga atau asam oksolinik.\n2. Jika lahan tergenang, segera keringkan atau kurangi ketinggian air.\n3. Jangan memupuk dengan Urea saat serangan sedang parah.',
      prevention: '1. Gunakan benih yang sehat dan bersertifikat.\n2. Lakukan perlakuan benih (seed treatment) sebelum tanam.\n3. Buat sistem pengairan dan drainase yang baik agar air tidak terus-menerus menggenang.\n4. Tanam varietas tahan kresek (Inpari 32, Ciherang).',
      symptomWeights: {'g04': 0.6, 'g02': 0.7, 'g03': 0.8, 'g09': 0.9},
      imageUrl: 'https://imgs.search.brave.com/6THkvnehgEXLwmzm_bUSaazSFAWcTPF1Qm_M7KwA2SI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9lc2Zv/cnJwZDIuYmxvZy51/bm11bC5hYy5pZC9h/c3NldHMvaW1hZ2Vz/L2RpYWdub3NhL2Jl/cmNha2Nva2xhdC5q/cGc',
    ),
    Disease(
      id: 'p03',
      name: 'Tungro',
      description: 'Penyakit virus yang ditularkan oleh wereng hijau (Nephotettix virescens). Penyakit ini sangat berbahaya, menyebabkan tanaman kerdil, daun berwarna kuning atau oranye, dan jumlah anakan sedikit.',
      treatment: '1. Cabut dan musnahkan (bakar) tanaman yang sudah parah terinfeksi agar tidak menular.\n2. Segera kendalikan vektor wereng hijau dengan insektisida berbahan aktif BPMC, buprofezin, atau imidakloprid.',
      prevention: '1. Tanam padi secara serempak di seluruh kawasan.\n2. Gunakan varietas tahan wereng hijau atau tahan virus tungro (seperti Inpari 36 Lanrang).\n3. Singkirkan gulma atau sisa tanaman sebelumnya (singgang) yang bisa menjadi tempat hidup virus.\n4. Lakukan rotasi tanaman dengan palawija.',
      symptomWeights: {'g05': 0.8, 'g06': 0.7, 'g16': 0.9},
      imageUrl: 'https://imgs.search.brave.com/hhdxaaulmayu3A_BZCVnXCwIU3Zu7pBtwo1-8aPlaGU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hbGNo/ZXRyb24uY29tL2Nk/bi9yaWNlLXR1bmdy/by1iYWNpbGxpZm9y/bS12aXJ1cy01Zjlm/OTJiMy1jMzljLTQw/YTctODdiYS1jMWRk/NTRkZDlkOC1yZXNp/emUtNzUwLmpwZWc',
    ),
    Disease(
      id: 'p04',
      name: 'Bercak Coklat (Brown Spot)',
      description: 'Penyakit jamur (Bipolaris oryzae) yang biasa muncul ketika padi ditanam pada tanah yang miskin unsur hara atau kekeringan.',
      treatment: '1. Semprotkan fungisida yang mengandung mankozeb atau propikonazol.\n2. Berikan pupuk Kalium (K) tambahan untuk membantu tanaman pulih.',
      prevention: '1. Perbaiki tingkat kesuburan tanah dengan menambahkan bahan organik atau kompos.\n2. Lakukan pemupukan berimbang antara N, P, dan K.\n3. Jaga pengairan agar tanah tidak terlalu kering di fase pertumbuhan awal.',
      symptomWeights: {'g01': 0.8, 'g02': 0.5, 'g03': 0.6},
      imageUrl: 'https://imgs.search.brave.com/-4BXAPP1Gg-fi5RuxGesTvFV5bBo0u5KNYqdZyPiNVI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Z2VyLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9pbWcvYi9SMjl2/WjJ4bC9BVnZYc0Vo/OG5YOEtzM0djYVZL/YkpCelpnWWRyOWpF/RU1GbkRFZm9iRkhm/em96bUVsUDJyX2lf/SFctZTE1am1hbDE0/dU9TT0t4OGNyaDgt/Y0REQ2c4elk1YkM2/eDFyTWs5bVlSWHdL/UWhEWi1ra2pDbWlY/WVpCS1pYQUZEMEk1/YWluMko1a0pnV2xf/ZjFqdVJPeFF0L3Mz/MjAvU2NyZWVuc2hv/dF81OS5wbmc',
    ),
    Disease(
      id: 'p05',
      name: 'Busuk Batang',
      description: 'Penyakit jamur (Sclerotium oryzae) yang menyerang pangkal batang, menyebabkan batang melunak, busuk kehitaman, dan tanaman rebah.',
      treatment: '1. Kurangi air segera di lahan persawahan.\n2. Aplikasikan fungisida sistemik berbahan aktif heksakonazol atau difenokonazol pada pangkal batang.',
      prevention: '1. Terapkan pola pengairan berselang (intermittent irrigation) dengan cara mengeringkan sawah secara berkala.\n2. Jangan gunakan pupuk Urea berlebihan.\n3. Tanam varietas padi dengan batang yang keras dan kuat.',
      symptomWeights: {'g11': 0.9, 'g12': 0.8, 'g18': 0.7, 'g05': 0.4},
      imageUrl: 'https://imgs.search.brave.com/4pXKUrxHDuXdwQTq21U2Wtl5DgfDmnOzU1H7KHWiff8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50LnBlYXQtY2xv/dWQuY29tL3c0MDAv/c3RlbS1yb3Qtb2Yt/cmljZS1yaWNlLTE1/ODM1MDA1NTguanBn',
    ),
    Disease(
      id: 'p06',
      name: 'Busuk Pelepah (Sheath Blight)',
      description: 'Penyakit jamur (Rhizoctonia solani) yang menyerang pelepah daun (bagian batang tempat daun melekat). Biasanya mulai dari atas permukaan air, ditandai bercak oval abu-abu.',
      treatment: '1. Semprotkan fungisida yang efektif untuk Rhizoctonia, seperti yang berbahan aktif validamisin, heksakonazol, atau difenokonazol.\n2. Bersihkan bagian bawah tanaman jika banyak daun tua yang mati.',
      prevention: '1. Tanam padi dengan jarak tanam yang tidak terlalu rapat agar sirkulasi udara lancar (contoh: Jajar Legowo).\n2. Gunakan pupuk nitrogen secukupnya saja.\n3. Bersihkan sisa-sisa tanaman musim lalu yang terinfeksi sebelum mengolah lahan.',
      symptomWeights: {'g13': 0.9, 'g01': 0.4, 'g03': 0.5},
      imageUrl: 'https://imgs.search.brave.com/GHBiW3cOMIg37QFZWy0SG2oEuG-exuU3loZdLFMhKfI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdG9y/YWdlLmdvb2dsZWFw/aXMuY29tL2Rndy1l/dmVudC1idWNrZXQt/MS94bGFyZ2UvUmhp/em9jdG9uaWEtc29s/YW5pLWhhd2FyLXBl/bGVwYWgtc2NhbGVk/LmpwZw',
    ),
    Disease(
      id: 'p07',
      name: 'Kerdil Rumput',
      description: 'Penyakit virus yang disebarkan oleh wereng coklat (Nilaparvata lugens). Tanaman yang terinfeksi memiliki anakan yang sangat banyak, daun pendek tegak mirip rumput liar.',
      treatment: '1. Cabut tanaman padi yang sudah menunjukkan gejala seperti rumput, karena tidak bisa diobati dan bisa menularkan ke yang lain.\n2. Segera semprot insektisida untuk mematikan wereng coklat (pymetrozine, dinotefuran, dll).',
      prevention: '1. Kendalikan populasi wereng coklat secara preventif.\n2. Tanam varietas tahan wereng coklat (VUTW).\n3. Lakukan pengamatan rutin sejak pesemaian.\n4. Sanitasi lingkungan dari gulma dan singgang.',
      symptomWeights: {'g05': 0.7, 'g02': 0.5, 'g08': 0.6},
      imageUrl: 'https://imgs.search.brave.com/LML_K-1DqtXULx8I0oqPYTiw_gh8wlke5Eltlw2RTjY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Z2VyLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9pbWcvYi9SMjl2/WjJ4bC9BVnZYc0Vq/Vmp2WUx3aWg4YzZk/QjA0cnVGNWZndmVS/V3Z6SGExa0o0X0lI/NUszb1hoQVk3a3FU/SXgwT2RMM1FEMGRC/Y1NYY1pXRVlCc2hK/TlRJNllSak80cHlj/NlVzNkl2QThINDF6/d25KZFB6Tkw4NS0w/NUZuY3k2QzdObTd4/cmEyNkVRYmZSbm1k/WHlvSTV4YTFPL3Mz/MjAvU2NyZWVuc2hv/dF83Ni5wbmc',
    ),
    Disease(
      id: 'p08',
      name: 'Kerdil Hampa',
      description: 'Penyakit virus yang disebarkan oleh wereng coklat. Daun padi bisa melintir atau bergerigi, tanaman kerdil, dan jika berhasil berbunga, bulir malainya akan hampa.',
      treatment: '1. Kendalikan populasi wereng coklat dengan insektisida yang direkomendasikan.\n2. Cabut segera tanaman yang sudah memperlihatkan gejala keriting/melintir pada daun dan musnahkan.',
      prevention: '1. Terapkan sistem tanam serempak dalam hamparan sawah.\n2. Pilih benih unggul tahan wereng coklat.\n3. Jangan menanam secara terus menerus (rotasi tanaman).',
      symptomWeights: {'g05': 0.8, 'g08': 0.9, 'g10': 0.8},
      imageUrl: 'https://imgs.search.brave.com/jZppWqyKB_GXJodHOrCH9MxG7Pu8Lnsi-0ga3ZJCRxw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hZ3Jp/a2FuLmlkL3dwLWNv/bnRlbnQvdXBsb2Fk/cy8yMDE5LzEwL0tl/cmRpbC1ydW11dC10/aXBlLTItMi5qcGc',
    ),
    Disease(
      id: 'p09',
      name: 'Penyakit Garis Daun Bakteri (Bacterial Leaf Streak)',
      description: 'Bakteri (Xanthomonas oryzae pv. oryzicola) masuk melalui stomata atau luka pada daun, memunculkan garis-garis berair berwarna kuning kecoklatan di antara tulang daun.',
      treatment: '1. Semprot tanaman menggunakan bakterisida.\n2. Kurangi tinggi genangan air di sawah untuk menurunkan tingkat kelembapan.',
      prevention: '1. Gunakan benih bersertifikat bebas bakteri.\n2. Terapkan sanitasi yang baik, bersihkan gulma yang mungkin menjadi inang.\n3. Hindari pupuk Urea terlalu banyak.',
      symptomWeights: {'g07': 0.9, 'g04': 0.7, 'g02': 0.5},
      imageUrl: 'https://imgs.search.brave.com/0sNDib0T-lIZz_mGhm3XeO4fiprJKQdKE1gGD5S8ekA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50LnBlYXQtY2xv/dWQuY29tL3c0MDAv/YmFjdGVyaWFsLWxl/YWYtc3RyZWFrLXJp/Y2UtMTU2ODM3MzQ2/My5qcGc',
    ),
    Disease(
      id: 'p10',
      name: 'Penggerek Batang Padi (Sundep/Beluk)',
      description: 'Bukan penyakit melainkan hama ulat yang mengebor batang. Gejala sundep (titik tumbuh mati pada masa vegetatif) atau beluk (malai putih hampa pada masa generatif).',
      treatment: '1. Jika serangan baru mulai (sundep), aplikasikan insektisida sistemik berbahan aktif karbofuran atau fipronil.\n2. Pada fase generatif (beluk), pengobatan kimia sering kurang efektif karena ulat sudah di dalam batang, tapi penyemprotan bisa mencegah ngengat bertelur lagi.',
      prevention: '1. Tanam serentak agar populasi tidak terpusat.\n2. Potong jerami serendah mungkin saat panen dan bajak segera agar ulat/kepompong mati.\n3. Pasang lampu perangkap (light trap) untuk menangkap ngengat dewasa.',
      symptomWeights: {'g17': 0.9, 'g10': 0.9, 'g02': 0.4},
      imageUrl: 'https://imgs.search.brave.com/c8BIbO7qRcGrc3w6LjvjbWst0tEXQZFDlG-ktqV0RSE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jeWJl/eHQuaWQvdXBsb2Fk/cy9taWdyYXNpLzE1/MmQ0ZTZiYmExNGZh/NWRmMWRkMjdiZjBi/YmExZGViLmpwZw',
    ),
    Disease(
      id: 'p11',
      name: 'Penyakit Bakanae',
      description: 'Disebabkan jamur Fusarium fujikuroi. Menghasilkan hormon giberelin yang menyebabkan bibit/tanaman tumbuh pucat, kurus, dan abnormal sangat tinggi, lalu akhirnya mati.',
      treatment: '1. Cabut dan buang tanaman yang tinggi kurus abnormal.\n2. Penyemprotan saat di sawah kurang efektif, namun fungisida berbahan benomil bisa dipertimbangkan jika serangan meluas.',
      prevention: '1. Pengobatan paling efektif adalah seed treatment (perendaman benih) dengan fungisida (seperti benomil, prokloraz) sebelum disemai.\n2. Jangan gunakan benih dari tanaman yang pernah terkena bakanae.',
      symptomWeights: {'g02': 0.6, 'g03': 0.5, 'g15': 0.4},
      imageUrl: 'https://imgs.search.brave.com/5_PGAglPtV5w7hZB7VGDKzWVC3h4fu_iNllxMGK3fuw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50LnBlYXQtY2xv/dWQuY29tL3c0MDAv/YmFrYW5hZS1hbmQt/Zm9vdC1yb3Qtcmlj/ZS0xLmpwZw',
    ),
    Disease(
      id: 'p12',
      name: 'Luka Api (False Smut)',
      description: 'Jamur (Ustilaginoidea virens) merubah bulir padi menjadi gumpalan spora seperti beludru bulat berwarna hijau kekuningan atau hijau kehitaman.',
      treatment: '1. Jika spora belum pecah, aplikasikan fungisida pada saat stadia bunting.\n2. Buang bulir yang terserang sebelum dipanen agar spora tidak mencemari gabah sehat.',
      prevention: '1. Semprot fungisida pencegah pada 1 minggu sebelum padi malai keluar (fase bunting) dan 1 minggu sesudahnya.\n2. Pemupukan nitrogen harus diseimbangkan dengan Fosfor (P) dan Kalium (K).',
      symptomWeights: {'g10': 0.5, 'g14': 0.8},
      imageUrl: 'https://imgs.search.brave.com/tVdcilXSKm4ZHQQFfVPJRAt3AvXAWS1Qhh4hH-sIJ58/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wZXJ0/YW5pYW4udW1hLmFj/LmlkL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIyLzA2L0tlbWVu/dGFuLVRhbmFtLTUw/LjAwMC1IZWt0YXJl/LVBhZGktSVItTnV0/cmktWmluYy11bnR1/ay1NZW5nYXRhc2kt/U3R1bnRpbmcuanBn',
    ),
    Disease(
      id: 'p13',
      name: 'Penyakit Merah (Keracunan Besi/Asam)',
      description: 'Kondisi fisiologis (bukan karena kuman/hama) akibat pH tanah terlalu masam (gambut/rawa) atau kelebihan zat besi larut. Daun berubah dari ujungnya menjadi cokelat oranye.',
      treatment: '1. Keringkan petak sawah secara berkala (drainase) agar racun besi teroksidasi dan mengendap.\n2. Semprotkan pupuk daun kaya Zinc (Seng) atau taburkan pupuk kandang/kompos matang.',
      prevention: '1. Berikan bahan amelioran (seperti kapur dolomit atau abu sekam) sebelum tanam untuk menaikkan pH tanah.\n2. Gunakan varietas padi yang toleran terhadap keracunan besi atau tanah masam.',
      symptomWeights: {'g16': 0.8, 'g05': 0.6, 'g15': 0.7},
      imageUrl: 'https://imgs.search.brave.com/n3lyscNUrfyF8tBtSXhLKueNhzYo0kmj8FPI2h2l-1o/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wZXJ0/YW5pYW4ubmdhd2lr/YWIuZ28uaWQvd3At/Y29udGVudC91cGxv/YWRzLzIwMjIvMTEv/V2hhdHNBcHAtSW1h/Z2UtMjAyMi0xMS0x/MC1hdC0xNC40OC40/MC0xMDgweDY3NS5q/cGVn',
    ),
    Disease(
      id: 'p14',
      name: 'Hawar Pelepah Daun',
      description: 'Penyakit bakteri (Pseudomonas syringae) yang juga menyerang pelepah muda, menghasilkan pembusukan yang bisa merambat ke daun teratas. Sering di musim hujan.',
      treatment: '1. Kurangi ketinggian air di sawah.\n2. Aplikasikan bakterisida tembaga atau antibiotik pertanian dengan dosis yang dianjurkan.',
      prevention: '1. Pastikan sanitasi benih baik.\n2. Lakukan pengendalian gulma dengan rutin karena gulma di sela tanaman bisa menaikkan kelembaban berlebih.\n3. Jangan memupuk urea terlalu tinggi di awal musim tanam.',
      symptomWeights: {'g13': 0.8, 'g09': 0.7, 'g04': 0.5},
      imageUrl: 'https://imgs.search.brave.com/LIYe8Zx44ztI9MLCaIAtl9tQ72ec13JE_4LePBT4UdY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vd3d3Lmth/bXB1c3RhbmkuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIw/LzEyL0NhcmEtTWVu/Z2F0YXNpLUhhd2Fy/LURhdW4tUGFkYS1U/YW5hbWFuLVBhZGku/anBnP3Jlc2l6ZT05/MTAsNTA4JnNzbD0x',
    ),
    Disease(
      id: 'p15',
      name: 'Penyakit Nematoda Akar',
      description: 'Serangan cacing kecil mikroskopik (Nematoda) seperti Meloidogyne sp. yang masuk ke dalam akar, membentuk puru/bintil pada akar. Akibatnya penyerapan nutrisi gagal, padi kerdil dan menguning.',
      treatment: '1. Jika serangan terlihat, berikan pupuk NPK ekstra secara berimbang agar tanaman punya tenaga untuk memulihkan akar.\n2. Penggunaan nematisida butiran bisa dilakukan tapi perlu pertimbangan biaya.',
      prevention: '1. Rotasi atau pergiliran tanaman sangat penting. Jangan tanam padi terus menerus; selingi dengan palawija yang bukan inang nematoda.\n2. Pengolahan tanah (bajak) di musim kemarau dan jemur tanah akan mematikan nematoda.',
      symptomWeights: {'g05': 0.6, 'g02': 0.7, 'g15': 0.8},
      imageUrl: 'https://imgs.search.brave.com/XUFNZ6ouGTloakIBDVWmgmZiISuuynaJjlu4L3WROuM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9hZ3Jv/a29tcGxla3NraXRh/LmNvbS93cC1jb250/ZW50L3VwbG9hZHMv/MjAxNy8wNC9HRUpB/TEEtUEFESS5qcGc',
    ),
  ];
}
