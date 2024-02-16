import 'package:flutter/material.dart';
import '../../../Components/shopkeeperDrawer.dart';
import '../../../Models/ShopKeeper/Row Data/holdinDataModle.dart';
import '../../../Models/ShopKeeper/getWidowDataModel.dart';
import 'priceEnterScreen.dart';

class ShopKeeperScreen extends StatefulWidget {
  const ShopKeeperScreen({super.key});

  @override
  State<ShopKeeperScreen> createState() => _ShopKeeperScreenState();
}

class _ShopKeeperScreenState extends State<ShopKeeperScreen> {
  List<WidowData> dataList = [];
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
      setState(() {
        dataList = newDataList['dataListPending'] ?? [];
        isLoading = false;
      });
    } catch (e) {
      //print('Error fetching data: $e');
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
            : buildDataTable());
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: DataTable(
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
              DataColumn(label: Text('Action')),
            ],
            rows: dataList.map((data) {
              return DataRow(
                cells: [
                  DataCell(Text(data.id)),
                  DataCell(Text(data.widowsName)),
                  DataCell(Text(data.widowsContact)),
                  DataCell(Text(data.widowsCnic)),
                  DataCell(Text(data.shopkeeperCnic)),
                  DataCell(Text(data.rashanItem)),
                  DataCell(Text(data.status)),
                  DataCell(
                    // Action button for each row
                    ElevatedButton(
                      onPressed: () {
                        _navigateToPriceEntryScreen(context, data.otp);
                      },
                      child: const Text(
                        'Rashion',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Navigate to another screen for price entry
  void _navigateToPriceEntryScreen(BuildContext context, String otp) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PriceEntryScreen(
          otp: otp,
          onPriceAdd: () {
            onPriceAdd(otp);
          },
        ),
      ),
    );
  }

  void onPriceAdd(String otp) {
    setState(() {
      dataList.removeWhere((element) => element.otp == otp);
    });
  }
}
