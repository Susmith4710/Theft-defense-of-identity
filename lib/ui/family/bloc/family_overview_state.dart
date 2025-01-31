part of 'family_overview_bloc.dart';

@immutable
abstract class FamilyOverviewState {}

class FamilyOverviewInitial extends FamilyOverviewState {}

class FamilyOverviewLoading extends FamilyOverviewState {}

class FamilyOverviewLoaded extends FamilyOverviewState {
  bool hasFamilyPlan;
  List<Dependent> dependents;
  FamilyOverviewLoaded(
      {this.dependents = const [], this.hasFamilyPlan = false});
}
