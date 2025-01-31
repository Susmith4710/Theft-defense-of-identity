part of 'myaccount_bloc.dart';

@immutable
abstract class MyaccountState {}

class MyaccountInitial extends MyaccountState {}

class MyaccountPlanLoadedState extends MyaccountState {
  Plan userPlan;
  MyaccountPlanLoadedState({required this.userPlan});
}

class MyaccountFetcingDataState extends MyaccountState {}