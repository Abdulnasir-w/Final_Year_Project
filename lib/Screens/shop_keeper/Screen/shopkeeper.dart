import 'package:flutter/material.dart';
import 'package:orphankor/Components/shopkeeper_drawer.dart';
import 'package:orphankor/Models/ShopKeeper/get_widow_data_model.dart';

class ShopKeeperScreen extends StatefulWidget {
  const ShopKeeperScreen({Key? key}) : super(key: key);

  @override
  State<ShopKeeperScreen> createState() => _ShopKeeperScreenState();
}

class _ShopKeeperScreenState extends State<ShopKeeperScreen> {
  List<Map<String, String>> dataList = [];
  final WidowsDataFetcher dataFetcher = WidowsDataFetcher();
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });

      List<Map<String, String>> newDataList = await dataFetcher.fetchData();

      setState(() {
        dataList = newDataList;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        errorMessage = 'Error fetching data. Please try again later.';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Widows List"),
        ),
      ),
      drawer: const ShopKeeperDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : buildDataTable(),
    );
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DataTable(
            border: TableBorder.all(
              width: 1,
              color: Colors.black,
              style: BorderStyle.solid,
              borderRadius: BorderRadius.circular(12),
            ),
            showBottomBorder: true,
            dividerThickness: 2,
            dataRowColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 221, 238, 182)),
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xffDBB7F2)),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Windows Name')),
              DataColumn(label: Text('Windows Contact')),
              DataColumn(label: Text('Windows CNIC')),
              DataColumn(label: Text('Shopkeeper CNIC')),
              DataColumn(label: Text('Rashan Item')),
              DataColumn(label: Text('Quantity')),
              DataColumn(label: Text('Status')),
            ],
            rows: dataList.map((data) {
              return DataRow(
                cells: [
                  DataCell(Text(data['id'].toString())),
                  DataCell(Text(data['windowsName'].toString())),
                  DataCell(Text(data['windowsContact'].toString())),
                  DataCell(Text(data['windowsCnic'].toString())),
                  DataCell(Text(data['shopkeeperCnic'].toString())),
                  DataCell(Text(data['rashanItem'].toString())),
                  DataCell(Text(data['quantity'].toString())),
                  DataCell(Text(data['status'].toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
