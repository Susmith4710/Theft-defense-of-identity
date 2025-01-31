import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:idd_app/models/activity_alert.dart';
import 'package:idd_app/models/address_monitoring_alert.dart';
import 'package:idd_app/models/alert_list.dart';
import 'package:idd_app/models/credit_score.dart';
import 'package:idd_app/models/dark_web_alert.dart';
import 'package:idd_app/models/dashboard_summary.dart';
import 'package:idd_app/models/dependent_summary.dart';
import 'package:idd_app/models/high_risk_alert.dart';
import 'package:idd_app/models/marketing_offer.dart';
import 'package:idd_app/models/monitored_item.dart';
import 'package:idd_app/models/plan.dart';
import 'package:idd_app/models/publicrecord_alert.dart';
import 'package:idd_app/models/question.dart';
import 'package:idd_app/models/risk_summary.dart';
import 'package:idd_app/models/subscription.dart';
import 'package:idd_app/models/transaction_alert.dart';
import 'package:idd_app/models/user_profile.dart';
import 'package:idd_app/models/user_session.dart';
import 'package:idd_app/models/user_verification.dart';
import 'package:idd_app/utils/extensions.dart';

void main() {
  group("Test Monitored Items", () {
    test('Monitored Item Type parsing', () async {
      final localMonitoredFile = File('assets/json/monitored_items.json');
      final json = await localMonitoredFile.readAsString();
      final monitoredItems = MonitoredItem.monitoredItemsFromJson(json);
      expect(monitoredItems, isA<List<MonitoredItem>>());
      expect(monitoredItems[0], isA<MonitoredEmailItem>());
      expect(monitoredItems[1], isA<MonitoredNameItem>());
      expect(monitoredItems[2], isA<MonitoredPhoneItem>());
      expect(monitoredItems[3], isA<MoinitoredSSNItem>());
      expect(monitoredItems[4], isA<MonitoredBirthDateItem>());
      expect(monitoredItems[6], isA<MoinitoredDrivingLicenseItem>());
      expect(monitoredItems[7], isA<MonitoredFinancialAccountItem>());
      expect(monitoredItems[8], isA<MonitoredInsuranceProviderItem>());
      expect(monitoredItems[9], isA<MonitoredPassportItem>());
      expect(monitoredItems[10], isA<MonitoredLoyaltyCardItem>());
    });
  });

  group(
    'Test User Session',
    () {
      test('User Session ', () async {
        final localSessionFile = File('assets/json/user_session.json');
        final fileData = await localSessionFile.readAsString();
        final json = jsonDecode(fileData);
        final userSession = UserSession.fromJson(json);
        expect(userSession, isA<UserSession>());
      });
      test('User Profile', () async {
        final localSessionFile = File('assets/json/user_profile.json');
        final fileData = await localSessionFile.readAsString();
        final json = jsonDecode(fileData);
        final userProfile = UserProfile.fromJson(json);
        expect(userProfile, isA<UserProfile>());
      });
    },
  );

  group('User Plan', () {
    test('User Plan Data', () async {
      final localSessionFile = File('assets/json/plan.json');
      final fileData = await localSessionFile.readAsString();
      // final json = jsonDecode(fileData);
      final planData =
          Plan.planFromJson(fileData); //UserProfile.fromJson(json);
      expect(planData, isA<Plan>());
    });
    test('Marketing Offer', () async {
      final localSessionFile = File('assets/json/marketing_offer.json');
      final fileData = await localSessionFile.readAsString();
      // final json = jsonDecode(fileData);
      final marketingOffer =
          MarketingOffer.offerFromJson(fileData); //UserProfile.fromJson(json);
      expect(marketingOffer, isA<MarketingOffer>());
    });
    test('Verification', () async {
      final localSessionFile = File('assets/json/verification.json');
      final fileData = await localSessionFile.readAsString();
      final verificationObject =
          UserVerification.verificationQuestionsFromJson(fileData);
      expect(verificationObject, isA<UserVerification>());
    });
    test('Dependent Summary', () async {
      final localSessionFile = File('assets/json/dependent_summary.json');
      final fileData = await localSessionFile.readAsString();
      final verificationObject = DependentSummary.summaryFromJson(fileData);
      expect(verificationObject, isA<DependentSummary>());
    });

    test('Dependent Summary test', () async {
      final localSessionFile = File('assets/json/test.json');
      final fileData = await localSessionFile.readAsString();
      final verificationObject = DependentSummary.summaryFromJson(fileData);
      expect(verificationObject, isA<DependentSummary>());
    });

    test('Questions', () async {
      final localSessionFile = File('assets/json/question.json');
      final fileData = await localSessionFile.readAsString();
      List<Question> question = Question.getQuestionsFromJson(fileData);
      expect(question, isA<List<Question>>());
    });
    test('Dashboard Summary', () async {
      final localSessionFile = File('assets/json/dashboard_summary.json');
      final fileData = await localSessionFile.readAsString();
      DashboardSummary verificationObject =
          DashboardSummary.fromJson(jsonDecode(fileData));
      expect(verificationObject, isA<DashboardSummary>());
    });

    test('Credit Score', () async {
      final localSessionFile = File('assets/json/credit_score.json');
      final fileData = await localSessionFile.readAsString();
      List<CreditScore> scores = CreditScore.creditScoresFromJson(fileData);
      // DashboardSummary verificationObject =  DashboardSummary.fromJson(jsonDecode(fileData));
      expect(scores, isA<List<CreditScore>>());
    });

    test('Alert details', () async {
      final localSessionFile = File('assets/json/alert_list.json');
      final fileData = await localSessionFile.readAsString();
      AlertList list = AlertList.alertListFromJson(fileData);
      expect(list, isA<AlertList>());
      expect(list.alerts[0], isA<ActivityAlert>());
      expect(list.alerts[6], isA<AddressMonitoringAlert>());
      expect(list.alerts[1], isA<HighRiskAlert>());
      expect(list.alerts[2], isA<PublicrecordAlert>());
      expect(list.alerts[3], isA<DarkWebAlert>());
      expect(list.alerts[4], isA<TransactionAlert>());
      //TODO: Missing the remaining types in JSON
    });

    test('Risk Summary', () async {
      final localSessionFile = File('assets/json/risk_summary.json');
      final fileData = await localSessionFile.readAsString();
      RiskScoreSummary riskSummary =
          RiskScoreSummary.riskSummaryFromJson(fileData);
      expect(riskSummary, isA<RiskScoreSummary>());
      expect(riskSummary.days[0], isA<RiskScore>());
    });

    test('Subscription ', () async {
      final localSessionFile = File('assets/json/subscription.json');
      final fileData = await localSessionFile.readAsString();
      Subscription userSubscription =
          Subscription.subscriptionFromJson(fileData);
      expect(userSubscription, isA<Subscription>());
    });
  });
  test('Utility test', (){
    String nonStripped = "1-999-777-4444";
    String noStripes = "19837838373";
    expect(Utils.slicePhoneNumber(nonStripped), "1-999-777-4444");
    expect(Utils.slicePhoneNumber(noStripes), "1-983-783-8373");

  });
}
