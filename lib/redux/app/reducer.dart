import 'package:time_app/redux/app/app_state.dart';
import 'package:time_app/redux/time/time_reducer.dart';

AppState reducer(AppState state, dynamic action) {
  // if (action is FetchTimeAction) {
  //   return AppState(action.location, action.time);
  // } else {
  //   return prev;
  // }

  print('app reducer');

  return AppState(
    timeState: timeReducer(state.timeState, action),
  );
}
