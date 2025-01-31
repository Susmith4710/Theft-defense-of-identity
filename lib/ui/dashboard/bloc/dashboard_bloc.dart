import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:idd_app/models/alert_list.dart';
import 'package:idd_app/models/credit_score.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/models/user_session.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:idd_app/network/session_manager.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) {
      print(event.runtimeType);

      if (event is DashboardChangeTabEvent) {
        DashboardChangeTabEvent evt = event;
        if (evt.newIndex == 0) {
          // Go to Dashboard
          emit(DashboardOverviewState(
              session: this._session,
              score: this.latestScore,
              alertCount:
                  this.localAlerts.where((element) => !element.viewed).length,
              watchListCount: this.monitoredItems.length,
              creditScoreStatus: creditScoreStatus));
        }
        if (evt.newIndex == 1) {
          // Go to Watchlist
          emit(DashboardWatchListState(monitoredItems: this.monitoredItems));
        }
        if (evt.newIndex == 2) {
          //go to alerts
          emit(DashboardAlertsState(alerts: this.localAlerts));
        }
      }
      if (event is DashboardInitialEvent) {
        // loadLocalData();
        loadRemoteData();
        emit(DashboardOverviewState(
            session: this._session,
            score: this.latestScore,
            alertCount:
                this.localAlerts.where((element) => !element.viewed).length,
            watchListCount: this.monitoredItems.length));
      }
      if (event is DashboardMoveToAccountEvent) {
        // Send out event to move to account state.
        emit(DashboardMoveToAccountState());
      }
      if (event is DashboardMoveToFamilyPlanEvent) {
        emit(DashboardMoveToFamilyState());
      }
      // emit(DashboardAlertsState(alerts: []));
    });
  }

  List<Alert> localAlerts = [];
  List<MonitoredItem> monitoredItems = [];
  UserSession? _session;
  CreditScore? latestScore;
  CreditScoreStatus creditScoreStatus = CreditScoreStatus.none;

  void loadLocalData() async {
    final localSessionFile = File('assets/json/alert_list.json');
    final fileData = await rootBundle.loadString('assets/json/alert_list.json');
    this.localAlerts = AlertList.alertListFromJson(fileData).alerts;

    final localMonitoredFile = File('assets/json/monitored_items.json');
    final json =
        await rootBundle.loadString('assets/json/monitored_items.json');
    this.monitoredItems = MonitoredItem.monitoredItemsFromJson(json);
    this.monitoredItems.sort((a, b) => a.order.compareTo(b.order));
    final sessionData =
        await rootBundle.loadString('assets/json/user_session.json');
    this._session = UserSession.fromJson(jsonDecode(sessionData));
    final creditScoresData =
        await rootBundle.loadString('assets/json/credit_score.json');
    this.latestScore = CreditScore.creditScoresFromJson(creditScoresData).first;
  }

  void loadRemoteData() async {
    try {
      this.localAlerts = await NetworkManager.instance.getAllAlerts();
      this.monitoredItems = await NetworkManager.instance.getMonitoredItems();
      this.monitoredItems.sort((a, b) => a.order.compareTo(b.order));
      this._session =
          NetworkManager.instance.userSession; // Not sure about this.
      if (SessionManager.instance.hasCreditScoreEligibility()) {
        this.latestScore =
            await NetworkManager.instance.fetchLatestCreditScore();
      } else {
        this.creditScoreStatus = CreditScoreStatus.notEligible;
      }
    } catch (e) {
      print(e);
    }
  }

  // final localAlerts
}
