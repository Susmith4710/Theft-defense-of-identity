// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:idd_app/Utils/extensions.dart';

class WatchListItemForm extends StatefulWidget {
  WatchListItemForm({Key? key}) : super(key: key);

  @override
  State<WatchListItemForm> createState() => _WatchListItemFormState();
}

class _WatchListItemFormState extends State<WatchListItemForm> {
  GlobalKey<FormState> _saveEmailAddress = GlobalKey<FormState>();
  FocusNode userEmailNode = FocusNode();
  final TextEditingController emailAddressTextController =
      TextEditingController();
  bool submit = true;

  @override
  void initState() {
    super.initState();
    emailAddressTextController.addListener(() {
      setState(() {
        submit = emailAddressTextController.text.isNotEmpty;
      });
    });
  }

  void dispose() {
    emailAddressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 16),
          child: Form(
            key: _saveEmailAddress,
            child: Column(children: [
              TextFormField(
                focusNode: userEmailNode,
                autocorrect: false,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return Utils.isValidEmail(value);
                },
                controller: emailAddressTextController,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Enter email Address",
                  labelText: "Enter email Address",
                  labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
                  hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                ),
                onEditingComplete: () {
                  FocusScope.of(context).nextFocus();
                },
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 40),
          child: SizedBox(
            height: 40,
            width: 315,
            child: ElevatedButton(
                onPressed: (()
                    {
                  if (_saveEmailAddress.currentState!.validate()) {
                    _saveEmailAddress.currentState!.save();

                    //uncomment this when used for back navigating on saved
                    // Navigator.popUntil(
                    //     context, ModalRoute.withName('watchListpage'));
                  }
                }),
                child: Text("Save")),
          ),
        ),
      ],
    );
  }
}
