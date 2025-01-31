import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/dependent_summary.dart';

import 'bloc/family_overview_bloc.dart';

class FamilyOverviewPage extends StatelessWidget {
  const FamilyOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FamilyOverviewBloc>(
      create: (context) => FamilyOverviewBloc()..add(FamilyOverviewInitEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Protect Loved Ones'),
          leading: IconButton(
            icon: Icon(Idd_icons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('familyaddoption');
                },
                icon: Icon(Idd_icons.plus))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 40, top: 20, bottom: 20),
              child: Text(
                'You can invite additional adults to enroll under your plan. Any adult who enrolls will receive the features and benefits associated with Identity Defense at no additional cost.\r\n\r\nAs a parent or guardian, you can also add an unlimited number of children (under the age of 18) to your Watchlist.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),

            BlocBuilder<FamilyOverviewBloc,FamilyOverviewState>(builder: (context,state){
              if(state is FamilyOverviewLoading){
                return Text('Loading');
              }
              else if(state is FamilyOverviewLoaded){
                if(state.hasFamilyPlan){
                  return FamilyMembersList(dependents: state.dependents,);
                }
                else {
                  return FamilyUpgradeView();
                }
              }
              return Text('Loading'); // Default

            }),
           
            // FamilyUpgradeView()
          ],
        ),
      ),
    );
  }
}

class FamilyUpgradeView extends StatelessWidget {
  const FamilyUpgradeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'Upgrade to protect your loved ones by going to your web dashboard.',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'You may contact your Identity Defense service team for more information.',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ListTile(
            // tileColor: Colors.green,
            leading: Icon(
              Idd_icons.call,
              color: Colors.green,
            ),
            title: Text(
              '1-888-366-4078',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.green),
            ),
          ),
          ListTile(
            leading: Icon(
              Idd_icons.mail,
              color: Colors.green,
            ),
            title: Text('customercare@identitydefense.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.green)),
          )
        ],
      ),
    );
  }
}

class FamilyMembersList extends StatelessWidget {

  List<Dependent> dependents;
   FamilyMembersList({
    Key? key,
    required this.dependents
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(dependents.isEmpty){
      return Text('No dependents registered');
    }
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context,index){
      if(index == 0){
        return   Text(
          "Members Under Your Plan",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        );
      }
      else {
        // Do it based on the item
        Dependent item = dependents[index-1];
       return   ListTile(
          dense: true,
          title: Text(
             item.name.first +' '+item.name.last,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text(item.relationForDisplay()),
          leading: Icon(
            item.isChild() ? Idd_icons.child : Idd_icons.user_add,
            color: Color(0xff000000),
          ),
          trailing: Icon(
            Idd_icons.close_small,
            size: 16,
            color: Color(0xff000000),
          ),
        );
      }

    },itemCount:dependents.length+1);

    // return ListView(
    //   shrinkWrap: true,
    //   children: [
    //     Text(
    //       "Members Under Your Plan",
    //       textAlign: TextAlign.center,
    //       style: Theme.of(context).textTheme.headline5,
    //     ),
    //     ListTile(
    //       dense: true,
    //       title: Text(
    //         'Jane Dough',
    //         style: Theme.of(context).textTheme.bodyText1,
    //       ),
    //       subtitle: Text('Daughter'),
    //       leading: Icon(
    //         Idd_icons.child,
    //         color: Color(0xff000000),
    //       ),
    //       trailing: Icon(
    //         Idd_icons.close_small,
    //         size: 16,
    //         color: Color(0xff000000),
    //       ),
    //     ),
    //     ListTile(
    //       dense: true,
    //       title: Text(
    //         'James Dough',
    //         style: Theme.of(context).textTheme.bodyText1,
    //       ),
    //       subtitle: Text('Father'),
    //       leading: Icon(
    //         Idd_icons.user_add,
    //         color: Color(0xff000000),
    //       ),
    //       trailing: Icon(
    //         Idd_icons.close_small,
    //         size: 16,
    //         color: Color(0xff000000),
    //       ),
    //     )
    //   ],
    // );
  }
}
