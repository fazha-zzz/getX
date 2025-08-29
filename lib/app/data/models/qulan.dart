class QulanModel {
  String? arti;
  String? asma;
  int? ayat;
  String? nama;
  SuratType? type;
  String? urut;
  String? audio;
  String? nomor;
  String? rukuk;
  String? keterangan;

  QulanModel({
    this.arti,
    this.asma,
    this.ayat,
    this.nama,
    this.type,
    this.urut,
    this.audio,
    this.nomor,
    this.rukuk,
    this.keterangan,
  });

  factory QulanModel.fromJson(Map<String, dynamic> json) {
    return QulanModel(
      arti: json['arti'] ?? '',
      asma: json['asma'] ?? '',
      ayat: json['ayat'] is int
          ? json['ayat']
          : int.tryParse(json['ayat']?.toString() ?? '0'),
      nama: json['nama'] ?? '',
      type: _parseType(json['type']),
      urut: json['urut']?.toString() ?? '',
      audio: json['audio'] ?? '',
      nomor: json['nomor']?.toString() ?? '',
      rukuk: json['rukuk'] ?? '',
      keterangan: json['keterangan'] ?? '',
    );
  }

  static SuratType? _parseType(String? type) {
    if (type == null) return null;
    switch (type.toLowerCase()) {
      case "madaniyah":
      case "madinah": // kalau API pakai ini
      case "madaniyyah": // kalau ada double y
        return SuratType.madaniyah;
      case "makkiyah":
      case "mekah": // kalau API pakai ini
        return SuratType.makkiyah;
      default:
        return null;
    }
  }

}

enum SuratType { madaniyah, makkiyah }
extension SuratTypeExtension on SuratType {
  String get displayName {
    switch (this) {
      case SuratType.madaniyah:
        return "Madaniyah";
      case SuratType.makkiyah:
        return "Makkiyah";
    }
  }
}
