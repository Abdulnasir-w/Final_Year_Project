import 'dart:convert';

import 'package:http/http.dart' as http;

class WidowsDataFetcher {
  Future<List<Map<String, String>>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost/get-windows'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Map<String, String>> dataList = [];
      for (var entry in jsonResponse) {
        dataList.add({
          'Id': entry['id'].toString(),
          'Windows Name': entry['windows_name'],
          'Windows Contact': entry['windows_contact'],
          'Windows CNIC': entry['windows_cnic'],
          'Shopkeeper CNIC': entry['shopkeeper_cnic'],
          'Rashan Item': entry['rashan_item'],
          'Quantity': entry['quantity'].toString(),
          'Status': entry['status'],
        });
      }
      return dataList;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
