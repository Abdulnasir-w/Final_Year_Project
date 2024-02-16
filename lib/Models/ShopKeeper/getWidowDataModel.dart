import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Row Data/holdinDataModle.dart';

class WidowsDataFetcher {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');
    return token;
  }

  Future<Map<String, List<WidowData>>> fetchData() async {
    final token = await getToken();
    final response = await http
        .get(Uri.parse('https://idrees.blogvali.com/api/foods_list'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      List<WidowData> dataList = [];
      List<WidowData> dataListReceived = [];
      int pendingCounter = 0;
      int recievedCounter = 0;
      for (var entry in jsonResponse['message']) {
        var price = 'Null';
        var priceItem = entry['item_with_price'];
        if (priceItem != null) {
          price = priceItem['price'].toString();
        }

        if (entry['status'] == 'received') {
          recievedCounter++;

          var widowData = entry['widow'];

          dataListReceived.add(WidowData(
            id: '$recievedCounter',
            widowsName: widowData['widow_name'],
            widowsContact: widowData['widow_contact'].toString(),
            widowsCnic: widowData['widow_nic'].toString(),
            shopkeeperCnic: entry['shop']['shopkeeper_name'].toString(),
            rashanItem: entry['packages']['name'],
            quantity: entry['otp'],
            otp: entry['otp'],
            price: price,
            status: entry['status'],
          ));
        } else {
          pendingCounter++;
          var widowData = entry['widow'];

          dataList.add(WidowData(
            id: '$pendingCounter',
            widowsName: widowData['widow_name'],
            widowsContact: widowData['widow_contact'].toString(),
            widowsCnic: widowData['widow_nic'].toString(),
            shopkeeperCnic: entry['shop']['shopkeeper_name'].toString(),
            rashanItem: entry['packages']['name'],
            quantity: entry['otp'],
            otp: entry['otp'],
            price: price,
            status: entry['status'],
          ));
        }
      }
      return {
        'dataListPending': dataList,
        'dataListReceived': dataListReceived
      };
    } else {
      print('Error: ${response.statusCode}');
      return {
        'dataListPending': [],
        'dataListReceived': [],
      };
    }
  }
}
