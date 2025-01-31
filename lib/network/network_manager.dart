import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idd_app/models/alert_list.dart';
import 'package:idd_app/models/credit_score.dart';
import 'package:idd_app/models/dependent_summary.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/models/payloads/dependent_payload.dart';
import 'package:idd_app/models/plan.dart';
import 'package:idd_app/models/user_session.dart';
import 'package:idd_app/network/session_manager.dart';

class NetworkManager {
  final client = UserAgentClient(http.Client());
  final String LOGIN_PATH = "/api/client/sessions/login";
  final String BASE_PATH = "https://test.app.identitydefense.com";
  final String ALERTS_PATH = "/api/client/alerts";
  final String CREDIT_SCORE_PATH = "/api/client/credit_scores";
  final String CREDIT_REPORT_PATH = "/api/client/credit-reports";
  final String DASHBOARD_SUMMARY_PATH = "/api/client/dashboard/summary";
  final String CRED_SCORES_PATH = "/api/client/credit_scores";
  final String MONITORED_ITEMS = "/api/client/monitored_items";
  final String TOKEN_REFRESH = "/api/client/sessions/refresh";
  final String USER_PLAN = "/api/client/plans"; // Current plan of the user.
  final String DEPENDENTS_PATH = "/api/client/invitors";
  final String ADD_ADULT = "/api/client/invitors/adults";
  final String ADD_CHILD = "/api/client/invitors/children";

  late AuthenticatedClient authClient;

  void assignToken(String accessToken) {
    authClient.token = accessToken;
  }

  NetworkManager._privateConstructor();
  static final NetworkManager _instance = NetworkManager._privateConstructor();
  static NetworkManager get instance => _instance;

  UserSession? _userSession;
  UserSession? get userSession => _userSession;

  /*
  GET https://test.api.identityguard.com/api/client/versioning → Deprecated

POST https://test.api.identityguard.com/api/client/sessions/login → Login

GET https://test.api.identityguard.com/api/client/invitors → None found at the moment

GET https://test.api.identityguard.com/api/client/monitored_items → Fetches monitored items.

GET https://test.api.identityguard.com/api/client/dashboard/summary → Dashboard summary

GET https://test.api.identityguard.com/api/client/credit_reports/summary → Unauthorized

GET https://test.api.identityguard.com/api/client/credit_scores → Gets the scores

GET https://test.api.identityguard.com/api/client/scoring/risk/v2 → Fetches the scores

GET https://test.api.identityguard.com/api/client/marketing/offer → Working

GET https://test.api.identityguard.com/api/client/plans → All plans

GET https://test.api.identityguard.com/api/client/users/017d5c0f-1c08-4ef0-9e07-ce36f89de75f → User complete details

GET https://test.api.identityguard.com/api/client/questions → questions

GET https://test.api.identityguard.com/api/client/alerts → Fetches all alerts

GET https://test.api.identityguard.com/api/client/monitored_items/dependents/children → Fetches dependent children
*/

  Future<bool> doLogin(String username, String password) async {
    Uri completeUrl = Uri.parse(BASE_PATH + LOGIN_PATH);
    var jsonData = {"username": username, "password": password};

    try {
      var response = await client.post(completeUrl, body: jsonEncode(jsonData));
      print(response.body);
      var jdecode = jsonDecode(response.body);
      String token = jdecode['accessToken'];

      authClient = AuthenticatedClient(token);
      UserSession session = UserSession.fromJson(jdecode);
      _userSession = session;
      // Start the timer some where.
      SessionManager.instance.startTimer(session);
      return true;
    } catch (ex) {
      print("Error ");
      print(ex);
      return false;
    }
  }

  Future<String> getDashboardSummary() async {
    Uri summaryPath = Uri.parse(BASE_PATH + DASHBOARD_SUMMARY_PATH);
    try {
      var response = await authClient.get(summaryPath);
      print(response.body);
      return response.body;
    } catch (e) {
      print("Error ");
      print(e);
      return "";
    }
  }

  Future<List<Alert>> getAllAlerts() async {
    Uri alertsUri = Uri.parse(BASE_PATH + ALERTS_PATH);
    try {
      var response = await authClient.get(alertsUri);
      print("Received alerts");
      return AlertList.alertListFromJson(response.body).alerts;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<List<MonitoredItem>> getMonitoredItems() async {
    Uri monitoredItemsUri = Uri.parse(BASE_PATH + MONITORED_ITEMS);
    try {
      var response = await authClient.get(monitoredItemsUri);
      // print(response.body);
      print("Received Monitored Items");
      return MonitoredItem.monitoredItemsFromJson(
          response.body); //(jsonDecode(response.body));
      // return response.body;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<CreditScore> fetchLatestCreditScore() async {
    Uri creditScoreItemsUri = Uri.parse(BASE_PATH + CREDIT_SCORE_PATH);
    try {
      var response = await authClient.get(creditScoreItemsUri);
      List<CreditScore> creditScores =
          CreditScore.creditScoresFromJson(response.body);
      return creditScores.first;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<Plan> fetchUserPlan() async {
    Uri userCurrentPlanUri = Uri.parse(BASE_PATH + USER_PLAN);
    try {
      var response = await authClient.get(userCurrentPlanUri);
      return Plan.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<String> getCreditScores() async {
    Uri creditScoresUri = Uri.parse(BASE_PATH + CREDIT_SCORE_PATH);
    try {
      var response = await authClient.get(creditScoresUri);
      print(response.body);
      return response.body;
    } catch (e) {
      print(e);
      return "";
    }
    //017e6cae-d283-43f6-8d87-bced2ad82c6d
  }

  Future<List<Dependent>> fetchDependents() async {
    Uri dependentsUri = Uri.parse(BASE_PATH + DEPENDENTS_PATH);
    try {
      var response = await authClient.get(dependentsUri);
      return DependentSummary.summaryFromJson(response.body).participants;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<bool> addAdultDependent(DependentPayload payload) async {
    Uri adultDependentUri = Uri.parse(BASE_PATH + ADD_ADULT);
    try {
      var response = await authClient.post(adultDependentUri,
          body: jsonEncode(payload.adultJson()));
      print(response);
      return true;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<bool> addChildDependent(DependentPayload payload) async {
    Uri childDependentUri = Uri.parse(BASE_PATH + ADD_CHILD);
    try {
      var response = await authClient.post(childDependentUri,
          body: jsonEncode(payload.childJson()));
      print(response);
      return true;
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  Future<SessionToken> refreshToken(String refreshToken) async {
    Uri refreshUri = Uri.parse(BASE_PATH + TOKEN_REFRESH);
    var jsonData = {"refresh_token": refreshToken};
    try {
      var response = await client.post(refreshUri, body: jsonEncode(jsonData));
      var jdecode = jsonDecode(response.body);
      SessionToken token = SessionToken.fromJson(jdecode);
      return token;
    } catch (e) {
      return Future.error(e);
    }
  }

  void logout() {
    SessionManager.instance.cancelTimer();
    authClient.token = ""; // Nothing here.
  }

  // Future<UserProfile> getUserProfile() async {
  //   Uri profileUri = Uri.parse(
  //       BASE_PATH + "/api/client/users/017e6cae-d283-43f6-8d87-bced2ad82c6d");
  //   try {
  //     var response = await authClient.get(profileUri);
  //     print(response.body);
  //     return UserProfile.fromJson(jsonDecode(response.body));
  //   } catch (e) {
  //     print(e);
  //     return Future.error(e);
  //   }
  // }

  void doOperations() {
    Uri completeUrl = Uri.parse(BASE_PATH + ALERTS_PATH);
    authClient.get(completeUrl).then((value) {
      print("Got response " + ALERTS_PATH);
      print(value.body);
    }).catchError((e) {
      print("Error with alerts");
      print(e.toString());
    });

    Uri creditScores = Uri.parse(BASE_PATH + CREDIT_SCORE_PATH);
    authClient.get(creditScores).then((value) {
      print("Got response " + CREDIT_SCORE_PATH);
      print(value.body);
    }).catchError((e) {
      print("Error with alerts");
      print(e.toString());
    });
    Uri creditReport = Uri.parse(BASE_PATH + CREDIT_REPORT_PATH);
    authClient.get(creditReport).then((value) {
      print("Got response " + CREDIT_REPORT_PATH);
      print(value.body);
    }).catchError((e) {
      print("Error with alerts");
      print(e.toString());
    });

    Uri creditScore = Uri.parse(BASE_PATH + CRED_SCORES_PATH);
    authClient.get(creditScore).then((value) {
      print("Got response " + CRED_SCORES_PATH);
      print(value.body);
    }).catchError((e) {
      print("Error with alerts");
      print(e.toString());
    });
  }
}

class UserAgentClient extends http.BaseClient {
  // final String userAgent;
  final http.Client _inner;

  UserAgentClient(this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // request.headers['user-agent'] = userAgent;
    request.headers['x-idg-brand'] = 'iddefense';
    request.headers['Content-Type'] = 'application/json';
    return _inner.send(request);
  }
}

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  String token;

  AuthenticatedClient(this.token);
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // request.headers['user-agent'] = userAgent;
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = token;

    return _inner.send(request);
  }
}
