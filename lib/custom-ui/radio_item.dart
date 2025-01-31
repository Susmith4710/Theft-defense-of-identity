import 'package:flutter/material.dart';

import '../models/radio_model.dart';

/// class to display single radio item
class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.0, left: 12.0, bottom: 6.0),
      child: Row(
        children: <Widget>[
          _item.isSelected
              ? Icon(
                  Icons.radio_button_on,

                  // AuraIcons.Check_circle,
                  color: Colors.green,
                  size: 22,
                )
              : Icon(
                  Icons.circle_outlined,
                  //color: Colors.blue,
                  size: 22,
                ), // need to get circle icon, this is temporary icon.
          SizedBox(
            width: 15,
          ),
          Container(
            child: new Text(
              _item.text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
