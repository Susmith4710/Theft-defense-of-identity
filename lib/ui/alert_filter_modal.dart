import 'package:flutter/material.dart';
import 'package:idd_app/models/radio_model.dart';

import '../custom-ui/radio_item.dart';

class AlertFilterModal extends StatefulWidget {
  List<RadioModel> data = [];
  AlertFilterModal(this.onRadioSelected, this.data);
  Function? onRadioSelected = (RadioModel item) {};
  @override
  State<AlertFilterModal> createState() => _AlertFilterModalState();
}

class _AlertFilterModalState extends State<AlertFilterModal> {
  get index => 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 339.0, top: 20),
            // child: Icon(Icons.close),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        Padding(
          padding: const EdgeInsets.only(left: 153, right: 169),
          child: Text("Filter",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(
                    0xff000000,
                  ))),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Only show these types of alerts",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Color(0xff101010)),
        ),
        Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.data[index].isSelected =
                            !widget.data[index].isSelected;
                        Function.apply(
                            widget.onRadioSelected!, [widget.data[index]]);
                      });
                    },
                    child: RadioItem(widget.data[index]),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: SizedBox(
                height: 40,
                width: 285,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    "Apply",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xffffffff)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 123.0, right: 124),
              child: InkWell(
                child: Text("Clear",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xff2dca73))),
                onTap: () {
                  setState(() {
                    widget.data.forEach((element) {
                      element.isSelected = false;
                    });
                  });
                },
              ),
            ),
            SizedBox(
              height: 48.5,
            )
          ],
        ),
      ],
    );
  }
}
