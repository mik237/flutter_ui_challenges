import 'package:customized_google_map/api/api_manager.dart';
import 'package:customized_google_map/constants/api_constants.dart';
import 'package:customized_google_map/constants/file_constants.dart';
import 'package:customized_google_map/location/location_manager.dart';
import 'package:customized_google_map/providers/map_provider.dart';
import 'package:customized_google_map/utils/permission_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomizedGoogleMap();
  }
}

class CustomizedGoogleMap extends StatefulWidget {
  const CustomizedGoogleMap({Key? key}) : super(key: key);

  @override
  _CustomizedGoogleMapState createState() => _CustomizedGoogleMapState();
}

class _CustomizedGoogleMapState extends State<CustomizedGoogleMap> {
  String _mapStyle = "";
  GoogleMapController? _mapController;
  Set<Marker> _showMarkers = {};
  List<LatLng> _nearestPharmacies = [];
  // List<PharmacyDetailsModel> _pharmacies = [];


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      rootBundle
          .loadString(FileConstants.mapStyle)
          .then((value) => _mapStyle = value);
    });

    _getUserLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        markers: _showMarkers,
        initialCameraPosition: _getLocationTarget(),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          _mapController?.setMapStyle(_mapStyle);
        },
        onCameraMove: (CameraPosition position) {},
      ),
    );
  }

  CameraPosition _getLocationTarget() {
    return CameraPosition(target: LatLng(24.334447, 54.534712), zoom: 15.0);
  }

  Future<void> _getUserLocation(BuildContext context) async {
    PermissionUtils.requestPermission(Permission.location, context,
        isOpenSettings: true,
        permissionGranted: () async {
      // await LocationService().fetchCurrentLocation(context, _getPharmacyList, updatePosition: updateCameraPosition);
        }, permissionDenied: () {
      Fluttertoast.showToast(
          msg:
              'Please grant the required permission from settings to access this feature.');
    });
  }


  void _getPharmacyList() async{
    ApiManager()
        .getPlaces(ApiConstants.getPlaces(Provider.of<MapProvider>(context, listen: false).currentLatLng!, ""), context)
        .then((value){
          setState(() {
            _nearestPharmacies.clear();
            // _pharmacies.clear();
          });
    });
  }
}
