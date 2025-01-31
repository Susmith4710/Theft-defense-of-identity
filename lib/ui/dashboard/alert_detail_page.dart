import 'package:flutter/material.dart';

class AlertDetailPage extends StatelessWidget {
  const AlertDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Why did I recieve this alert?",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Color(0xff15181d)),
          ),
          SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              "You received this alert because the listed company verified your identity. Companies often verify identities before performing certain types of higher-risk transactions.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff636870)),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: Text(
              "The type of requests and activities that generally trigger an identity verification include",
              style: Theme.of(context).textTheme.headline4,
            ),

            // Text("Electronically")
          ),
        ],
      ),
    );
  }
}
