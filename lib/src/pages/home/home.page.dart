import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:tracking_my_run/src/pages/home/top.widget.dart';
import 'package:tracking_my_run/src/provider/bloc/vehicle.bloc.dart';
import 'category.widget.dart';
import 'verticalmovie.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

VehicleBloc _vehicleBloc = BlocProvider.getBloc<VehicleBloc>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(),
      body: ListView(
        children: <Widget>[
          //TopWidget(),
          //CategoryWidget(),
          VerticalMovieWidge(
              title: 'Vehicles', listMovieFlux: _vehicleBloc.listVehiclesMyListFlux),
          // VerticalMovieWidge(
          //     title: 'Popular', listMovieFlux: _vehicleBloc.listVehiclesPopularFlux)
        ],
      ),
    );
  }

  getAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Image(
            alignment: Alignment.center,
            height: 50,
            image: AssetImage('assets/images/netflex.png'),
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10.0),
          onPressed: () => {},
          icon: new Icon(
            Icons.sort,
            color: Colors.black,
            size: 25.0,
          ),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => {},
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      );
}
