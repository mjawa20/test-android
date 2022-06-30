import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_android/models/customer.dart';

class CustomerService {
  Future<List<Customer>?> getCustomers() async {
    var client = http.Client();
    var uri = Uri.parse('https://test-be-jawa.herokuapp.com/api/sales');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return customerFromJson(json);
    }
  }

  static Future<http.Response> createCustomer(Customer customer) async {
    var client = http.Client();
    var response = await client.post(
      Uri.parse('https://test-be-jawa.herokuapp.com/api/sales'),
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
      Uri.parse('https://test-be-jawa.herokuapp.com/api/sales/' + id),
    );

    return response;
  }
}
