// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/custom-colors.dart';
import 'package:idd_app/ui/login_screen.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(1),
          icon: Image.asset('assets/leftArrow.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // IconButton(
            //   padding: EdgeInsets.all(1),
            //   icon: Image.asset('assets/leftArrow.png'),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.6,
                child: Image.asset('assets/Logo.png')),
            SizedBox(
              height: 70,
            ),
            CheckYourInboxText(),
            // forgotPasswordText(),
            // Text(
            //   "Forgot your password?",
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontSize: 32,
            //       fontStyle: FontStyle.normal),
            // ),
            // SizedBox(
            //   height: 18,
            // ),
            // Text(
            //   '''Enter your username or email\n associated with your account to\n reset your password.''',
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //       fontWeight: FontWeight.w400,
            //       fontSize: 16,
            //       fontStyle: FontStyle.normal,
            //       color: Color.fromRGBO(99, 104, 112, 1)),
            // ),
            SizedBox(
              height: 24,
            ),
            // TextFormField(
            //   keyboardType: TextInputType.emailAddress,
            //   decoration: InputDecoration(
            //     hintText: "Enter Email",
            //   ),
            // ),
            SizedBox(height: 24.5),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                // onPressed: () {
                //   setState(() {
                //     // CircularProgressIndicator(
                //     //   backgroundColor: Colors.blue.shade100,
                //     //   strokeWidth: 6.0,
                //     // );
                //   });
                // },

                onPressed: () {
                  // Navigator.pop(context);
                },
                child: Text(
                  'Resend Link',
                  style: const TextStyle(
                      fontFamily: 'Gordita',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ))
            ]),
            SizedBox(
              height: 35.5,
            ),
            TermsAndConditions()
          ],
        ),
      ),
    );
  }
}

class CheckYourInboxText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Check your Inbox",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Gordita',
              fontWeight: FontWeight.w500,
              fontSize: 32,
              fontStyle: FontStyle.normal),
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          '''If an account exists, an email will be\n sent to the email address\n associated with your account.''',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Gordita',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(99, 104, 112, 1)),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Didn't recieve an email?",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Gordita',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(99, 104, 112, 1)),
        )
      ],
    );
  }
}
