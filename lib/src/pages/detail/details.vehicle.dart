import 'package:flutter/material.dart';
import 'package:tracking_my_run/src/entity/entity.dart';
import 'package:tracking_my_run/src/infra/CircularClipper.dart';
import 'package:video_player/video_player.dart';

import 'verticalvehicle.widget.dart';

class DetailsVehiclePage extends StatefulWidget {
  final VehicleEntity vehicle;

  DetailsVehiclePage({this.vehicle});

  @override
  _DetailsVehiclePageState createState() => _DetailsVehiclePageState();
}

class _DetailsVehiclePageState extends State<DetailsVehiclePage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.vehicle.VehicleVideo)
      ..initialize().then((_) {});
  }

  @override
  void dispose() {
    _controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _controller.value.isPlaying
                ? Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.pause();
                            _controller = VideoPlayerController.network(
                                widget.vehicle.VehicleVideo)
                              ..initialize().then((_) {});
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      )
                    ],
                  )
                : ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            transform:
                                Matrix4.translationValues(0.0, -50.0, 0.0),
                            child: Hero(
                              tag: widget.vehicle.FuelType,
                              child: ShadowClip(
                                clipper: CircularClipper(),
                                shadow: Shadow(blurRadius: 20.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/placeholder.png',
                                  height: 400.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: widget.vehicle.VehicleImage.Url,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                padding: EdgeInsets.only(left: 30.0),
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.arrow_back),
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                              Image(
                                image: AssetImage('assets/images/netflex.png'),
                                height: 60.0,
                                width: 150.0,
                              ),
                              IconButton(
                                padding: EdgeInsets.only(left: 30.0),
                                onPressed: () => {},
                                icon: Icon(Icons.favorite_border),
                                iconSize: 30.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Positioned.fill(
                            bottom: 10.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RawMaterialButton(
                                padding: EdgeInsets.all(10.0),
                                elevation: 12.0,
                                onPressed: () {
                                  setState(() {
                                    _controller.play();
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 60.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 20.0,
                            child: IconButton(
                              onPressed: () => print('Add to My List'),
                              icon: Icon(Icons.add),
                              iconSize: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 25.0,
                            child: IconButton(
                              onPressed: () => print('Share'),
                              icon: Icon(Icons.share),
                              iconSize: 35.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.vehicle.VehicleNumber.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              widget.vehicle.VehicleNumber,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              '',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Vehicle Number',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      widget.vehicle.VehicleNumber.toString(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                     widget.vehicle.VehicleType,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      widget.vehicle.VehicleType.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      widget.vehicle.VehicleNumber,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      '${widget.vehicle.VehicleNumber}',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 25.0),
                            Container(
                              height: 120.0,
                              child: SingleChildScrollView(
                                child: Text(
                                  widget.vehicle.VehicleNumber,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      VerticalVehicleWidget(title: 'Screen', movie: widget.vehicle)
                    ],
                  ),
          ),
        ));
  }
}
