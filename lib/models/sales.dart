// To parse this JSON data, do
//
//     final sales = salesFromJson(jsonString);

import 'dart:convert';

List<Sales> salesFromJson(String str) =>
    List<Sales>.from(json.decode(str).map((x) => Sales.fromJson(x)));

String salesToJson(List<Sales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sales {
  Sales(
      {required this.id,
      required this.kode,
      required this.tgl,
      required this.mcustomerId,
      required this.subtotal,
      required this.diskon,
      required this.ongkir,
      required this.totalBayar});

  int id;
  String kode;
  DateTime tgl;
  int mcustomerId;
  int subtotal;
  int diskon;
  int ongkir;
  int totalBayar;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        id: json["id"],
        kode: json["kode"],
        tgl: DateTime.parse(json["tgl"]),
        mcustomerId: json["mcustomer_id"],
        subtotal: json["subtotal"],
        diskon: json["diskon"],
        ongkir: json["ongkir"],
        totalBayar: json["total_bayar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "tgl":
            "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
        "mcustomer_id": mcustomerId,
        "subtotal": subtotal,
        "diskon": diskon,
        "ongkir": ongkir,
        "total_bayar": totalBayar,
      };
}
