import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

class EmailInfo extends StatelessWidget {
  const EmailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Why monitor this?"),
          leading: IconButton(
            icon: Icon(Idd_icons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:40.0,right: 40.0,top: 16),
        child: Text("Your email address is the most public piece of your digital identity besides your name. If your email address and a password are found together on the dark web, your login credentials may have been compromised. A hacker could use this information to gain access to your email account and any other accounts that use the same login credentials.",
        style: Theme.of(context).textTheme.subtitle1,),
      ),
    );
  }
}
