import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../custom-icons/idd-icons.dart';

class ContactScreenPage extends StatelessWidget {
  const ContactScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        leading: IconButton(
          icon: Icon(Idd_icons.back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Contact Us'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 26,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 43.0, right: 20),
                child: Text(
                  "Have a question? Our Customer Care\nteam is available to answer questions\nabout your account and guide you\nthrough the necessary actions to take if\nyou become a victim of identity theft. ",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w400, color: Color(0xff636870)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 39,
              ),
              InkWell(
                  child: Icon(
                AuraIcons.Call,
                color: Color(0xff2dca73),
              )
          
                  ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Text(
                  "1-888-366-4078",
                  style: const TextStyle(
                      fontFamily: 'Gordita',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff2dca73),
                      fontSize: 16),
                ),
                onTap: _call,
               
              ),
            ],
          ),
          SizedBox(
            height: 41,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 43.0,right: 30),
            child: Text(
              "To protect your privacy, we cannot answer questions about confidential personal information via email or postal service.",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400, color: Color(0xff636870)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 45,
              ),
              InkWell(
                  child: Icon(
                Icons.mail_outline,
                color: Color(0xff2dca73),
              )
                  
                  ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                child: Text(
                  ("customercare@identitydefense.com"),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Color(0xff2dca73)),
                ),
                onTap: _launchURL,
              ),
            ],
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            children: [
              SizedBox(
                width: 45,
              ),
              InkWell(
                  child: Icon(
                Icons.mail_outline,
              )
                
                  ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 44,
                  width: 263,
                  child: Text(
                    "PO Box 222546, Chantilly, VA\n20153-2546",
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          )
        ],
      ),
    );
  }



  void _launchURL() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'customercare@defense.com',
  );
  // try {
  //   await launchUrl(params);
  // } catch (e) {
  //   print('Could not launch $params');
  // }
}

void _call() async {
  var url = "tel:1883664078";
  // await launch(url); 
}
}
