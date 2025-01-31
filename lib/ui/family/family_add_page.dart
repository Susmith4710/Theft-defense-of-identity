import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/models/dependent_summary.dart';
import 'package:intl/intl.dart';

import 'bloc/family_add_bloc.dart';

class FamilyAddPage extends StatelessWidget {
  final bool isAdult;
  FamilyAddPage({Key? key, required this.isAdult}) : super(key: key);
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController relationController = TextEditingController();
  final TextEditingController ssnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String title = isAdult ? "Add Adult" : "Add Child";
    return BlocProvider<FamilyAddBloc>(
      create: (context) =>
          FamilyAddBloc()..add(FamilyAddInitEvent(isAdult: this.isAdult)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Idd_icons.back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<FamilyAddBloc, FamilyAddState>(
          builder: (context, state) {
            // FamilyAddLoadedState? loadedState = state as FamilyAddLoadedState;
            return Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 20.0),
                    child: Form(
                        child: ListView(
                      children: [
                        TextFormField(
                          controller: relationController,
                          style: Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              errorText: state.errors?.relationship,
                              hintText: "Enter Relationship",
                              isDense: true,
                              suffix: IconButton(
                                  onPressed: () {
                                    _showRelationsDialog(context);
                                  },
                                  icon: Icon(
                                    Idd_icons.down,
                                  )),
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.name,
                          controller: firstNameController,
                          decoration: InputDecoration(
                              hintText: "Enter First name",
                              errorText: state.errors?.firstName,
                              isDense: true,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          style: Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.name,
                          controller: lastNameController,
                          decoration: InputDecoration(
                              hintText: "Enter Last name",
                              isDense: true,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        isAdult ? FamilyEmailAddressField() : FamilyDOBField(),
                        SizedBox(
                          height: 24,
                        ),
                        isAdult ? Container() : FamilySSNField(),
                        TextButton(
                            onPressed: () {},
                            child: Text('Import from Contacts'))
                      ],
                    )),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 20,
                  right: 20,
                  child: Center(
                      child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: ElevatedButton(
                        onPressed: () {
                          FamilyAddBloc bloc = context.read<FamilyAddBloc>();
                          bloc.add(FamilyAddButtonEvent(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              emailAddress: ''));
                        },
                        child: Text('Add')),
                  )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showRelationsDialog(BuildContext context) {
    showModalBottomSheet<String>(
        context: context,
        builder: (context) {
          List<String> options =
              this.isAdult ? Dependent.adultOptions : Dependent.childOptions;
          List<Widget> listChildren = [
            Text(
              'Choose Relationship',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            )
          ];
          listChildren.addAll(List.generate(
              options.length,
              (index) => ListTile(
                    title: Text(
                      options[index],
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                    dense: true,
                    onTap: () {
                      Navigator.of(context).pop(options[index]);
                    },
                  )));
          return Container(
            // height: 100,
            child: ListView(
              children: listChildren,
            ),
          );
        }).then((value) {
      // print(value);
      if (value != null) {
        relationController.text = value;
        FamilyAddBloc bloc = context.read<FamilyAddBloc>();
        bloc.add(FamilyAddRelationChosenEvent(relationShip: value));
      }
    });
  }
}

class FamilyDOBField extends StatelessWidget {
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  final TextEditingController _controller = TextEditingController();
  FamilyDOBField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyAddBloc bloc = context.read<FamilyAddBloc>();
    if (bloc.payload.dateOfBirth != null) {
      _controller.text = _dateFormat.format(bloc.payload.dateOfBirth!);
    }
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.name,
      controller: _controller,
      decoration: InputDecoration(
          labelText: 'Enter Date of birth',
          hintText: "MM/dd/yyyy",
          isDense: true,
          errorText: "What?",
          suffix: IconButton(
            icon: Icon(Idd_icons.calendar),
            onPressed: () {
              showDOBPicker(context);
            },
          ),
          contentPadding: EdgeInsets.all(10)),
    );
  }

  void showDOBPicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime(1995, 4),
            firstDate: DateTime(1985),
            lastDate: DateTime.now(),
            initialEntryMode: DatePickerEntryMode.calendarOnly)
        .then((value) {
      if (value != null) {
        FamilyAddBloc bloc = context.read<FamilyAddBloc>();
        bloc.add(FamilyAddDOBChosenEvent(dateOfBirth: value));
      }
    });
  }
}

class FamilySSNField extends StatelessWidget {
  const FamilySSNField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Enter Social Security Number",
          isDense: true,
          contentPadding: EdgeInsets.all(10)),
      onChanged: (value) {
        print("Changed");
        FamilyAddBloc bloc = context.read<FamilyAddBloc>();
        bloc.add(FamilyAddSSNChangedEvent(ssn: value));
      },
    );
  }
}

class FamilyEmailAddressField extends StatelessWidget {
  const FamilyEmailAddressField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Enter Email Address",
          isDense: true,
          contentPadding: EdgeInsets.all(10)),
      onChanged: (value) {
        FamilyAddBloc bloc = context.read<FamilyAddBloc>();
        bloc.add(FamilyAddEmailChangedEvent(email: value));
      },
    );
  }
}
