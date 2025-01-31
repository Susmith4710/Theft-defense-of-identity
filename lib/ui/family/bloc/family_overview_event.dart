part of 'family_overview_bloc.dart';

@immutable
abstract class FamilyOverviewEvent {}

class FamilyOverviewInitEvent extends FamilyOverviewEvent {}

class FamilyOverviewReloadEvent extends FamilyOverviewEvent {}
