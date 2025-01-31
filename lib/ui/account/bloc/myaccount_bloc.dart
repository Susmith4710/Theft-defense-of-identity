import 'package:bloc/bloc.dart';
import 'package:idd_app/models/plan.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:meta/meta.dart';

part 'myaccount_event.dart';
part 'myaccount_state.dart';

class MyAccountBloc extends Bloc<MyaccountEvent, MyaccountState> {

  Plan? userPlan;

  MyAccountBloc() : super(MyaccountInitial()) {
    on<MyaccountEvent>((event, emit) async {
       if(event is MyaccountFetchDataEvent){
        // Got to emit some state
        print('Got fetch data event');
        emit(MyaccountFetcingDataState());
        // _fetchPlan();
       this.userPlan =  await  NetworkManager.instance.fetchUserPlan();
       emit(MyaccountPlanLoadedState(userPlan: this.userPlan!));

       }
    });
  }

  void _fetchPlan() async {
    try {
      Plan userPlan = await NetworkManager.instance.fetchUserPlan();
      this.userPlan = userPlan;
    }
     catch (e){
      print(e);
     }
  }
}
