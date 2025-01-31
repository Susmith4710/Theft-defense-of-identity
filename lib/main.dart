import 'package:flutter/material.dart';
import 'package:idd_app/ui/account/myaccount_page.dart';
import 'package:idd_app/ui/account_details/account_details_page.dart';
import 'package:idd_app/ui/account_details/contact_us_screen.dart';
import 'package:idd_app/ui/account_details/edit_account_page.dart';
import 'package:idd_app/ui/account_details/password_change_page.dart';
import 'package:idd_app/ui/account_details/resources_page.dart';
import 'package:idd_app/ui/credits/credit_score_info.dart';
import 'package:idd_app/ui/dashboard/dashboard_container.dart';
import 'package:idd_app/ui/dashboard/watchlist_page.dart';
import 'package:idd_app/ui/enroll_screen.dart';
import 'package:idd_app/ui/family/family_add_options.dart';
import 'package:idd_app/ui/family/family_add_page.dart';
import 'package:idd_app/ui/family/family_overview_page.dart';
import 'package:idd_app/ui/inbox_notification.dart';
import 'package:idd_app/ui/login_screen.dart';
import 'package:idd_app/ui/watchlist/email_info.dart';
import 'package:idd_app/ui/watchlist/watchlist_add_options.dart';
import 'package:idd_app/ui/watchlist/watchlist_add_page.dart';

import 'custom-colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Gordita',
          inputDecorationTheme: InputDecorationTheme(
              focusColor: Colors.brown,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffDFE1E5), width: 1.0),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff2DCA73), width: 2.0),
                  borderRadius: BorderRadius.circular(13)),
              fillColor: Colors.green),
          textTheme: TextTheme(
              headline2: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  height: 1.3,
                  color: Color(0xff312c2c)),
              headline5: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, height: 1.4),
              headline6: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16, height: 1.5),
              subtitle2: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 12, height: 1.5),
              subtitle1: TextStyle(
                  fontSize: 14, height: 1.5, color: Color(0xff636870)),
              headline4: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xff15181d),
                  fontWeight: FontWeight.w500),
              bodyText2: TextStyle(
                  fontSize: 12, height: 1.5, color: Color(0xff636870)),
              bodyText1: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff15181d))),
          // textTheme: TextTheme(),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: idgColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).colorScheme.onPrimary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            
          )),
          // scaffoldBackgroundColor:Color(0xffe5e5e5)
          appBarTheme: AppBarTheme(backgroundColor: Colors.white,elevation: 0)),

////////////////////////////////////////////
      home: LoginScreen(),
   
      routes: {
        "home": (BuildContext context) => LoginScreen(),
        "enroll": (BuildContext context) => EnrollScreen(),
        "inbox": (BuildContext context) => InboxPage(),
        "account": (BuildContext context) => MyAccountPage(),
        "accountdetails": (BuildContext context) => AccountDetailsPage(),
        "editaccount": (BuildContext context) => EditAccountPage(),
        "passwordchange": (BuildContext context) => PasswordChangePage(),
        "family": (BuildContext context) => FamilyOverviewPage(),
        "familyaddoption": (BuildContext context) => FamilyAddOptionsPage(),
        "familyadd": (BuildContext context) => FamilyAddPage(isAdult: true),
        "familyaddchild": (BuildContext context) => FamilyAddPage(isAdult: false),
        "dashboard":(BuildContext context) => DashboardContainer(),
        "resources":(BuildContext context) =>  ResourcesScreen(),
        "contactus":(BuildContext context) =>  ContactScreenPage(),
        "creditscoreinfo": (BuildContext context) => CreditInfo(),
        "watchlistoptions":(BuildContext context) => WatchListOptionsPage(),
        "watchListpage":(BuildContext context) => WatchListPage(monitoredItems: [])
      },
    );
  }
}
