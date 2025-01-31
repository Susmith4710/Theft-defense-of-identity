import 'package:flutter/material.dart';

typedef CustomSegmentCallback = void Function(int index);

class CustomSegmentControl extends StatefulWidget {
  CustomSegmentControl({Key? key, this.onItemSelected}) : super(key: key);
  CustomSegmentCallback? onItemSelected = (int index) {};

  @override
  _CustomSegmentControlState createState() => _CustomSegmentControlState();
}

// TODO: Mark these as dynamic items.
class _CustomSegmentControlState extends State<CustomSegmentControl> {
  List<CustomSegmentModel> model = [
    CustomSegmentModel(title: 'Active', isSelected: true),
    CustomSegmentModel(title: 'Archived', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSegmentControlItem(
            onSelect: () {
              onItemSelect(0);
            },
            model: this.model[0],
          ),
          SizedBox(
            width: 20,
          ),
          CustomSegmentControlItem(
            onSelect: () {
              onItemSelect(1);
            },
            model: this.model[1],
          ),
          // ListTile()
        ],
      ),
    );
  }

  void onItemSelect(int index) {
    if (widget.onItemSelected != null) {
      widget.onItemSelected!(index); // Not sure if this will work if not given
    }

    setState(() {
      this.model.asMap().forEach((key, value) {
        if (key != index) {
          value.isSelected = false;
        }
      });
    });
  }
}

class CustomSegmentModel {
  String title;
  bool isSelected;
  CustomSegmentModel({required this.title, required this.isSelected});
}

class CustomSegmentControlItem extends StatefulWidget {
  CustomSegmentModel model;
  Function? onSelect = () {};

  CustomSegmentControlItem({Key? key, this.onSelect, required this.model})
      : super(key: key);

  @override
  State<CustomSegmentControlItem> createState() =>
      _CustomSegmentControlItemState();
}

class _CustomSegmentControlItemState extends State<CustomSegmentControlItem> {
  @override
  Widget build(BuildContext context) {
    TextStyle? titleTheme = Theme.of(context).textTheme.headline6;
    if (widget.model.isSelected) {
      titleTheme =
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.green);
    }
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.model.isSelected = true;
            widget.onSelect!();
          });
        },
        child: Column(
          children: [
            Text(
              widget.model.title,
              style: titleTheme,
            ),
            SizedBox(height: 4),
            widget.model.isSelected
                ? Container(
                    color: Colors.green,
                    height: 2,
                  )
                : Container(
                    height: 2,
                  )
          ],
        ),
      ),
    );
  }
}
