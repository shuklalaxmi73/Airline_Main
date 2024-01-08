import 'package:aeroplane/screens/booking_screen.dart';
import 'package:aeroplane/screens/ticket_view.dart';
import 'package:aeroplane/utils/app_layout.dart';
import 'package:aeroplane/utils/app_styles.dart';
import 'package:aeroplane/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/double_text_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String dropdownValue = 'Departure';
  String dropdown = 'Arrival';


  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgcolor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Gap(40),
          Text(
            "What are\n you looking for? ",
            style: Styles.headlineStyle1.copyWith(fontSize: 35),
          ),
          Gap(20),
          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),
              child: Row(
                children: [
                  Container(
                    width: size.width * .44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(child: Text("Airline Tickets")),
                  ),
                  Container(
                    width: size.width * .44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                      color: Colors.transparent,
                    ),
                    child: Center(child: Text("Hotels")),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
            ),
          ),
          const Gap(20),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Departure',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: [
              'Departure',
              'New York',
              'China',
              'Oman',
              'Nigeria',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Gap(20),
          DropdownButtonFormField<String>(
            value: dropdown,
            onChanged: (String? newValue) {
              setState(() {
                dropdown = newValue!;
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Arrival',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: [
              'Arrival',
              'Indonesia',
              'London',
              'India',
              'America',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Gap(20),
          ElevatedButton(
            onPressed: () {
              // Add the functionality you want when the button is pressed
              Navigator.push(context, MaterialPageRoute(builder: (context) => PassengerDetailsForm()));
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
              "Find Tickets",
              style: Styles.textStyle.copyWith(color: Colors.white),
            ),
          ),
          Gap(40),
          const AppDobleTextWidget(bigText: "Upcoming Flights", smallText: "View all"),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 425,
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/sit.jpeg")),
                      ),
                    ),
                    Gap(12),
                    Text(
                      "20% discount on the early booking of this flight. Don't miss.",
                      style: Styles.headlineStyle2,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: 210,
                        decoration: BoxDecoration(
                            color: Color(0xFF3A8888),
                            borderRadius: BorderRadius.circular(18)),
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discount\nfor survey",
                              style: Styles.headlineStyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Gap(10),
                            Text(
                              "Take the survey about our services and get a discount",
                              style: Styles.headlineStyle2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 18, color: Color(0xFF189999)),
                              color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  Gap(15),
                  Container(
                    width: size.width * 0.44,
                    height: 210,
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xFFEC6545)),
                    child: Column(
                      children: [
                        Text(
                          "Take turu  Love",
                          style: Styles.headlineStyle2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Gap(5),
                        RichText(
                            text: const TextSpan(children: [
                              TextSpan(
                                text: '😍',
                                style: TextStyle(fontSize: 32),
                              ),
                              TextSpan(
                                text: '😘',
                                style: TextStyle(fontSize: 50),
                              ),
                              TextSpan(
                                text: '🥰',
                                style: TextStyle(fontSize: 32),
                              ),
                            ]))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
