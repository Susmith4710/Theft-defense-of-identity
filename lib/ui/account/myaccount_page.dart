import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/ui/account/bloc/myaccount_bloc.dart';

class MyAccountPage extends StatelessWidget {
  MyAccountPage({Key? key}) : super(key: key);
  final MyAccountBloc bloc = MyAccountBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAccountBloc>(
      create: (context) => bloc..add(MyaccountFetchDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Account'),
          leading: IconButton(
            icon: Icon(Idd_icons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              dense: true,
              leading: Icon(
                Idd_icons.profile,
                color: Color(0xff000000),
              ),
              title: Text('Account Details',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Icon(Idd_icons.chevron_small, color: Color(0xff000000)),
              onTap: () {
                Navigator.of(context).pushNamed('accountdetails');
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Idd_icons.key, color: Color(0xff000000)),
              title: Text('Username & Password',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Icon(Idd_icons.chevron_small, color: Color(0xff000000)),
              onTap: () {
                Navigator.of(context).pushNamed('passwordchange');
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Idd_icons.user_add, color: Color(0xff000000)),
              title: Text('Protect Loved Ones',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Icon(Idd_icons.chevron_small, color: Color(0xff000000)),
              onTap: () {
                Navigator.of(context).pushNamed('family');
              },
            ),
            UserPlanWidget(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Idd_icons.home, color: Color(0xff000000)),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text('Last Logged In',
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Spacer(),
                  Text('Mar,8 2022'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 30),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Idd_icons.alerts_mobile_normal,
                  color: Color(0xff000000)),
              title: Text('Push Notifications',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Switch(
                value: true,
                onChanged: (isChanged) {},
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Idd_icons.fingerprint, color: Color(0xff000000)),
              title: Text('Biometric Authentication',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Switch(
                value: true,
                onChanged: (isChanged) {},
              ),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 30),
              child: Text(
                'Support',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(Idd_icons.document, color: Color(0xff000000)),
              title: Text('Resources',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Icon(Idd_icons.chevron_small, color: Color(0xff000000)),
              onTap: () {
                Navigator.of(context).pushNamed('resources');

              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Idd_icons.info, color: Color(0xff000000)),
              title: Text('Contact Us',
                  style: Theme.of(context).textTheme.headline6),
              trailing: Icon(Idd_icons.chevron_small, color: Color(0xff000000)),
              onTap: () {
               Navigator.of(context).pushNamed('contactus');
                        },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [TextButton(onPressed: () {}, child: Text('Sign out'))],
            )
          ],
        ),
      ),
    );
  }
}

class UserPlanWidget extends StatelessWidget {
  const UserPlanWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAccountBloc, MyaccountState>(
      builder: (context, state) {
        print(state);
        // Get the text based on the state.
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Idd_icons.plan, color: Color(0xff000000)),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text('Your Plan',
                    style: Theme.of(context).textTheme.headline6),
              ),
              Spacer(),
              Text(textForState(state)),
              Icon(Idd_icons.chevron_small, color: Color(0xff000000))
            ],
          ),
        );
      },
    );
  }

  String textForState(MyaccountState state){
    if(state is MyaccountFetcingDataState){
      return "Loading..";
    } 
    else if(state is MyaccountPlanLoadedState){
      return state.userPlan.description;
    }
    else if(state is MyaccountInitial){
      return "";
    }
    return "";
  }  
}
