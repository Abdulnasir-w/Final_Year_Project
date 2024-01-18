import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orphankor/Models/ShopKeeper/Row%20Data/holdin_row_data_modle.dart';

class WidowsDataFetcher {
  Future<List<WidowData>> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost/get-windows'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<WidowData> dataList = [];
      for (var entry in jsonResponse) {
        dataList.add(WidowData(
          id: entry['id'].toString(),
          widowsName: entry['widows_name'],
          widowsContact: entry['widows_contact'],
          widowsCnic: entry['widows_cnic'],
          shopkeeperCnic: entry['shopkeeper_cnic'],
          rashanItem: entry['rashan_item'],
          quantity: entry['quantity'].toString(),
          status: entry['status'],
        ));
      }
      return dataList;
    } else {
      print('Error: ${response.statusCode}');
      return [];
    }
  }
}
