import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
// import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatelessWidget {
  final Uri _termsofuse =
      Uri.parse('https://identitydefense.com/legal/terms-of-use');
  final Uri _privacyPolicy = Uri.parse('https://www.pango.co/privacy-policy');
  final Uri _insurance = Uri.parse('https://app.identitydefense.com/insurance');
  ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Idd_icons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Resources',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40),
        child: ListView(
          children: [
            ListTile(
                title: Text(
                  'Service Terms of Use',
                  style: Theme.of(context).textTheme.headline6,
                ),
                trailing: IconButton(
                    color: Color(0xff2dca73),
                    icon: Icon(Idd_icons.external_link),
                    onPressed: () {
                      // launchUrl(_termsofuse);
                    })),
            ListTile(
                title: Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headline6,
                ),
                // trailing: Icon(Idd_icons.external_link),),
                trailing: IconButton(
                    color: Color(0xff2dca73),
                    icon: Icon(Idd_icons.external_link),
                    onPressed: () {
                      // launchUrl(_privacyPolicy);
                    })),
            ListTile(
                title: Text(
                  'Insurance',
                  style: Theme.of(context).textTheme.headline6,
                ),
                // trailing: Icon(Idd_icons.external_link),),
                trailing: IconButton(
                  color: Color(0xff2dca73),
                  icon: Icon(Idd_icons.external_link),
                  onPressed: () {
                    // launchUrl(_insurance);
                  },
                )),
            ListTile(
              title: Text('App Version here',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400, color: Color(0xffa6abb2))),
            )
          ],
        ),
      ),
    );
  }
}
