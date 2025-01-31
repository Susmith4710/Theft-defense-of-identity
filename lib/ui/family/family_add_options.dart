import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

class FamilyAddOptionsPage extends StatelessWidget {
  const FamilyAddOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Family Member'),
        leading: IconButton(
          icon: Icon(Idd_icons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Who do you want to protect?",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed("familyaddchild");
            },
            dense: true,
            title: Text(
              'Child',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text('0'),
            leading: Icon(
              Idd_icons.child,
              color: Color(0xff000000),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed("familyadd");
            },
            dense: true,
            title: Text(
              'Adult',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text('0'),
            leading: Icon(
              Idd_icons.user_add,
              color: Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }
}
