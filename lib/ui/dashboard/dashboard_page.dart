// contains the complete dashboard page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idd_app/custom-icons/aura_icons.dart';
import 'package:idd_app/custom-icons/idd-icons.dart';
import 'package:idd_app/custom-ui/score_graph.dart';
import 'package:idd_app/models/credit_score.dart';
import 'package:idd_app/models/user_session.dart';
import 'package:idd_app/ui/credits/credit_score_info.dart';
import 'package:idd_app/ui/credits/creditscore_and_tracker.dart';
import 'package:idd_app/ui/dashboard/bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  final DashboardOverviewState state;
  const DashboardPage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<DashboardBloc>();
    // bloc.
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DashboardHeader(),
            DashboardUserCard(profile: this.state.session?.profile),
            SizedBox(
              height: 24,
            ),
            DashboardAlertCard(
              alertCount: this.state.alertCount,
            ),
            SizedBox(
              height: 16,
            ),
            DashboardWatchListCard(watchListCount: this.state.watchListCount),
            SizedBox(
              height: 10,
            ),
            DashboardFamilyCard(),
            SizedBox(
              height: 10,
            ),
            DashboardScoreCard(score: this.state.score,status: this.state.creditScoreStatus),
            DashboardOverviewNavListener()
          ],
        ),
      ),
    );
  }
}

class DashboardOverviewNavListener extends StatelessWidget {
  const DashboardOverviewNavListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardMoveToAccountState) {
          Navigator.of(context).pushNamed('account');
        }
        if(state is DashboardMoveToFamilyState) {
          Navigator.of(context).pushNamed('family');
        }
      },
      child: Container(),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Dashboard",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Gordita',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Idd_icons.profile),
          onPressed: () {
            DashboardBloc bloc = context.read<DashboardBloc>();
            bloc.add(DashboardMoveToAccountEvent());
          },
        )
      ],
    );
  }
}

class DashboardAlertCard extends StatelessWidget {
  int alertCount;
  DashboardAlertCard({Key? key, this.alertCount = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DashboardBloc bloc = context.read<DashboardBloc>();
        bloc.add(DashboardChangeTabEvent(newIndex: 2));
      },
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Container(
          // color: Colors.blue,
          decoration: BoxDecoration(
              border: alertCount != 0?  Border.all(color: Color(0xffe0351b), width: 1) : null ,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.white
              //TODO: Shadow
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Idd_icons.warning),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  'Active Alerts',
                  style: Theme.of(context).textTheme.headline6,
                )),
                Container(
                  width: 20,
                  height: 20,
                  child: CircleAvatar(
                    backgroundColor: alertCount !=0 ? Colors.red: Colors.black,
                    child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          this.alertCount.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )),
                  ),
                )
                // Text('3')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardUserCard extends StatelessWidget {
  SessionProfile? profile;
  DashboardUserCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return Text("Loading");
    }
    return Column(
      children: [
        Text(
          'Welcome, ' + profile!.name.first + ' ' + profile!.name.last,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Monitoring is active...',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Color(0xff21AC5F)),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Last Logged In:',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(this.profile!.displayableFormat,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w400, color: Color(0xff15181d)))
          ],
        )
      ],
    );
  }
}

class DashboardWatchListCard extends StatelessWidget {
  int watchListCount;
  DashboardWatchListCard({Key? key, this.watchListCount = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DashboardBloc bloc = context.read<DashboardBloc>();
        bloc.add(DashboardChangeTabEvent(newIndex: 1));
      },
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Container(
          // color: Colors.white,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                offset: Offset(0, 4),
                blurRadius: 8.0,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    // Image.asset('assets/watchlist.png'),
                    Icon(Idd_icons.transaction_monitoring,size: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Watchlist',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Add',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Actively monitoring items',
                        style: Theme.of(context).textTheme.subtitle1),
                    Spacer(),
                    Container(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffe1fae9),
                        child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "$watchListCount",
                              style: TextStyle(
                                  color: Color(0xff21ac5f), fontSize: 12),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardFamilyCard extends StatelessWidget {
  const DashboardFamilyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              offset: Offset(0, 4),
              blurRadius: 8.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(AuraIcons.user_add),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Protect Loved Ones',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                        DashboardBloc bloc = context.read<DashboardBloc>();
                      bloc.add(DashboardMoveToFamilyPlanEvent());
                    },
                    child: Text(
                      'Learn more',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Add your family members',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScoreCard extends StatelessWidget {
  CreditScore? score;
  CreditScoreStatus status;
  DashboardScoreCard({Key? key, required this.score, this.status = CreditScoreStatus.none}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (score == null && status == CreditScoreStatus.none) {
      return Text("Loading");
    }
    // if(status == CreditScoreStatus.notEligible) {
    //   return Text("Not eligible");
    // }
    // score = Credi

    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(color: Color(0xffe0351b),width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              offset: Offset(0, 4),
              blurRadius: 8.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(AuraIcons.Speedometer),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'VantageScore Credit Score',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    // 'Last updated ' + score!.displayableCreatedDate,
                    'Not available with your Plan',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 204,
                  height: 102,
                  child: ScoreGraph(
                    score: this.score?.score ?? -1,
                  )),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    child: Text('View more',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.green)),
                             onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreditScoreAndTracker()),
                    );
                  },
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
