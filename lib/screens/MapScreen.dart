import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:epicontrol/component/AppBarWidget.dart';
import 'package:epicontrol/component/MenuDrawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static String id = 'mapScreen';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  @override
  void initState() {
    super.initState();
  }

  MapType _currentMapType = MapType.normal;
  GoogleMapController mapController;
  static const LatLng center = LatLng(11.500731, 3.857800);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = center;

  void _onAddMarkerButtonPress() {
    setState(() {
      _markers.add((Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Youpi',
          snippet: '10 stat rate'
        ),
        icon: BitmapDescriptor.defaultMarker
      )));
    });
  }

  // track camera position
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  // change map type
  void _onMapTypeButtonPress() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  //create map
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBarWidget(title: 'Map')
      ),
      drawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: onMapCreated,
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: center,
              zoom: 11.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      _onMapTypeButtonPress();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0,),
                  ),
                  SizedBox(height: 15.0),
//                  FloatingActionButton(
//                    onPressed: () {
//                      _onAddMarkerButtonPress();
//                    },
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.orange,
//                    child: const Icon(Icons.location_on, size: 36.0,),
//                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
