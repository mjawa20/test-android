import 'dart:convert';

List<SalesDets> salesDetsFromJson(String str) =>
    List<SalesDets>.from(json.decode(str).map((x) => SalesDets.fromJson(x)));

String salesDetsToJson(List<SalesDets> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesDets {
  SalesDets({
    required this.id,
    required this.salesId,
    required this.barangId,
    required this.hargaBandrol,
    required this.qty,
    required this.diskonPct,
    required this.diskonNilai,
    required this.hargaDiskon,
    required this.total,
  });

  int id;
  int salesId;
  int barangId;
  int hargaBandrol;
  int qty;
  int diskonPct;
  int diskonNilai;
  int hargaDiskon;
  int total;

  factory SalesDets.fromJson(Map<String, dynamic> json) => SalesDets(
        id: json["id"],
        salesId: json["sales_id"],
        barangId: json["barang_id"],
        hargaBandrol: json["harga_bandrol"],
        qty: json["qty"],
        diskonPct: json["diskon_pct"],
        diskonNilai: json["diskon_nilai"],
        hargaDiskon: json["harga_diskon"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sales_id": salesId,
        "barang_id": barangId,
        "harga_bandrol": hargaBandrol,
        "qty": qty,
        "diskon_pct": diskonPct,
        "diskon_nilai": diskonNilai,
        "harga_diskon": hargaDiskon,
        "total": total,
      };
}
