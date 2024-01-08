import 'package:aeroplane/screens/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:aeroplane/utils/app_layout.dart';
import 'package:aeroplane/utils/app_styles.dart';





class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
           style: TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    backgroundColor: Color(0xD91130CE),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Amount:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '\$500.00', // Replace with your actual amount
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CreditCardWidget(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentSuccessScreen()));
              },
              style: ElevatedButton.styleFrom(
              primary: Color(0xD91130CE),
              padding: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
              child: Text(
                'Pay Now',
              style: Styles.textStyle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardWidgetState();
  }
}

class CreditCardWidgetState extends State<CreditCardWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CreditCardForm(
      formKey: _formKey,
      cardNumber: '',
      expiryDate: '',
      cardHolderName: '',
      cvvCode: '',
      onCreditCardModelChange: (CreditCardModel creditCardModel) {
        // Handle credit card details change
      },
    );
  }
}

