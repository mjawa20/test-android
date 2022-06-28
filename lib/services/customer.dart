import 'package:http/http.dart' as http;
import 'package:test_android/models/customer.dart';

class fetchCustomers {
  Future<List<Customer>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://test-be-jawa.herokuapp.com/api/customers');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return customerFromJson(json);
    }
  }
}
