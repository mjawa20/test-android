import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_android/models/salesDets.dart';

class SalesDetsService {
  Future<List<SalesDets>?> getSalesDets() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/sales');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return salesDetsFromJson(json);
    }
  }

  static Future<http.Response> createSalesDets(SalesDets salesDets) async {
    var client = http.Client();
    var response = await client.post(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/sales'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "sales_id": salesDets.salesId,
        "barang_id": salesDets.barangId,
        "harga_bandrol": salesDets.hargaBandrol,
        "qty": salesDets.qty,
        "diskon_pct": salesDets.diskonPct,
        "diskon_nilai": salesDets.diskonNilai,
        "harga_diskon": salesDets.hargaDiskon,
        "total": salesDets.total,
      }),
    );

    return response;
  }

  static Future<http.Response> deleteSalesDets(String id) async {
    var client = http.Client();
    var response = await client.delete(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/sales/' +
              id),
    );

    return response;
  }
}
