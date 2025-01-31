import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

class CreditInfo extends StatelessWidget {
  const CreditInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit Score Factors"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Idd_icons.back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 26,
            ),
            Row(
              children: [
                SizedBox(width: 27),
                Container(
                  color: Color(0xff2dca73),
                  height: 2,
                  width: 18,
                ),
                SizedBox(
                  width: 19,
                ),
                Text(
                  "You have too few credit accounts",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Color(0xff2dca73)),
                )
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64.0, right: 24),
              child: Text(
                "The VantageScore credit score model relies on information your credit files at the three national credit reporting companies (Equifax, Experian and TransUnion) to generate your score. Your credit file does not have enough credit behaviour information about your loans. A mix of different types of open and active credit accounts canhave apositive impact on your credit score.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 64.0, right: 24),
              child: Text(
                "Tip: Maintaining open and active accounts important to maintaining a good credit score. if you remain behind with any payments, bring them current as soon as possible, and then make future payments on time. Over time, this will have a positive impact on your score.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 1,
              width: 315,
              color: Color(0xffc9ccd1),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Icon(Idd_icons.plus),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 24),
                  child: Text(
                    "Few or no installment accts with\ndelinquent or deragatory payment\nstatus",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
            Container(
              height: 1,
              width: 315,
              color: Color(0xffc9ccd1),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Icon(Idd_icons.plus),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 24),
                  child: Text(
                    "You have one or more discharged\nbanckruptcies",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
            Container(
              height: 1,
              width: 315,
              color: Color(0xffc9ccd1),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Icon(Idd_icons.plus),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 24),
                  child: Text(
                    "Balances on bankcard or revolving\naccts not too high compared to\nlimit",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24,),
             Container(
              height: 1,
              width: 315,
              color: Color(0xffc9ccd1),
            ),
          ],
        ),
      ),
    );
  }
}


