import 'package:flutter/material.dart';
import 'package:frc_scouting/pages/qr_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = TextEditingController();
  late bool loggedIn;
  late String name;
  late int teamScouted;
  late Barcode barcode;

  @override
  void initState() {
    super.initState();
  }

  void returnData() async {
    print(barcode.code);
    Map<String, dynamic> returnInfo = {
      'loggedIn': loggedIn,
      'name': name,
      'barcode': barcode,
    };
    Navigator.pop((context), returnInfo);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    loginController.dispose();
    super.dispose();
  }

  // Temporary
  Map users = {String: 'Steve', String: 'Bob', String: 'Joe'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: (MediaQuery.of(context).size.height)/5,),
            TextField(
              controller: loginController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name Here',
              ),
            ),
            ValueListenableBuilder(valueListenable: loginController, builder: (context, value, child) {
              return ElevatedButton.icon(
                onPressed: value.text.isNotEmpty ? () async {
                  // Open QR Scanner if not empty
                  name = value.text;
                  barcode = await Navigator.pushNamed((context), '/qr_scanner') as Barcode;
                  returnData();
                } : () {
                  // If text box is empty
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Enter Your Name First'),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                label: Text(
                  'Scan QR Token',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 30,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
