import 'package:flutter/material.dart';
import 'package:idd_app/ui/enroll_screen.dart';

import '../custom-ui/score_graph.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(''),
//           backgroundColor: Colors.white,
//         ),
//         body: Center(
//           child: Card(
//             //margin: EdgeInsets.fromLTRB(15, 479, 17, 97),
//             elevation: 5,
//             child: Container(
//                 height: 150,
//                 width: 300,
//                 // color: Colors.greenAccent,
//                 child: ScoreGraph()),
//           ),
//         ));
//   }
// }

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.fromLTRB(15, 379, 17, 95),
      child: Container(
        height: 273,
        width: 343,
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                SizedBox(
                  width: 17,
                ),
                Image(image: AssetImage('assets/dangertriangle.png')),
                SizedBox(
                  width: 11.5,
                ),
                Text(
                  "Vantage Scores credit Score",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              children: [
                SizedBox(
                  width: 19,
                ),
                Text("Last updated 03/15/2022"),
              ],
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                //top: 20,
              ),
              child: SizedBox(
                width: 200,
                height: 100,
                child: ScoreGraph(),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 67,
                ),
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(144, 144, 144, 1)),
                ),
                SizedBox(
                  width: 56,
                ),
                Text(
                  'Excellent',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 56,
                ),
                Text(
                  '650',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromRGBO(144, 144, 144, 1)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 250,
                ),
                InkWell(
                  child: Text(
                    "View More",
                    style: const TextStyle(
                        fontFamily: 'Gordita',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(45, 202, 115, 1),
                        fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnrollScreen()),
                    );
                  },
                ),
              ],
            ),
            // Text("data is here"),
          ],
        ),
      ),
    );
  }
}
