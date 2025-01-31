part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardBaseState extends DashboardState {
  int selectedTab = -1;
}

class DashboardAlertsState extends DashboardBaseState {
  final List<Alert> alerts;
  DashboardAlertsState({required this.alerts}) {
    this.selectedTab = 2;
  }
}

class DashboardWatchListState extends DashboardBaseState {
  final List<MonitoredItem> monitoredItems;
  DashboardWatchListState({required this.monitoredItems}) {
    this.selectedTab = 1;
  }
}

class DashboardOverviewState extends DashboardBaseState {
  final UserSession? session;
  final CreditScore? score;
  final int alertCount;
  final int familyCount;
  final int watchListCount;
  final CreditScoreStatus creditScoreStatus;

  DashboardOverviewState({required this.session, required this.score, this.alertCount = 0, this.familyCount = 0,this.watchListCount = 0, this.creditScoreStatus = CreditScoreStatus.none}) {
    this.selectedTab = 0;
  }
}

class DashboardNavigationState extends DashboardState{}

class DashboardMoveToAccountState extends DashboardNavigationState{
  // DashboardMoveToAccountState() : super();
  
  
}

class DashboardMoveToFamilyState extends DashboardNavigationState {}
