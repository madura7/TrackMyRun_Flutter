import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:tracking_my_run/src/pages/home/home.page.dart';
import 'infra/Mock.dart';
//import 'pages/home/homepage.dart';
import 'provider/bloc/vehicle.bloc.dart';
import 'provider/service/vehicle.service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*here generate info*/
    //Mock.GenerateMock();

    return BlocProvider(
      blocs: [
        Bloc((i) => VehicleBloc(VehicleService())),
      ],
      child: MaterialApp(
          title: "Netflix UI Redesign With Firebase , Bloc, RxDart ",
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
              fontFamily: "Raleway",
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(body1: TextStyle(fontSize: 16)))),
    );
  }
}
