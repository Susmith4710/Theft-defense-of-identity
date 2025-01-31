import 'dart:math';

import 'package:flutter/material.dart';
import 'package:idd_app/custom-ui/score_graph_painter.dart';
import 'package:idd_app/models/credit_score.dart';

import '../models/activity_alert.dart';

class ScoreGraph extends StatelessWidget {
  int score;
   ScoreGraph({Key? key, this.score = 795}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String labelText = CreditScore.getRatingString(score);
    return CustomPaint(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

 Text(
            max(score,0).toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
          Text( labelText,style: Theme.of(context).textTheme.headline6,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('0'),
          //     Text('850')
          //   ],
          // )
          ],)),
      painter: ScoreGraphPainter(score: this.score.toString()),
      //child: Container(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget alertMessage(List<ActivityAlert> alerts) {
    return Container(
      color: Colors.black12,
      child: alertMessage(alerts.sublist(1)),
    );
  }
}
