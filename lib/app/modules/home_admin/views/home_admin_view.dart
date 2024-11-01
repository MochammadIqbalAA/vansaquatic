import 'package:flutter/material.dart';
import 'product_screen.dart';
// import 'account_screen.dart';
// import 'order_screen.dart';

class HomeAdminView extends StatefulWidget {
  @override
  _HomeAdminViewState createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  String _selectedMenu = 'barang';

  void _onMenuSelect(String menu) {
    setState(() {
      _selectedMenu = menu;
      Navigator.pop(context); // Menutup drawer saat memilih menu
    });
  }

  @override
  Widget build(BuildContext context) {
    // Konten yang akan ditampilkan berdasarkan menu yang dipilih
    Widget content;
    switch (_selectedMenu) {
      case 'akun':
        //content = AccountScreen();
        content = ProductScreen();
        break;
      case 'pesanan':
        //content = OrderScreen();
        content = ProductScreen();
        break;
      case 'barang':
      default:
        content = ProductScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Barang'),
              onTap: () => _onMenuSelect('barang'),
            ),
            ListTile(
              title: Text('Akun'),
              onTap: () => _onMenuSelect('akun'),
            ),
            ListTile(
              title: Text('Pesanan'),
              onTap: () => _onMenuSelect('pesanan'),
            ),
          ],
        ),
      ),
      body: content,
    );
  }
}
