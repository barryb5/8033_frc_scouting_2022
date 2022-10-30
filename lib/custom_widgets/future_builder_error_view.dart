import 'package:flutter/material.dart';

class FutureBuilderErrorView extends StatelessWidget {
  const FutureBuilderErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong with fetching the data',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
              child: ElevatedButton(
            onPressed: () {
              Navigator.pop((context));
            },
            child: Text(
              'Return to Home Screen',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
