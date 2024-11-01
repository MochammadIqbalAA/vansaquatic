import 'package:flutter/material.dart';
import '../../checkout/views/checkout_view.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> cartItems = [
    CartItem(
        name: 'Half Moon Fish',
        price: 25000,
        imageUrl: 'lib/app/assets/half-moon.jpg',
        quantity: 0),
    CartItem(
        name: 'Fish Multi Bac',
        price: 5000,
        imageUrl: 'lib/app/assets/joran-pancing.jpg',
        quantity: 0),
    CartItem(
        name: 'Joran Pancing A1',
        price: 95000,
        imageUrl: 'lib/app/assets/joran-pancing.jpg',
        quantity: 0),
  ];

  void _clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity >= 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice =
        cartItems.fold(0, (total, item) => total + item.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: [
          TextButton(
            onPressed: _clearCart,
            child: Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 100, // Set width of the image
                    height: 100, // Set height of the image
                    child: Image.asset(
                      cartItems[index].imageUrl,
                      fit: BoxFit
                          .cover, // Adjust the fit to maintain aspect ratio
                    ),
                  ),
                  title: Text(cartItems[index].name),
                  subtitle: Text('Rp. ${cartItems[index].price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => _decreaseQuantity(index),
                      ),
                      Text(cartItems[index].quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _increaseQuantity(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: Rp. $totalPrice', style: TextStyle(fontSize: 18)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20), // Mengurangi padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18), // Mengurangi ukuran font
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  String name;
  int price;
  String imageUrl;
  int quantity;

  CartItem(
      {required this.name,
      required this.price,
      required this.imageUrl,
      this.quantity = 0});
}
