import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../cart_page/views/cart_page_view.dart';

class DetailItemView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  DetailItemView({
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title, style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigasi ke halaman Cart
              Get.to(() => CartPage());
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Nama produk
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Harga produk
            Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 16),
            // Deskripsi produk (contoh)
            Text(
              'Deskripsi produk di sini...',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Saat ini, tombol tidak melakukan apa-apa
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue, // Mengatur warna latar belakang tombol
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Checkout',
            style: TextStyle(fontSize: 16, color: Colors.white), // Mengatur warna teks
          ),
        ),
      ),
    );
  }
}
