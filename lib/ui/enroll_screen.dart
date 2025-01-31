import 'package:flutter/material.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';

class EnrollScreen extends StatefulWidget {
  const EnrollScreen({Key? key}) : super(key: key);

  @override
  State<EnrollScreen> createState() => _EnrollScreenState();
}

class _EnrollScreenState extends State<EnrollScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stepper(
          currentStep: currentStep,
          type: StepperType.vertical,
          steps: [
            Step(
                title: Text('Email and Password'),
                content: EmailForm(),
                state: StepState.indexed),
            Step(
                title: Text('Name '),
                content: NameForm(),
                isActive: true,
                state: StepState.editing),
            Step(title: Text('Address'), content: AddressForm()),
            Step(title: Text('Identity'), content: IdentityForm())
          ],
          onStepCancel: () {
            setState(() {
              currentStep--;
            });
          },
          onStepTapped: (value) {
            setState(() {
              currentStep = value;
            });
          },
          onStepContinue: () {
            setState(() {
              currentStep++;
            });
          },
        ),
      ),
    );
  }
}

class EmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autofillHints: ["@yahoo.com", "@gmail.com", "@hotmail.com"],
              decoration:
                  InputDecoration(hintText: 'Email address', isDense: true),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Password',
                  suffixIcon: Icon(AuraIcons.Eye_opened)),
            )
          ],
        ),
      ),
    );
  }
}

class NameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Whats your name ?',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "Please enter your full legal name—the one you use on your tax return or driver's license. We need this to verify your identity"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autofillHints: ["@yahoo.com", "@gmail.com", "@hotmail.com"],
              decoration:
                  InputDecoration(hintText: 'First Name', isDense: true),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Last Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Middle Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Suffix',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Whats your home address ?',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "Please enter your primary address. Avoid using abbreviations. We need this information to provide your service"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              autocorrect: false,
              decoration:
                  InputDecoration(hintText: 'Street name', isDense: true),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Apartment, suite etc.',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'City',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                isDense: true,
                hintText: 'State',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Zipcode',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IdentityForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              'Help us verify your identity',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                "Please enter your full legal name—the one you use on your tax return or driver's license. We need this to verify your identity"),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              autocorrect: false,
              decoration:
                  InputDecoration(hintText: 'Phone number', isDense: true),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 13,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Social security number',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Date of Birth',
                  suffixIcon: Icon(Icons.calendar_today_outlined)),
            )
          ],
        ),
      ),
    );
  }
}
