import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/custom-ui/score_graph.dart';

class CreditScoreAndTracker extends StatefulWidget {
  const CreditScoreAndTracker({Key? key}) : super(key: key);

  @override
  State<CreditScoreAndTracker> createState() => _CreditScoreAndTrackerState();
}

class _CreditScoreAndTrackerState extends State<CreditScoreAndTracker> {
  /*needs to be replace the below boolean with score of the Creditscore tracker to navigate to
    credit score not availabel and unavailable pages*/
  final bool score = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Idd_icons.back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Text(
                      "Credit Score",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Color(0xff15181d)),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 11.0, left: 70),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'creditscoreinfo');
                          },
                          icon: Icon(Idd_icons.info)))
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: 327,
                height: 55,
                child: Text(
                  "Your VantageScore® Credit\n Score",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Last updated 04/12/2022",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff636870)),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(height: 110, width: 220,
               child: ScoreGraph(score:680)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 92.0),
                    child: Text("0"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180.0),
                    child: Text("850"),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              //left to be completed
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Container(
                  child: CreditScoreBar(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Container(
                  //needs to be changed based on the requirement
                  child: score
                      ? CreditScoreNotGeneratable()
                      : CreditScoreNotAvailable(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            //  CreditScoreTracker(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreditScoreBar extends StatelessWidget {
  const CreditScoreBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text("Very Poor"),
            Container(
              height: 16,
              width: 64,
              color: Color(0xfff75c64),
            ),
            Text("300-499"),
          ],
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          children: [
            Text("Poor"),
            Container(
              height: 16,
              width: 64,
              color: Color(0xffffbc58),
            ),
            Text("500-600"),
          ],
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          children: [
            Text("Fair"),
            Container(
              height: 16,
              width: 64,
              color: Color(0xfff0e772),
            ),
            Text("601-660"),
          ],
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          children: [
            Text("Good"),
            Container(
              height: 16,
              width: 64,
              color: Color(0xffbadd52),
            ),
            Text("661-780"),
          ],
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          children: [
            Text(
              "Very Good",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
            ),
            Container(
              height: 16,
              width: 64,
              color: Color(0xff21ac5f),
            ),
            Text("781-850"),
          ],
        ),
      ],
    );
  }
}

class CreditScoreNotAvailable extends StatelessWidget {
  const CreditScoreNotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35,
        ),
        Text(
          "Not available with your plan",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 00.0),
              child: Text(
                "Upgrade to stay on top of your Credit\nScore and learn what factors impact your\n",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w400, color: Color(0xff636870)),
              ),
            ),
          ],
        ),
       
        ContactInfo(),
      ],
    );
  }
}

class CreditScoreNotGeneratable extends StatelessWidget {
  const CreditScoreNotGeneratable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35),
        Text(
          "Unable to generate score",
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Text(
            "A credit score could not be generated for you. This is likely because your credit file contains too few accounts, or your credit history is too short to generate a score. Be patient. Time helps you develop your credit history and remember to build a good credit history always pay your bills on time.",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        ContactInfo()
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "You may contact your ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff636870), fontWeight: FontWeight.w400),
                  ),
                ),
                Text("Identity Defense",
                    style: Theme.of(context).textTheme.bodyText1!),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "service team for more information.",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Color(0xff636870), fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 17,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            InkWell(
                child: Icon(
              AuraIcons.Call,
              color: Color(0xff2dca73),
            )
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const EnrollScreen()),
                //   );
                // },
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
          height: 30.75,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            InkWell(
                child: Icon(
              Icons.mail_outline,
              color: Color(0xff2dca73),
            )
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const EnrollScreen()),
                //   );
                // },
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
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }

  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'customercare@defense.com',
    );
    try {
      //  await launchUrl(params);
    } catch (e) {
      print('Could not launch $params');
    }
  }

  void _call() async {
    var url = "tel:1883664078";
    // await launch(url);
  }
}

class CreditScoreTracker extends StatelessWidget {
  const CreditScoreTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Credit Score Tracker",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 25,
        ),
       // LineChartPage(),
      ],
    );
  }
}
