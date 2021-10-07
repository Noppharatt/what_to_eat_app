// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print



import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapStoreLayoutScreen extends StatefulWidget {
  const MapStoreLayoutScreen({Key key}) : super(key: key);

  @override
  _MapStoreLayoutScreenState createState() => _MapStoreLayoutScreenState();
}

class _MapStoreLayoutScreenState extends State<MapStoreLayoutScreen> {

  var locationMessage = '';
  String latitude;
  String longitude;
   var lat  ;
  var long ;

GoogleMapController mapController;
  static LatLng _center = const LatLng(45.521563, -122.677433);
  static LatLng _anotherLocation = const LatLng(45.509244, -122.633476);

  void _onMapCreated(GoogleMapController controller) {
     mapController = controller;
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
     lat = position.latitude;
     long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });

    print("$latitude + $latitude");
  }

  // Future<Position?> _getLocation() async {
  //   try {
  //     userLocation = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     userLocation = null;
  //   }
  //   return userLocation;
  // }

  //final GeolocatorService geoService = GeolocatorService();
//  Position userLocation = Position();
//bin Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //  Future<Position> _getLocation() async {
  //   try {
  //     userLocation = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //   } catch (e) {
  //     userLocation = Position as Position;
  //   }
  //   return userLocation;
  // }

//  fetchPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//     Position currentposition = await Geolocator.getCurrentPosition();
//     setState(() {
//       position = currentposition;
//     });
//   }

  @override
  void initState() {
    // _getCurrentLocation ;
    // geoService.getCurrentLocation().listen((position) {
    //   centerScreen(position);
    // });
    //  positionStream ;

    getCurrentLocation();

    super.initState();
  }


 Marker portlandMarker = Marker(markerId: MarkerId("Portland"),
     position: _center,
     infoWindow: InfoWindow(title: "Portland", snippet: "This is a great town!"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
        body: 
        Container(
       width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
          child:   GoogleMap(
             myLocationEnabled: true,
            markers: { portlandMarker },
              mapType: MapType.terrain,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target:  LatLng(lat, long), zoom: 10.0)),
          
          ),
 
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, 
          label: Text("Intel Coorp!"),
      icon: Icon(Icons.place),
      
      
      )
        
      //   Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
      //   ),
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: SafeArea(
      //     child: Container(
      //       color: Colors.blueGrey.withOpacity(.8),
      //       child: Center(
      //         child: Column(
      //           children: [
      //             Container(
      //               height:  MediaQuery.of(context).size.height/2.5,
      //               width: MediaQuery.of(context).size.width,
      //               child: GoogleMap(
      //                 initialCameraPosition: CameraPosition(target: _initialcameraposition,
      //                 zoom: 15),
      //                 mapType: MapType.normal,
      //                 onMapCreated: _onMapCreated,
      //                 myLocationEnabled: true,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 3,
      //             ),
      //             if (_dateTime != null)
      //               Text(
      //                 "Date/Time: $_dateTime",
      //                 style: TextStyle(
      //                     fontSize: 15,
      //                     color: Colors.white,
      //                   ),
      //               ),

      //             SizedBox(
      //               height: 3,
      //             ),
      //             if (_currentPosition != null)
      //               Text(
      //                 "Latitude: ${_currentPosition?.latitude}, Longitude: ${_currentPosition?.longitude}",
      //                 style: TextStyle(
      //                     fontSize: 22,
      //                     color: Colors.white,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //             SizedBox(
      //               height: 3,
      //             ),
      //             if (_address != null)
      //               Text(
      //                 "Address: $_address",
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             SizedBox(
      //               height: 3,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );




  
  }

  //  Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(lacation1));
  // }

  // Future<void> centerScreen(Position position) async {

  //   // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationOptions).listen(
  //   // (Position position) {
  //   //     print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
  //   // });

  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(position.latitude, position.longitude), zoom: 18.0)));
  // }

  getLoc() async{
    bool _serviceEnabled;
   // Permission _permissionGranted;

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }




  }
}
