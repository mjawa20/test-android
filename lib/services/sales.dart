import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_android/models/sales.dart';

class SalesService {
  Future<List<Sales>?> getSales() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/transaction');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return salesFromJson(json);
    }
  }

  static Future<http.Response> createSales(Sales sales) async {
    var client = http.Client();
    var response = await client.post(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/transaction'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "tgl": sales.tgl.toString(),
        "mcustomer_id": sales.mcustomerId,
        "subtotal": sales.subtotal,
        "diskon": sales.diskon,
        "ongkir": sales.ongkir,
        "total_bayar": sales.totalBayar
      }),
    );

    return response;
  }

  static Future<http.Response> deleteSales(String id) async {
    var client = http.Client();
    var response = await client.delete(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.ioapi/transaction/' +
              id),
    );

    return response;
  }
}
