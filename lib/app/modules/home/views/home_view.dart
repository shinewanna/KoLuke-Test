import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller.mapController!,
            trackMyPosition: false,
            initZoom: 12,
            minZoomLevel: 8,
            maxZoomLevel: 19,
            stepZoom: 1.0,
            onGeoPointClicked: (gp) {
              printInfo(info: gp.toString());
            },
            showZoomController: true,
            mapIsLoading: Center(child: CircularProgressIndicator()),
            userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 48,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: RoadConfiguration(
              startIcon: MarkerIcon(
                icon: Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.brown,
                ),
              ),
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
                defaultMarker: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 56,
              ),
            )),
            androidHotReloadSupport: true,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 22,
            child: MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => controller.setRoute(),
                  child: Text('Set Route'),
                ),
                ElevatedButton(
                  onPressed: () => controller.addMarker(),
                  child: Text('Add Marker'),
                ),
                ElevatedButton(
                  onPressed: () => controller.changeToCurrentPos(),
                  child: Text('Current Pos'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
