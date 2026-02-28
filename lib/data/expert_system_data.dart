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
  final Map<String, double> symptomWeights;

  Disease({
    required this.id,
    required this.name,
    required this.description,
    required this.treatment,
    required this.symptomWeights,
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
      description: 'Penyakit jamur yang menyerang daun dan leher malai padi.',
      treatment: 'Gunakan varietas tahan, atur jarak tanam, hindari pupuk N berlebih, aplikasikan fungisida berbahan aktif trisiklazol atau benomil.',
      symptomWeights: {'g19': 0.8, 'g20': 0.9, 'g01': 0.6, 'g03': 0.4},
    ),
    Disease(
      id: 'p02',
      name: 'Hawar Daun Bakteri / Kresek',
      description: 'Penyakit bakteri yang menyebabkan daun mengering seperti terbakar.',
      treatment: 'Gunakan benih sehat, atur pengairan agar tidak tergenang terus, gunakan bakterisida berbahan aktif tembaga.',
      symptomWeights: {'g04': 0.6, 'g02': 0.7, 'g03': 0.8, 'g09': 0.9},
    ),
    Disease(
      id: 'p03',
      name: 'Tungro',
      description: 'Penyakit virus yang ditularkan oleh wereng hijau, menyebabkan padi kerdil dan kuning/oranye.',
      treatment: 'Kendalikan vektor (wereng hijau) dengan insektisida, gunakan varietas tahan, cabut dan musnahkan tanaman yang sakit.',
      symptomWeights: {'g05': 0.8, 'g06': 0.7, 'g16': 0.9},
    ),
    Disease(
      id: 'p04',
      name: 'Bercak Coklat (Brown Spot)',
      description: 'Penyakit jamur yang sering muncul pada tanah miskin unsur hara.',
      treatment: 'Perbaiki kesuburan tanah (tambahkan pupuk K dan bahan organik), gunakan fungisida.',
      symptomWeights: {'g01': 0.8, 'g02': 0.5, 'g03': 0.6},
    ),
    Disease(
      id: 'p05',
      name: 'Busuk Batang',
      description: 'Penyakit jamur yang menyebabkan pangkal batang membusuk.',
      treatment: 'Keringkan sawah secara berkala, hindari pemupukan N terlalu tinggi, gunakan fungisida sistemik.',
      symptomWeights: {'g11': 0.9, 'g12': 0.8, 'g18': 0.7, 'g05': 0.4},
    ),
    Disease(
      id: 'p06',
      name: 'Busuk Pelepah (Sheath Blight)',
      description: 'Penyakit jamur yang menyerang pelepah daun padi.',
      treatment: 'Atur jarak tanam (jangan terlalu rapat), kurangi kelembaban, aplikasikan fungisida berbahan aktif heksakonazol.',
      symptomWeights: {'g13': 0.9, 'g01': 0.4, 'g03': 0.5},
    ),
    Disease(
      id: 'p07',
      name: 'Kerdil Rumput',
      description: 'Penyakit virus yang ditularkan oleh wereng coklat, anakan menjadi sangat banyak seperti rumput.',
      treatment: 'Kendalikan wereng coklat, gunakan varietas tahan, sanitasi lingkungan.',
      symptomWeights: {'g05': 0.7, 'g02': 0.5, 'g08': 0.6}, // asumsikan gejala tumpang tindih
    ),
    Disease(
      id: 'p08',
      name: 'Kerdil Hampa',
      description: 'Penyakit virus, tanaman kerdil, daun melintir dan malai hampa.',
      treatment: 'Kendalikan vektor wereng coklat, cabut tanaman sakit.',
      symptomWeights: {'g05': 0.8, 'g08': 0.9, 'g10': 0.8},
    ),
    Disease(
      id: 'p09',
      name: 'Penyakit Garis Daun Bakteri (Bacterial Leaf Streak)',
      description: 'Disebabkan oleh bakteri Xanthomonas, muncul garis basah pada daun.',
      treatment: 'Gunakan benih bebas patogen, jaga sanitasi kebun, aplikasi bakterisida.',
      symptomWeights: {'g07': 0.9, 'g04': 0.7, 'g02': 0.5},
    ),
    Disease(
      id: 'p10',
      name: 'Penggerek Batang Padi (Sundep/Beluk)',
      description: 'Serangan hama ulat penggerek batang yang menyebabkan pucuk mati atau malai hampa.',
      treatment: 'Pengaturan pola tanam, aplikasi insektisida butiran, gunakan musuh alami (Trichogramma).',
      symptomWeights: {'g17': 0.9, 'g10': 0.9, 'g02': 0.4},
    ),
    Disease(
      id: 'p11',
      name: 'Penyakit Bakanae',
      description: 'Penyakit jamur Fusarium yang menyebabkan tanaman tumbuh abnormal tinggi atau kerdil pucat.',
      treatment: 'Perlakuan benih (seed treatment) dengan fungisida, cabut tanaman sakit.',
      symptomWeights: {'g02': 0.6, 'g03': 0.5, 'g15': 0.4}, // Gejala kerdil pucat atau mati
    ),
    Disease(
      id: 'p12',
      name: 'Luka Api (False Smut)',
      description: 'Penyakit jamur yang menyerang bulir padi, berubah menjadi gumpalan spora hijau kehitaman.',
      treatment: 'Aplikasi fungisida pada saat stadia bunting, pemupukan berimbang.',
      symptomWeights: {'g10': 0.5, 'g14': 0.8}, // Diwakili tepung putih/spora
    ),
    Disease(
      id: 'p13',
      name: 'Penyakit Merah (Keracunan Besi/Asam)',
      description: 'Kondisi fisiologis akibat tanah terlalu masam atau keracunan zat besi.',
      treatment: 'Perbaiki drainase (keringkan lahan berkala), aplikasikan kapur pertanian (dolomit), gunakan varietas toleran.',
      symptomWeights: {'g16': 0.8, 'g05': 0.6, 'g15': 0.7},
    ),
    Disease(
      id: 'p14',
      name: 'Hawar Pelepah Daun',
      description: 'Penyakit bakteri yang menyerang pelepah padi muda.',
      treatment: 'Hindari genangan air berlebih, gunakan varietas tahan, aplikasi bakterisida tembaga.',
      symptomWeights: {'g13': 0.8, 'g09': 0.7, 'g04': 0.5},
    ),
    Disease(
      id: 'p15',
      name: 'Penyakit Nematoda Akar',
      description: 'Serangan nematoda pada akar yang menyebabkan tanaman kerdil dan daun menguning.',
      treatment: 'Rotasi tanaman dengan bukan inang, pengolahan tanah yang baik, gunakan nematisida jika perlu.',
      symptomWeights: {'g05': 0.6, 'g02': 0.7, 'g15': 0.8},
    ),
  ];
}
