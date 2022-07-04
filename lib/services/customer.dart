import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_android/models/customer.dart';

class CustomerService {
  Future<List<Customer>?> getCustomers() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/customers');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return customerFromJson(json);
    }
  }

  static Future<http.Response> createCustomer(Customer customer) async {
    var client = http.Client();
    var response = await client.post(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'kode': customer.kode,
        'nama': customer.nama,
        'telp': customer.telp,
      }),
    );

    return response;
  }

  static Future<http.Response> deleteCustomer(String id) async {
    var client = http.Client();
    var response = await client.delete(
      Uri.parse(
          'https://1dc6-2001-448a-3040-7ea3-d42a-c123-b1dd-5ca9.ap.ngrok.io/api/customers/' +
              id),
    );

    return response;
  }
}
