import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_android/models/barang.dart';

class BarangService {
  Future<List<Barang>?> getBarangs() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/barang');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return barangFromJson(json);
    }
  }

  static Future<http.Response> createBarang(Barang barang) async {
    var client = http.Client();
    var response = await client.post(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/barang'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'kode': barang.kode,
        'nama': barang.nama,
        'harga': barang.harga.toString(),
      }),
    );

    return response;
  }

  static Future<http.Response> deleteBarang(String id) async {
    var client = http.Client();
    var response = await client.delete(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/barang/' +
              id),
    );

    return response;
  }
}
