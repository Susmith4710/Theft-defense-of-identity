import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/ui/watchlist/watchlist_add_options.dart';

// import 'dashboard_page.dart';

class WatchListPage extends StatelessWidget {
  List<MonitoredItem> monitoredItems = [];
  WatchListPage({Key? key, required this.monitoredItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WatchListHeader(monitoredItems:this.monitoredItems),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Text(
                'To ensure that we are monitoring the personal information most important to you, please keep your Dark Web Watchlist updated for the best protection.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            WatchListItemsContainer(monitoredItems: this.monitoredItems)
          ],
        ),
      ),
    );
  }
}

class WatchListHeader extends StatelessWidget {
 final  List<MonitoredItem> monitoredItems ;
  const WatchListHeader({
    Key? key,
    required this.monitoredItems
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Watchlist",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        IconButton(
          icon: Icon(AuraIcons.Plus),
          onPressed: () {
            // Navigator.of(context).pushNamed('watchlistoptions');
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WatchListOptionsPage(currentMonitoredItems: this.monitoredItems)));
          },
        )
      ],
    );
  }
}

class WatchListItemsContainer extends StatelessWidget {
  List<MonitoredItem> monitoredItems = [];
  WatchListItemsContainer({Key? key, required this.monitoredItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return WatchListItemView(
            item: monitoredItems[index],
          );
        },
        itemCount: monitoredItems.length,
        shrinkWrap: true,
      ),
      // child: ListView(
      //   shrinkWrap: true,
      //   children: [
      //     WatchListItemView(),
      //     WatchListItemView(),
      //     WatchListItemView(),
      //     WatchListItemView()
      //   ],
      // ),
    );
  }
}

class WatchListItemView extends StatelessWidget {
  MonitoredItem item;
  WatchListItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(item.getIcon()),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    item.title(),
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                    // textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.displayItem,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: item.isLocked(),
          child: Icon(
            Icons.lock_outline,
            color: Color(0xff909090),
            size: 16,
          ),
        )
      ],
    );
  }
}
