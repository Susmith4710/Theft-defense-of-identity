import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScoreGraphPainter extends CustomPainter {
  String score;
  ScoreGraphPainter({this.score = "500"});
  void paint2(Canvas canvas, Size size) {
    print(size.width);
    print(size.height);
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    // math.pi
    paint.strokeWidth = 7;
    paint.strokeCap = StrokeCap.round;
    double endAngle = degreeToRadian(90.0);
    double startAngle = degreeToRadian(180.0);
    double quarterCircle = degreeToRadian(17.0);
    Rect theRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height),
        width: size.width,
        height: size.height * 2);
    // canvas.drawArc(Rea, startAngle, sweepAngle, useCenter, paint)
    canvas.drawArc(theRect, startAngle, endAngle, false, paint);
    paint.color = Colors.orange;
    canvas.drawArc(
        theRect, startAngle + endAngle + 0.1, quarterCircle, false, paint);
    paint.color = Colors.yellow;
    canvas.drawArc(theRect, startAngle + endAngle + quarterCircle + 0.2,
        quarterCircle, false, paint);
    paint.color = Colors.green;

    canvas.drawArc(theRect, startAngle + endAngle + quarterCircle * 2 + 0.3,
        quarterCircle / 2, false, paint);

    paint.color = Color.fromRGBO(0, 0, 0, 0.08);
    canvas.drawArc(
        theRect,
        startAngle + endAngle + quarterCircle * 2 + 0.3 + (quarterCircle / 2),
        quarterCircle / 2,
        false,
        paint);

    paint.color = Color.fromRGBO(0, 0, 0, 0.08);
    canvas.drawArc(theRect, startAngle + endAngle + quarterCircle * 3 + 0.4,
        quarterCircle, false, paint);
    // canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint)
    paint.style = PaintingStyle.fill;
    double radius = size.width / 2;
    double dx = radius + radius * math.cos(degreeToRadian(45));
    double dy = size.height / 2 + radius * math.sin(degreeToRadian(45));

    canvas.drawCircle(Offset(dx, dy), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadian(double degree) {
    return degree * math.pi / 180;
  }

  double radianToDegree(double radian) {
    return radian * 180 / math.pi;
  }

  final breakPoints = [
    [0, 88],
    [92, 110],
    [115, 135],
    [138, 152],
    [158, 180]
  ];
  final minScore = 0.0;
  final maxScore = 850.0;

  Color colorForFilledSegment(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.lightGreen;
      case 4:
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Color.fromRGBO(242, 242, 242, 0.8); //Colors.red;
    paint.style = PaintingStyle.stroke;
    path.moveTo(0, 0);
    Rect ovalRect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height - 6),
        width: size.width - 3,
        height: size.height * 2 - 6);
    breakPoints.forEach((element) {
      double startAngle = element[0].toDouble();
      double delta = element[1].toDouble() - element[0].toDouble();
      path.addArc(
          ovalRect, degreeToRadian(180 + startAngle), degreeToRadian(delta));
    });

    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    canvas.drawPath(path, paint);
    // Draw the segments
    double progressDegress = (int.parse(score) / maxScore) * 180.0;
    print("Degrees " + progressDegress.toString());

    breakPoints.forEach((element) {
      int index = breakPoints.indexOf(element);

      if (progressDegress > element[1]) {
        paint.color = colorForFilledSegment(index);
        double startAngle = element[0].toDouble();
        double delta = element[1].toDouble() - element[0].toDouble();
        canvas.drawArc(ovalRect, degreeToRadian(180 + startAngle),
            degreeToRadian(delta), false, paint);
      }
      if (progressDegress > element[0] && progressDegress < element[1]) {
        paint.color = colorForFilledSegment(index);
        double startAngle = element[0].toDouble();
        double delta = progressDegress - startAngle;
        canvas.drawArc(ovalRect, degreeToRadian(180 + startAngle),
            degreeToRadian(delta), false, paint);
      }
    });
    double radius = size.width / 2;
    double dx = radius *
        (1 -
            math.cos(degreeToRadian(
                progressDegress))); // radius + radius * math.cos(degreeToRadian(progressDegress));
    double dy = radius * math.sin(degreeToRadian(progressDegress));
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(dx, size.height - dy - 3), 6, paint);
  }
}
