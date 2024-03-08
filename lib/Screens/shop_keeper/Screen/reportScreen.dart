import 'package:flutter/material.dart';
import '../../../Components/shopkeeperDrawer.dart';
import '../../../Models/ShopKeeper/Row Data/holdinDataModle.dart';
import '../../../Models/ShopKeeper/getWidowDataModel.dart';

class ShopKeeperReportScreen extends StatefulWidget {
  const ShopKeeperReportScreen({super.key});

  @override
  State<ShopKeeperReportScreen> createState() => _ShopKeeperReportScreenState();
}

class _ShopKeeperReportScreenState extends State<ShopKeeperReportScreen> {
  List<WidowData> dataListPending = [];
  List<WidowData> dataListReceived = [];
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

      final newDataList = await dataFetcher.fetchData();
      // print('fetched Data');
      // print(newDataList);

      setState(() {
        dataListPending = newDataList['dataListPending'] ?? [];
        dataListReceived = newDataList['dataListReceived'] ?? [];
        isLoading = false;
      });
    } catch (e) {
      // print('Error fetching data: $e');
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
        title: const Center(
          child: Text("Widows List"),
        ),
      ),
      drawer: const ShopKeeperDrawer(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : buildDataTable(),
    );
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(204, 197, 225, 236),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1),
                    ),
                    child: const Text(
                      'Pending',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              DataTable(
                border: TableBorder.all(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                  borderRadius: BorderRadius.circular(5),
                ),
                showBottomBorder: true,
                dividerThickness: 2,
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 210, 228, 235)),
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 162, 215, 236)),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Windows Name')),
                  DataColumn(label: Text('Windows Contact')),
                  DataColumn(label: Text('Windows CNIC')),
                  DataColumn(label: Text('Shopkeeper Name')),
                  DataColumn(label: Text('Rashan Package')),
                  DataColumn(label: Text('Status')),
                ],
                rows: dataListPending.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.id)),
                      DataCell(Text(data.widowsName)),
                      DataCell(Text(data.widowsContact)),
                      DataCell(Text(data.widowsCnic)),
                      DataCell(Text(data.shopkeeperCnic)),
                      DataCell(Text(data.rashanItem)),
                      DataCell(Text(data.status)),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(226, 233, 202, 235),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
                child: const Text(
                  'Received',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DataTable(
                border: TableBorder.all(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                  borderRadius: BorderRadius.circular(5),
                ),
                showBottomBorder: true,
                dividerThickness: 2,
                dataRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(186, 237, 245, 230)),
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 240, 210, 240)),
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Windows Name')),
                  DataColumn(label: Text('Windows Contact')),
                  DataColumn(label: Text('Windows CNIC')),
                  DataColumn(label: Text('Shopkeeper Name')),
                  DataColumn(label: Text('Rashan Package')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Status')),
                ],
                rows: dataListReceived.map((data) {
                  return DataRow(
                    cells: [
                      DataCell(Text(data.id)),
                      DataCell(Text(data.widowsName)),
                      DataCell(Text(data.widowsContact)),
                      DataCell(Text(data.widowsCnic)),
                      DataCell(Text(data.shopkeeperCnic)),
                      DataCell(Text(data.rashanItem)),
                      DataCell(Text(data.price)),
                      DataCell(Text(data.status)),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
