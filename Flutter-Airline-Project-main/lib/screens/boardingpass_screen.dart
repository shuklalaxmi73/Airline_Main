import 'package:aeroplane/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:aeroplane/utils/app_styles.dart';

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flight Ticket',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xD91130CE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TicketDetail(
              label: 'Passenger Name',
              value: 'John Doe',
            ),
            SizedBox(height:10),// Reduced gap
            TicketDetail(
              label: 'Flight',
              value: 'XYZ123',
            ),
            SizedBox(
              height: 10,
            ),
            TicketDetail(
              label: 'Seat',
              value: '22A',
            ),
            SizedBox(height: 10),
            TicketDetail(label: 'Departure', value: '10.00 AM'),
            SizedBox(height: 10),
            TicketDetail(label: 'Arrival', value: '2:00 PM'),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(
                'https://api.qrserver.com/v1/create-qr-code/?data=YourTicketData&size=200x150', // Rectangular QR code
                width: 150.0,
                height: 150.0,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar()));// Navigate back to the home page
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
                'Back to Home',
                style: Styles.textStyle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketDetail extends StatelessWidget {
  final String label;
  final String value;

  const TicketDetail({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
