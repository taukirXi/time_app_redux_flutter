import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:time_app/data_model/country_response.dart';
import 'package:time_app/redux/app/app_state.dart';
import 'package:time_app/redux/time/fetch_time_action.dart';

ThunkAction<AppState> fetchTime = (Store<AppState> store) async {
  List<dynamic> locations;
  var url = 'https://worldtimeapi.org/api/timezone/';
    try {
      var response = await http.get(Uri.parse(url));
      locations = jsonDecode(response.body);
    } catch (e) {
      debugPrint('caught error in fetching timezone: $e');
      return;
    }

  String time;
  String location = locations[Random().nextInt(locations.length)] as String;
  // String location = "Africa/Abidjan";


  // try {
  //   Response response = await get(
  //       Uri.parse('${url}${location}'),
  //       headers: {"Accept": "application/json"});
  //   Map data = jsonDecode(response.body);
  //
  //   String dateTime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1, 3);
  //
  //   DateTime date = DateTime.parse(dateTime);
  //   date = date.add(Duration(hours: int.parse(offset)));
  //
  //   time = DateFormat.jm().format(date);
  // } catch (e) {
  //   debugPrint('caught error location: $e');
  //   // time = "could not fetch time data";
  //   return;
  // }

  var response = await http.get(
    Uri.parse('https://worldtimeapi.org/api/timezone/Africa/Abidjan'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  print(response.body + "asfjaj");
  var data = countryFromJson(response.body);



  List<String> val = location.split("/");
  location = "${val[1]}, ${val[0]}";

  store.dispatch(FetchTimeAction(location, data.abbreviation!));
  };
