import 'package:bloc/bloc.dart';
import 'package:idd_app/Utils/extensions.dart';
import 'package:idd_app/models/payloads/dependent_payload.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:meta/meta.dart';

part 'family_add_event.dart';
part 'family_add_state.dart';

class FamilyAddBloc extends Bloc<FamilyAddEvent, FamilyAddState> {
  // String? relationShip;
  // DateTime? dateOfBirth;
  // String? firstName;
  // String? lastName;
  // String? emailAddress;
  bool isAdult = false;
  DependentPayload payload = DependentPayload();

  FamilyAddBloc() : super(FamilyAddInitial()) {
    on<FamilyAddEvent>((event, emit) {
      if (event is FamilyAddInitEvent) {
        this.isAdult = event.isAdult;
        emit(FamilyAddLoadedState(payload: payload));
      }
      if (event is FamilyAddRelationChosenEvent) {
        payload.relationShip = event.relationShip;
        emit(FamilyAddLoadedState(payload: payload));
      }
      if (event is FamilyAddDOBChosenEvent) {
        payload.dateOfBirth = event.dateOfBirth;
        emit(FamilyAddLoadedState(payload: payload));
      }
      if (event is FamilyAddButtonEvent) {
        payload.firstName = event.firstName;
        payload.lastName = event.lastName;
        isValid();
        if (isAdult) {
          addAdult();
        } else {
          addChild();
        }
        emit(FamilyAddLoadedState(payload: payload, errors: isValid()));
      }
      if (event is FamilyAddSSNChangedEvent) {
        payload.ssn = event.ssn;
      }
      if (event is FamilyAddEmailChangedEvent) {
        payload.emailAddress = event.email;
      }
      print(payload);
    });
  }

  Future<bool> addAdult() async {
    var isReady = await NetworkManager.instance.addAdultDependent(payload);
    return isReady;
  }

  Future<bool> addChild() async {
    var isReady = await NetworkManager.instance.addChildDependent(payload);
    return isReady;
  }

  FamilyAddErrorState isValid() {
    // Validations to be followed
    // For adult
    // First Name not empty
    // Email to be valid
    // Child
    // Age should be less than 18 years
    // SSN number should be 9 digits max

    // Check for things in the payload
    FamilyAddErrorState errorState = FamilyAddErrorState();
    if (payload.firstName!.isEmpty) {
      errorState.firstName = "First name cannot be empty";
    }
    if (payload.relationShip == null || payload.relationShip!.isEmpty) {
      errorState.relationship = "Relationship cannot be empty";
    }
    if (this.isAdult) {
      // Validate for stuff
      // Validate email
      errorState.emailAddress = Utils.isValidEmail(payload.emailAddress);
    } else {
      errorState.dob = Utils.isValidChild(payload.dateOfBirth);
      errorState.ssn = Utils.isValidSSN(payload.ssn);
    }
    return errorState;
  }
}
