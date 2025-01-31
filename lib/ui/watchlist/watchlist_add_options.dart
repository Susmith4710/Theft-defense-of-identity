import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/models/monitored_item_helper.dart';
import 'package:idd_app/models/monitored_item_type.dart';
import 'package:idd_app/ui/watchlist/watchlist_add_page.dart';

class WatchListOptionsPage extends StatelessWidget {

  final List<MonitoredItem> currentMonitoredItems;
  WatchListOptionsPage({Key? key, this.currentMonitoredItems = const []}):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<MonitoredItemType> allTypes = [
      MonitoredItemType.EMAIL,
      MonitoredItemType.CREDIT_CARD,
      MonitoredItemType.INSURANCE_CARD,
      MonitoredItemType.FINANCIAL_ACCOUNT,
      MonitoredItemType.DRIVER_LICENSE,
      MonitoredItemType.PASSPORT,
      MonitoredItemType.LOYALTY_CARD,
      MonitoredItemType.PHONE,
      MonitoredItemType.ADDRESS,
      MonitoredItemType.NPI,
      MonitoredItemType.SSN,
    ];

    print(allTypes);

     return Scaffold(
       appBar: AppBar(title:Text('Add to Watchlist'),),
       body: ListView.builder(itemBuilder: (context,index){
         if(index == 0){
           return Text('What do you want us to monitor?',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline6,);
         }
         else {
           MonitoredItemType type = allTypes[index-1];
           return ListTile(
             enabled: true,
             dense: true,
            //  tileColor: Colors.green,
             leading: MonitoredItemHelper.getIcon(type),
             title: Text(MonitoredItemHelper.getTitle(type),style:Theme.of(context).textTheme.headline4 ,),
             subtitle: Text(currentItemsOfType(type).toString() +" / "+ MonitoredItemHelper.getMaxCount(type).toString()),
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WatchlistAddPage(itemType: type,currentMonitoredItems: this.currentMonitoredItems)));
             },
           );
         }
       },
       itemCount: allTypes.length+1,)
     );
  }

  int currentItemsOfType(MonitoredItemType type){
    return this.currentMonitoredItems.where((element) => element.itemType == type).length;
  }

}