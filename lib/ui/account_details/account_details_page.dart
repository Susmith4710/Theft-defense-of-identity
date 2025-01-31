import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
        leading: IconButton(icon: Icon(Idd_icons.back),onPressed: (){Navigator.of(context).pop();},),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('editaccount');
          }, icon: Icon(Idd_icons.edit))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            dense: true,
            leading: Icon(Idd_icons.user_public,color: Color(0xff000000)),
            title: Text('Your Legal Name',style: Theme.of(context).textTheme.bodyText1,),
            subtitle: Text('John Doe'),
            trailing: Icon(Idd_icons.lock,size: 16,),
          ),
           ListTile(
             dense: true,
            leading: Icon(Idd_icons.birthday,color: Color(0xff000000)),
            title: Text('Date of Birth',style: Theme.of(context).textTheme.bodyText1,),
            subtitle: Text('**/**/****'),
            trailing: Icon(Idd_icons.lock,size: 16,),
          ),
           ListTile(
             dense: true,
            leading: Icon(Idd_icons.ssn,color: Color(0xff000000)),
            title: Text('Social Security Number',style: Theme.of(context).textTheme.bodyText1,),
            subtitle: Text('*** ** 1234'),
            trailing: Icon(Idd_icons.lock,size: 16,),
          ),
          ListTile(
             dense: true,
            leading: Icon(Idd_icons.call,color: Color(0xff000000)),
            title: Text('Phone Number',style: Theme.of(context).textTheme.bodyText1,),
            subtitle: Text('898-837-8882'),
          ),
           ListTile(
             dense: true,
            leading: Icon(Idd_icons.home,color: Color(0xff000000)),
            title: Text('Address',style: Theme.of(context).textTheme.bodyText1,),
            subtitle: Text('washington dc,Olive Branch, AA - 29406'),
          ),
        ],
      ),
    );
  }
}