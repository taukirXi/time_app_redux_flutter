import 'package:time_app/redux/time/fetch_time_action.dart';
import 'package:time_app/redux/time/time_state.dart';

TimeState timeReducer(TimeState state, dynamic action) {
  if (action is FetchTimeAction) {
    return TimeState(action.location, action.time);
  }

  return state;
}
