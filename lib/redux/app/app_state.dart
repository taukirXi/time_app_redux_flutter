import 'package:flutter/cupertino.dart';
import 'package:time_app/redux/time/time_state.dart';

@immutable
class AppState {
  // final String _location;
  // final String _time;
  //
  // String get location => _location;
  // String get time => _time;
  //
  // const AppState(this._location, this._time);
  //
  // const AppState.initialState()
  //     : _location = "x",
  //       _time = "00:00";

  final TimeState timeState;

  AppState({required this.timeState});

  AppState.initialState() : timeState = TimeState.initialState();
}
