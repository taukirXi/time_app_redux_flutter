import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:time_app/redux/app/app_state.dart';
import 'package:time_app/redux/app/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/app/app_state.dart';
import 'redux/time/middleware.dart';

void main() {
  runApp(MyApp());
}

// typedef FetchTime = void Function();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final store = Store(reducer,
      initialState:  AppState.initialState(),
      middleware: [thunkMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter redux demo',
        theme: ThemeData(
            primaryColor: Colors.amber, scaffoldBackgroundColor: Colors.white),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter redux demo'),
      ),
      body: Center(
        child: SizedBox(
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // display time and location
              StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (_, state) {
                  return Text(
                    'The time in ${state.timeState.location} is ${state.timeState.time}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  );
                },
              ),

              // fetch time button

              StoreConnector<AppState, VoidCallback>(
                converter: (store) => () => store.dispatch(fetchTime),
                builder: (_, fctb) {
                  return SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      onPressed: fctb,
                      child: const Text(
                        "Click to fetch time",
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
