import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/ui/dashboard/alertlist_page.dart';
import 'package:idd_app/ui/dashboard/dashboard_page.dart';
import 'package:idd_app/ui/dashboard/watchlist_page.dart';

import 'bloc/dashboard_bloc.dart';

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  final dashboardBloc = DashboardBloc();

  @override
  void initState() {
    super.initState();
    dashboardBloc.add(DashboardInitialEvent());
  }

  // final
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dashboardBloc,
      child: Scaffold(
        body: BlocBuilder(
          bloc: dashboardBloc,
          buildWhen: (previous, current) => 
             current is DashboardBaseState
          ,
          builder: (context, state) {
            if (state is DashboardAlertsState) {
              return AlertListPage(
                alerts: state.alerts,
              );
            } else if (state is DashboardWatchListState) {
              return WatchListPage(
                monitoredItems: state.monitoredItems,
              );
            } else if (state is DashboardOverviewState) {
              return DashboardPage(state: state);
            } else {
              return Center(
                child: Text('Loading'),
              );
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<DashboardBloc, DashboardState>(
          buildWhen: (previous, current) {
            return current is DashboardBaseState;
          },
          builder: (context, state) {
            if (!(state is DashboardBaseState)) {
              return Container();
            }
            DashboardBaseState dbState = state;
            return BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Idd_icons.dashboard),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Idd_icons.transaction_monitoring),
                  label: 'WatchList',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Idd_icons.alerts_mobile_normal), label: "Alerts")
              ],
              onTap: _onItemTapped,
              currentIndex: dbState.selectedTab,
            );
          },
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    dashboardBloc.add(DashboardChangeTabEvent(newIndex: index));
  }
}
