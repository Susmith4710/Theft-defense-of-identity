part of 'family_add_bloc.dart';

@immutable
abstract class FamilyAddState {
  FamilyAddErrorState? errors;
}

class FamilyAddInitial extends FamilyAddState {}

class FamilyAddLoadedState extends FamilyAddState {
  DependentPayload payload;
  // May be errors to be sent.
  FamilyAddErrorState? errors;
  FamilyAddLoadedState({required this.payload, this.errors});
}

// Class to hold the errors
class FamilyAddErrorState {
  String? relationship;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? dob;
  String? ssn;
  FamilyAddErrorState(
      {this.relationship,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.dob,
      this.ssn});
}
