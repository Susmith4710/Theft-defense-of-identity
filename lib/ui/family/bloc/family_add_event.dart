part of 'family_add_bloc.dart';

@immutable
abstract class FamilyAddEvent {}

class FamilyAddInitEvent extends FamilyAddEvent {
  bool isAdult;
  FamilyAddInitEvent({this.isAdult = false});
}

class FamilyAddRelationChosenEvent extends FamilyAddEvent {
  String? relationShip;
  FamilyAddRelationChosenEvent({required this.relationShip});
}

class FamilyAddDOBChosenEvent extends FamilyAddEvent {
  DateTime? dateOfBirth;
  FamilyAddDOBChosenEvent({required this.dateOfBirth});
}

class FamilyAddSSNChangedEvent extends FamilyAddEvent {
  String ssn;
  FamilyAddSSNChangedEvent({required this.ssn});
}

class FamilyAddEmailChangedEvent extends FamilyAddEvent {
  String email;
  FamilyAddEmailChangedEvent({required this.email});
}

class FamilyAddButtonEvent extends FamilyAddEvent {
  String? firstName;
  String? lastName;
  String? emailAddress; // Not sure about this
  FamilyAddButtonEvent({this.firstName, this.lastName, this.emailAddress});
}
