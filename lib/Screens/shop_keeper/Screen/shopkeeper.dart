import 'package:flutter/material.dart';
import 'package:orphankor/Components/shopkeeper_drawer.dart';
import 'package:orphankor/Models/ShopKeeper/Row%20Data/holdin_row_data_modle.dart';
import 'package:orphankor/Models/ShopKeeper/get_widow_data_model.dart';
import 'package:orphankor/Screens/shop_keeper/Screen/Price_enter_scree.dart';

class ShopKeeperScreen extends StatefulWidget {
  const ShopKeeperScreen({Key? key}) : super(key: key);

  @override
  State<ShopKeeperScreen> createState() => _ShopKeeperScreenState();
}

class _ShopKeeperScreenState extends State<ShopKeeperScreen> {
  List<WidowData> dataList = [];
  final WidowsDataFetcher dataFetcher = WidowsDataFetcher();
  bool isLoading = true;
  String errorMessage = '';

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // void fetchData() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     List<WidowData> newDataList = await dataFetcher.fetchData();

  //     setState(() {
  //       dataList = newDataList;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //     setState(() {
  //       errorMessage = 'Error fetching data. Please try again later.';
  //       isLoading = false;
  //     });
  //   }
  // }

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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => PriceEntryScreen())));
            },
            child: Text("he"),
          ),
          buildDataTable(),
        ],
      ),
      // isLoading
      //     ? const Center(child: CircularProgressIndicator())
      //     : errorMessage.isNotEmpty
      //         ? Center(child: Text(errorMessage))
      //         : buildDataTable(),
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
              DataColumn(label: Text('Action')),
              DataColumn(label: Text('Status')),
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
                  DataCell(Text(data.quantity)),
                  DataCell(Text(data.status)),
                  DataCell(
                    // Action button for each row
                    ElevatedButton(
                      onPressed: () {
                        _navigateToPriceEntryScreen(context);
                      },
                      child: Text('Action'),
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
  void _navigateToPriceEntryScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PriceEntryScreen(),
      ),
    );
  }
}
// void _navigateToPriceEntryScreen(BuildContext context, WidowData data) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => PriceEntryScreen(data: data),
//       ),
//     );
//   }
