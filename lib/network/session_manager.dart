import 'dart:async';

import 'package:idd_app/models/user_session.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SessionManager {
  final Duration refreshDuration =
      Duration(seconds: 60); // Change this for changing the duration
  SessionManager._privateConstructor();
  static final SessionManager _instance = SessionManager._privateConstructor();
  static SessionManager get instance => _instance;
  // Have reference to an internal timer
  Timer? _internalTimer;
  String refreshToken = "";
  Map<String,dynamic> entitlements = {};

  void startTimer(UserSession userSession) {
    if (_internalTimer != null) {
      if (_internalTimer!.isActive) {
        _internalTimer?.cancel();
      }
    }
    // profile.
    refreshToken = userSession.refreshToken;
    _internalTimer = Timer.periodic(refreshDuration, _refreshToken);
    _parseEntitlements(userSession.accessToken);
  }

  void cancelTimer() {
    _internalTimer?.cancel();
    refreshToken = "";
  }

  void _refreshToken(Timer timer) {
    print("Refreshing user Token");
    NetworkManager.instance.refreshToken(refreshToken).then((newSession) {
      NetworkManager.instance.assignToken(newSession.accessToken);
      refreshToken = newSession.refreshToken;
      _parseEntitlements(newSession.accessToken);
    });
  }

  void _parseEntitlements(String token){
    // Get the access token and start parsing the entitlements
     Map<String, dynamic> decoded = JwtDecoder.decode(token);
     print(decoded["aurasvc:entitlements"]);
     Map<String,dynamic> entitlements = decoded["aurasvc:entitlements"];
     this.entitlements = entitlements;

  }

  bool isFamilyPlan() {
    return this.entitlements.containsKey(Entitlements.can_invite) && this.entitlements[Entitlements.can_invite] == true;
  }

  bool isXidVerified() {
    if(this.entitlements.containsKey(Entitlements.verified)){
      return this.entitlements[Entitlements.verified].contains("xid");
    }
    return false;
  }
  bool hasXid(){
    if(this.entitlements.containsKey(Entitlements.verification)){
      return this.entitlements[Entitlements.verification].contains("xid");
    }
    return false;
  }

  bool hasWatchlist(){
    return this.entitlements.containsKey(Entitlements.darkweb); 
  }

  bool hasCreditScoreEligibility(){
    if(this.entitlements.containsKey(Entitlements.credit_score)){
      return this.entitlements[Entitlements.credit_score] != [];
    }
    return false;
  }
  
  bool shouldShowCreditQuestions() {
    return false;
  }

  // Also has to contain methods that allow to check for entitlements.
}
/// Class to enumerate all the
/// entitlements for the project
class Entitlements {
  /// Entitlement for `itps:dark_web`
  static const darkweb = "itps:dark_web";
  /// Entitlement for `itps:is_eid_verified`
  static const eid_verified = "itps:is_eid_verified";
  static const credit_score = "itps:credit_score";
  static const verification = "itps:verification";
  static const wallet_protection = "itps:wallet_protection";
  static const can_invite = "itps:can_invite";
  static const is_family = "itps:is_family";
  static const verified = "itps:verified";
}
//{itps:authentication_alerts: [lnaa, expaa], itps:can_invite: true, itps:dark_web: [fouriq], itps:is_family: true, itps:security_freeze: [security_freeze], itps:xpn_bundle: [xpn_bundle], itps:identity_theft_insurance_1mil: [insurance], itps:verification: [eid], itps:wallet_protection: [wallet_protection], itps:max_secondary: 10, itps:user_groups: [primary, v2_monitored_items]}