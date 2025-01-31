import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:flutter/material.dart';
import 'package:idd_app/custom-colors.dart';
import 'package:idd_app/ui/inbox_notification.dart';
import 'package:idd_app/ui/login_screen.dart';

// ignore: camel_case_types
class forgotPasswordScreen extends StatefulWidget {
  const forgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<forgotPasswordScreen> createState() => _forgotPasswordScreenState();
}

// ignore: camel_case_types
class _forgotPasswordScreenState extends State<forgotPasswordScreen> {
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
            FractionallySizedBox(
                alignment: Alignment.center,
                widthFactor: 0.6,
                child: Image.asset('assets/Logo.png')),
            SizedBox(
              height: 70,
            ),

            ForgotPasswordText(),
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
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter Email",
              ),
            ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InboxPage()));
                  //  Navigator.push(context, 'ActivationLink')
                },
                child: Text(
                  'Reset Password',
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

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Forgot your password?",
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
          '''Enter your username or email\n associated with your account to\n reset your password.''',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Gordita',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(99, 104, 112, 1)),
        ),
      ],
    );
  }
}
