import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Save if logged in or not from previous login, automatically assumes not logged in
  bool loggedIn = false;
  late int matchNumber;
  final matchNumberController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    matchNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: const Color(0xff491365),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  SizedBox(width: 10,),
                  Text(
                    'Scouting app',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Image.asset('assets/logo.png'),
                ],
              ),
              SizedBox(height: 50,),
              TextField(
                controller: matchNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Match Number',
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton.icon(
                onPressed: () {
                  if (loggedIn) {
                    // TODO: Make the button not pressable when textfield is empty
                    matchNumber = int.parse(matchNumberController.text);
                    matchNumberController.clear();
                    Navigator.pushNamed((context), '/data_entry');
                  } else { // If not logged in
                    matchNumber = int.parse(matchNumberController.text);
                    matchNumberController.clear();
                    Navigator.pushNamed((context), '/login');
                  }
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                label: Text(
                  'Next',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
