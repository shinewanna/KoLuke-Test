import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';
import 'package:koluke_test/app/core/utils/app_util.dart';

class HomeController extends GetxController {
  MapController? mapController;
  List<GeoPoint> markers = [];

  void addMarker() async {
    final pos = await mapController!.centerMap;
    markers.add(pos);

    mapController!.addMarker(pos);
    if (markers.length >= 3) {
      await mapController!.removeMarker(markers.first);
      markers.removeAt(0);
    }
  }

  setRoute() async {
    AppUtil.showLoading();
    try {
      await mapController!.drawRoad(markers.first, markers.last,
          roadOption: RoadOption(showMarkerOfPOI: true));
    } catch (_) {
      AppUtil.stopLoading();
    }
    AppUtil.stopLoading();
  }

  changeToCurrentPos() async {
    AppUtil.showLoading();
    await mapController!.currentLocation();
    AppUtil.stopLoading();
  }

  @override
  void dispose() {
    mapController!.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    );
  }
}
