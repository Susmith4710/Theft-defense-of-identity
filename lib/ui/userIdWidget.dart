import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports

import 'package:idd_app/Utils/extensions.dart';

class UserId extends StatelessWidget {
  FocusNode userNameNode = FocusNode();
  final TextEditingController userNameTextController = TextEditingController();
  GlobalKey<FormState> _nonEndCustomerLoginFormKey = GlobalKey<FormState>();
  String emailId = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _nonEndCustomerLoginFormKey,
      child: Column(children: [
        TextFormField(
          focusNode: userNameNode,
          autocorrect: false,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          validator: (value) {
            return validateEmail(value!);
          },
          controller: userNameTextController,
          decoration: InputDecoration(
            hintText: "Enter your username",
            labelText: "Username",
            labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          onEditingComplete: () {
            // isTextEditing = false;
            FocusScope.of(context).nextFocus();
          },
          onChanged: (enteredValue) {
            // isTextEditing = true;
            setState(() {
              // if (enteredValue.length < 4 ||
              //     password.isEmpty ||
              //     password == "" ||
              //     password.length < 4) {
              //   setState(() {
              //     isEnabled = false;
              //   });
              // } else {
              //   setState(() {
              //     isEnabled = true;
              //   });
              // }
              var emailId = enteredValue;
            });
          },
        ),
      ]),
    );
  }

  void setState(Null Function() param0) {}
}
