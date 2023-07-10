import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu12/minggu12_provider.dart';

class Minggu12 extends StatefulWidget {
  @override
  State<Minggu12> createState() => _Minggu12State();
}

class _Minggu12State extends State<Minggu12> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minggu 12'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue.shade50,
      body: Consumer<Minggu12Provider>(
        builder: (context, dataProvider, _) {
          final filteredDataList = dataProvider.dataList
              .where((data) => data.text
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Search Company',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: (filteredDataList.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    final startIndex = index * 2;
                    final endIndex = startIndex + 2;
                    final rowData = filteredDataList.sublist(
                      startIndex,
                      endIndex > filteredDataList.length
                          ? filteredDataList.length
                          : endIndex,
                    );

                    return Row(
                      children: rowData
                          .map(
                            (data) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 4,
                                  child: ListTile(
                                    leading: Image.network(
                                      data.imageUrl,
                                      width: 50,
                                      height: 50,
                                    ),
                                    title: Text(
                                      data.text,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.subtext,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(data.subtext2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors
                                                      .deepOrange.shade900)),
                                        ),
                                      ],
                                    ),
                                    onLongPress: () {
                                      print(
                                          'Ini adalah perusahaan ${data.text}');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
