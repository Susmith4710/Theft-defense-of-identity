// Page used for Adding watchlist items
import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/models/monitored_item_helper.dart';
import 'package:idd_app/models/monitored_item_type.dart';
import 'package:idd_app/ui/dashboard/watchlist_page.dart';
import 'package:idd_app/ui/watchlist/watchlist_item_form.dart';
import 'package:idd_app/utils/extensions.dart';

class WatchlistAddPage extends StatelessWidget {
  final MonitoredItemType itemType;
  final List<MonitoredItem> currentMonitoredItems;
  WatchlistAddPage({
    Key? key,
    required this.itemType,
    this.currentMonitoredItems = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MonitoredItem> currentItems = currentMonitoredItems
        .where((element) => element.itemType == itemType)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(MonitoredItemHelper.getTitle(this.itemType)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WatchListItemForm(),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'Monitored Items',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentItems[index].displayItem,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Idd_icons.close_small,
                          size: 14,
                        ))
                  ],
                );
              },
              itemCount: currentItems.length,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}

