import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aeroplane/screens/payment_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: PassengerDetailsForm(),
  ));
}

class PassengerDetailsForm extends StatefulWidget {
  @override
  _PassengerDetailsFormState createState() => _PassengerDetailsFormState();
}

class _PassengerDetailsFormState extends State<PassengerDetailsForm> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController age = TextEditingController();
  String _name = '';
  String _phone = '';
  String _passengerType = 'Adult';
  String _gender = 'Male';
  int _age = 0;

  DatabaseReference? databaseReference;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.reference().child('passenger_data');
  }

  Future<void> insertDataIntoFirebase() async {
  try {
    // Check if databaseReference is not null before calling child
    databaseReference?.child('passenger_data')?.push()?.set({
      'name': _name,
      'phone': _phone,
      'passengerType': _passengerType,
      'gender': _gender,
      'age': _age,
      'timestamp': DateTime.now().toUtc().toString(),
    });

    // Data insertion successful
    print('Data inserted into Firebase');
  } catch (error) {
    // Handle errors
    print('Error inserting data into Firebase: $error');
  }
}

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Passenger Details',
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: phoneno,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                SizedBox(height: 15),
                Text('Passenger Type:'),
                Row(
                  children: [
                    Radio(
                      value: 'Adult',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Adult'),
                    Radio(
                      value: 'Child',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Child'),
                    Radio(
                      value: 'Infant',
                      groupValue: _passengerType,
                      onChanged: (value) {
                        setState(() {
                          _passengerType = value.toString();
                        });
                      },
                    ),
                    Text('Infant'),
                  ],
                ),
                SizedBox(height: 15),
                Text('Gender:'),
                Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text('Male'),
                    Radio(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value.toString();
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: age,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _age = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      print('Name: $_name');
                      print('Phone: $_phone');
                      print('Passenger Type: $_passengerType');
                      print('Gender: $_gender');
                      print('Age: $_age');

                      // Insert data into Firebase
                      insertDataIntoFirebase();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      );
                    }
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
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
