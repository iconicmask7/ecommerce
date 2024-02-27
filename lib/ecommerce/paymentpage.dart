import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final int totalAmount;
  final double gstRate;

  PaymentPage({Key? key, required this.totalAmount, required this.gstRate}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = '';
  String selectedOnlineApp = '';
  String cardNumber = '';
  String expiryDate = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Payment Method:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPaymentMethod = 'Online Apps';
                    selectedOnlineApp = '';
                  });
                },
                child: Text('Online Apps'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedPaymentMethod = 'Credit/Debit Card';
                  });
                },
                child: Text('Credit/Debit Card'),
              ),
              SizedBox(height: 20),
              if (selectedPaymentMethod == 'Online Apps')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Online App:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedOnlineApp = 'Google Pay';
                        });
                      },
                      child: Text('Google Pay'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedOnlineApp = 'Phone Pay';
                        });
                      },
                      child: Text('Phone Pay'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedOnlineApp = 'Paytm';
                        });
                      },
                      child: Text('Paytm'),
                    ),
                  ],
                ),
              if (selectedPaymentMethod == 'Credit/Debit Card')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                      ),
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                      ),
                      onChanged: (value) {
                        setState(() {
                          expiryDate = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                      ),
                      onChanged: (value) {
                        setState(() {
                          cvv = value;
                        });
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Text(
                'Total Amount: ₹${widget.totalAmount}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'GST Rate: ${(widget.gstRate * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'GST Amount: ₹${(widget.totalAmount * widget.gstRate).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
