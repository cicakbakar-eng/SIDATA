class Kendaraan {
  int? id;
  String? namaPemilik;
  String? nomorPolisi;
  String? jenisKendaraan;
  String? merkKendaraan;
  String? nomorRegistrasi;
  String? suratSurat;

  Kendaraan({
    this.id,
    this.namaPemilik,
    this.nomorPolisi,
    this.jenisKendaraan,
    this.merkKendaraan,
    this.nomorRegistrasi,
    this.suratSurat,
  });

  // Konversi objek Kendaraan ke Map untuk penyimpanan di database
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'nama_pemilik': namaPemilik,
      'nomor_polisi': nomorPolisi,
      'jenis_kendaraan': jenisKendaraan,
      'merk_kendaraan': merkKendaraan,
      'nomor_registrasi': nomorRegistrasi,
      'surat_surat': suratSurat,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  // Konversi Map dari database ke objek Kendaraan
  factory Kendaraan.fromMap(Map<String, dynamic> map) {
    return Kendaraan(
      id: map['id'],
      namaPemilik: map['nama_pemilik'],
      nomorPolisi: map['nomor_polisi'],
      jenisKendaraan: map['jenis_kendaraan'],
      merkKendaraan: map['merk_kendaraan'],
      nomorRegistrasi: map['nomor_registrasi'],
      suratSurat: map['surat_surat'],
    );
  }
}
