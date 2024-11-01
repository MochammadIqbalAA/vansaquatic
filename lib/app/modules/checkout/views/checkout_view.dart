import 'package:flutter/material.dart';
import 'package:myapp/app/modules/payment/views/payment_view.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Aksi untuk tombol back
          },
        ),
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(221, 255, 255, 255),
      ),
      body: CheckoutBody(),
    );
  }
}

class CheckoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddressSection(),
          SizedBox(height: 20),
          OrderDetails(),
          SizedBox(height: 20),
          PaymentMethodSection(),
          Spacer(),
          MakeOrderButton(),
        ],
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'JL.ZZZZ NO.00 RT/RW.KEC/KABUPATEN/KOTA/KODE POS',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Half Moon Fish'),
              Text('Rp. 25.000 1x'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fish Multi Bac'),
              Text('Rp. 5.000 1x'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Joran Pancing A1'),
              Text('Rp. 95.000 1x'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Product Price:'),
              Text('Rp. 125.000'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Cost:'),
              Text('Rp. 15.000'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Service Fee:'),
              Text('Rp. 5.000'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grand Total:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp. 140.000',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethodSection extends StatefulWidget {
  @override
  _PaymentMethodSectionState createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int? selectedPaymentMethod; // Untuk menyimpan metode pembayaran yang dipilih
  String? selectedBank; // Untuk menyimpan bank yang dipilih
  String? selectedEMoney; // Untuk menyimpan e-Money yang dipilih

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text('COD (Cash On Delivery)'),
            leading: Radio<int>(
              value: 1,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          ListTile(
            title: Text('Bank Transfer'),
            leading: Radio<int>(
              value: 2,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          if (selectedPaymentMethod == 2) // Menampilkan dropdown untuk Bank Transfer
            DropdownButton<String>(
              hint: Text("Select Bank"),
              value: selectedBank,
              items: <String>['BCA', 'BRI', 'BNI', 'Mandiri']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedBank = value; // Menyimpan bank yang dipilih
                });
              },
            ),
          ListTile(
            title: Text('e-Money'),
            leading: Radio<int>(
              value: 3,
              groupValue: selectedPaymentMethod,
              onChanged: (int? value) {
                setState(() {
                  selectedPaymentMethod = value;
                  selectedBank = null; // Reset bank selection
                  selectedEMoney = null; // Reset e-Money selection
                });
              },
            ),
          ),
          if (selectedPaymentMethod == 3) // Menampilkan dropdown untuk e-Money
            DropdownButton<String>(
              hint: Text("Select e-Money"),
              value: selectedEMoney,
              items: <String>['OVO', 'Gopay', 'Dana', 'Qris']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedEMoney = value; // Menyimpan e-Money yang dipilih
                });
              },
            ),
        ],
      ),
    );
  }
}

class MakeOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //Navigasi ke halaman Payment
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentView(),
            ), // Pindah ke PaymentScreen
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          backgroundColor: Colors.lightBlue,
        ),
        child: Text(
          'Make an Order',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
