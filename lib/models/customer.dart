import 'dart:convert';

List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  Customer({
    required this.id,
    required this.kode,
    required this.nama,
    required this.telp,
  });

  int id;
  String kode;
  String nama;
  String telp;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        telp: json["telp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "telp": telp,
      };
}
