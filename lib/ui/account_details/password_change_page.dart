import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';

class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Edit Username & Password'),
        leading: IconButton(icon: Icon(Idd_icons.back),onPressed: (){ Navigator.of(context).pop();},),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:24.0,right: 24.0),
            child: Text('Please contact our Customer Care team at 1-888-217-0379 to edit your name.',style: Theme.of(context).textTheme.subtitle1,),
          ),
           Padding(
            padding: const EdgeInsets.only(left:40.0,right: 40.0,top: 12.0),
            child: Form(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Password',textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline6,),
                SizedBox(height: 16,),
                TextFormField(
                  obscureText: true,
                  
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Icon(Idd_icons.eye_closed),
                      
                    ),
                ),
                SizedBox(height: 16,),
                Text('New Password',textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline6,),
                SizedBox(height: 16,),
                TextFormField(
                  obscureText: true,
                  
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Icon(Idd_icons.eye_closed),
                      hintText: 'Enter new password'
                    ),
                ),
                SizedBox(height: 16,),
                TextFormField(
                  obscureText: true,
                  
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      suffixIcon: Icon(Idd_icons.eye_closed),
                      hintText: 'Confirm new password'
                    ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      
                      onPressed: (){}, child: Text('Save Changes')))
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('Cancel')))
                  ],
                )
                ]
                )
                ))
          ],),
      );
  }
}