import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:idd_app/models/dependent_summary.dart';
import 'package:idd_app/network/network_manager.dart';
import 'package:idd_app/network/session_manager.dart';
import 'package:meta/meta.dart';

part 'family_overview_event.dart';
part 'family_overview_state.dart';

class FamilyOverviewBloc
    extends Bloc<FamilyOverviewEvent, FamilyOverviewState> {
  FamilyOverviewBloc() : super(FamilyOverviewInitial()) {
    on<FamilyOverviewEvent>((event, emit) async {
      if (event is FamilyOverviewInitEvent) {
        emit(FamilyOverviewLoading());

        FamilyOverviewLoaded state = await _fetchDependents();
        emit(state);
      }
      if (event is FamilyOverviewReloadEvent) {
        emit(FamilyOverviewLoading());
        FamilyOverviewLoaded state = await _fetchDependents();
        emit(state);
      }
    });
  }

  // Get the dependents from Network manager
  Future<FamilyOverviewLoaded> _fetchDependents() async {
    if (!SessionManager.instance.isFamilyPlan()) {
      return FamilyOverviewLoaded();
    } else {
      List<Dependent> dependents =
          await NetworkManager.instance.fetchDependents();
      return FamilyOverviewLoaded(hasFamilyPlan: true, dependents: dependents);
      // Get the details and then submit
    }
  }
}
