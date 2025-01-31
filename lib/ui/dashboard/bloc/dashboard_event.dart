part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {}

class DashboardChangeTabEvent extends DashboardEvent {
  final int newIndex;
  DashboardChangeTabEvent({required this.newIndex});
}

class DashboardMoveToAccountEvent extends DashboardEvent {}

class DashboardMoveToFamilyPlanEvent extends DashboardEvent{}