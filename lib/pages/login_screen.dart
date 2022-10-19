import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = TextEditingController();
  late bool useQR;
  late bool loggedIn;
  late String name;

  @override
  void initState() {
    super.initState();
    useQR = true;
  }

  void returnData() async {
    Map<String, dynamic> returnInfo = {
      "useQR": useQR,
      "loggedIn": loggedIn,
      'name': name,
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
                hintText: 'Login system here',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // TODO: If logged in properly, save profile and send login entry to firebase
                  if (users.containsValue(loginController.text)) {
                    useQR = false;
                    loggedIn = true;
                    name = loginController.text;
                    returnData();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text that the user has entered by using the
                          // TextEditingController.
                          content: Text('Not a user'),
                        );
                      },
                    );
                  }
                },
                child: Text('Login')),
            ElevatedButton(
              onPressed: () {
                useQR = true;
                loggedIn = false;
                name = 'Not Added';
                returnData();
              },
              child: Text('Login Without Internet'),
              // TODO: Make the app then display the 6 teams that can be scouted
            ),
          ],
        ),
      ),
    );
  }
}
