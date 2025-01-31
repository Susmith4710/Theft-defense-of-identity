import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/utils/phone_input_formatter.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account Details'),
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
                Text('Phone number',textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline6,),
                SizedBox(height: 16,),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.phone,
                  maxLength: 12,

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PhoneInputFormatter()
                  ],
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10)
                    ),
                  
                ),
                Text('Address ',textAlign: TextAlign.left, style: Theme.of(context).textTheme.headline6,),
                SizedBox(height: 16,),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10)
                    ),
                ),
                SizedBox(height: 24,),
                 TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10)
                    ),
                ),
                  SizedBox(height: 24,),
                 TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'ZipCode'
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
                
              ],
            )),
          )
        ],
      ),
    );
  }
}