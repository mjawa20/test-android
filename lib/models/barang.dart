import 'dart:convert';

List<Barang> barangFromJson(String str) =>
    List<Barang>.from(json.decode(str).map((x) => Barang.fromJson(x)));

String barangToJson(List<Barang> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Barang {
  Barang({
    required this.id,
    required this.kode,
    required this.nama,
    required this.harga,
  });

  int id;
  String kode;
  String nama;
  int harga;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "harga": harga,
      };
}
