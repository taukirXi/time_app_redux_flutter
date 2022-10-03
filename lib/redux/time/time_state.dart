class TimeState {
  final String location;
  final String time;

  TimeState(this.location, this.time);

  TimeState.initialState()
      : location = "x",
        time = "00:";
}
