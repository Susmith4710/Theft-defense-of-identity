import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/custom-ui/custom_segment.dart';
import 'package:idd_app/models/alert_list.dart';
import 'package:idd_app/models/radio_model.dart';

import '../alert_filter_modal.dart';

class AlertListPage extends StatelessWidget {
  List<Alert> alerts = [];
  AlertListPage({Key? key, required this.alerts}) : super(key: key);
  // final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          AlertListHeader(),
          CustomSegmentControl(
            onItemSelected: (index) {
              print("Selected " + index.toString());
            },
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return AlertListItemView(alert: this.alerts[index]);
            },
            itemCount: this.alerts.length,
            shrinkWrap: true,
          )
        ],
      ),
    ));
  }
}

class AlertListItemView extends StatelessWidget {
  Alert alert;
  AlertListItemView({Key? key, required this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: alert.viewed ? Color(0xffF9F9FA) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left:24.0,right: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              alert.getIcon(),
              color: alert.resolved ? Color(0xff909090) : Colors.black,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 18),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alert.group,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      alert.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Color(0xff15181d)),
                    ),
                    Text(alert.formattedCreatedDate(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Color(0xff15181d)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AlertListHeader extends StatelessWidget {
  Function? onRadioSelected = (RadioModel item) {};

  AlertListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Alerts",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        IconButton(
          icon: Icon(AuraIcons.Filters),

          ///////
          onPressed: () {
            showModalBottomSheet<void>(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              isScrollControlled: true,
              // backgroundColor: Colors.amber,
              context: context,
              builder: (BuildContext context) {
                return Wrap(children: [
                  AlertFilterModal(
                      onRadioSelected, RadioModel.alertFilterItems())
                ]);
              },
            );
          },
        )
      ],
    );
  }
}
