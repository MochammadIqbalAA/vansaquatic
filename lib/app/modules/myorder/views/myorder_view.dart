import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderView extends StatefulWidget {
  @override
  _MyOrderViewState createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    'Belum Dibayar',
    'Dikirim',
    'Selesai',
    'Penilaian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home'); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == index
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                      if (_selectedIndex == index)
                        Container(
                          width: 50,
                          height: 3,
                          color: Colors.black,
                        )
                    ],
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[300], // Warna background konten
              child: Center(
                child: Text(
                  'Konten Tab ${_tabs[_selectedIndex]}',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
