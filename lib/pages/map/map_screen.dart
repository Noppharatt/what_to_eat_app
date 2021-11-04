// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:what_to_eat_application/model/Locations.dart';
import 'package:what_to_eat_application/pages/map/simpleUsageMap.dart';
import 'package:what_to_eat_application/service/rest_api.dart';
import 'package:what_to_eat_application/utilities/SlidingUpPanel.dart';
import 'package:what_to_eat_application/utilities/interactive_maps_marker.dart';
import 'package:what_to_eat_application/utilities/utils.dart';

class MapStoreLayoutScreen extends StatefulWidget {
  const MapStoreLayoutScreen({Key key}) : super(key: key);

  @override
  _MapStoreLayoutScreenState createState() => _MapStoreLayoutScreenState();
}

class _MapStoreLayoutScreenState extends State<MapStoreLayoutScreen> {
  //Call API Sevice
  CallAPI callAPI;
  List<Locations> locations;
  var locationMessage = '';
  String latitude;
  String longitude;
  double lat = 0.0000;
  double long = 0.0000;
  double itemHeight = 116;
  int currentIndex = 0;
  PageController pageController = PageController(viewportFraction: 0.9);
  GoogleMapController mapController;
  IndexedWidgetBuilder itemContent;
  IndexedWidgetBuilder itemBuilder;
  Uint8List markerIcon;
  Uint8List markerIconSelected;
  ValueNotifier selectedMarker = ValueNotifier<int>(null);
  static LatLng _center = const LatLng(45.521563, -122.677433);
  static LatLng _anotherLocation = const LatLng(45.509244, -122.633476);
  final Completer<GoogleMapController> _controller = Completer();
  List<Locations> products =List();

  final List<MarkerItem> markers = List();

  // ..add(MarkerItem(id: 2, latitude: 31.4718461, longitude: 74.3531591))
  // ..add(MarkerItem(id: 3, latitude: 31.5325107, longitude: 74.3610325))
  // ..add(MarkerItem(id: 4, latitude: 31.4668809, longitude: 74.31354));

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

    print("getCurrentLocation $latitude + $longitude");
  }

  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    callAPI = CallAPI();
    getCurrentLocation();

    locations = List<Locations>();

    rebuildMarkers(currentIndex);
    super.initState();
  }

  Marker portlandMarker = Marker(
      markerId: MarkerId("Portland"),
      position: _center,
      infoWindow:
          InfoWindow(title: "Portland", snippet: "This is a great town!"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Map"),
              ),
              body: FutureBuilder(
                  future: callAPI.getProducts(),
                  // ignore: missing_return
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Locations>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            'Something wrong with ${snapshot.error.toString()}'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                       products = snapshot.data;

                       print(products[0].restAddress);

                      products.asMap().forEach((idx, val) {
                        var restLatitude = double.tryParse(val.restLatitude);

                        var restLongtitude =
                            double.tryParse(val.restLongtitude);

                        print('$idx: $val');
                        markers.add(MarkerItem(
                            id: idx,
                            latitude: restLatitude,
                            longitude: restLongtitude));
                      });

                      itemContent = (context, index) {
                        print("itemContent $index");
                        MarkerItem item = markers[index];

                         print('itemContent $products'); 
                        return BottomTile(item: item , locations : products[index] );

                         
                      };

                
                      //map_screen.dart locations = products ;

                      print(products);
                      return Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: GoogleMap(
                                // onMapCreated: _onMapCreated,
                                myLocationEnabled: true,
                                markers: Set.from(products.map((element) {
                                  var restLatitude =
                                      double.tryParse(element.restLatitude);

                                  var restLongtitude =
                                      double.tryParse(element.restLongtitude);
                                  return Marker(
                                      markerId: MarkerId("Portland"),
                                      position:
                                          LatLng(restLatitude, restLongtitude),
                                      infoWindow: InfoWindow(
                                          title: element.restName,
                                          snippet: element.restAddress),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              BitmapDescriptor.hueMagenta));
                                }).toList()),
                                mapType: MapType.terrain,
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(lat, long), zoom: 10.0)),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 80.0),
                              child: SizedBox(
                                height: 116,
                                child: PageView.builder(
                                  itemCount: markers.length,
                                  controller: pageController,
                                  // onPageChanged: _pageChanged,
                                  itemBuilder: itemBuilder != null
                                      ? itemBuilder
                                      : _buildItem,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Intel Coorp!"),
                icon: Icon(Icons.place),
              ));
        });
  }

  void _pageChanged(int index) {
    setState(() => currentIndex = index);
    Marker marker = markers.elementAt(index) as Marker;
    //\\ rebuildMarkers(index);

    mapController
        .animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: marker.position, zoom: 15),
      ),
    )
        .then((val) {
      setState(() {});
    });
  }

  Widget _buildItem(context, i) {
    return Transform.scale(
      scale: i == currentIndex ? 1 : 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: itemHeight,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.5, 0.5),
                color: Color(0xff000000).withOpacity(0.12),
                blurRadius: 20,
              ),
            ],
          ),
          child: itemContent(context, i),
        ),
      ),
    );
  }

  Future<void> rebuildMarkers(int index) async {
    int current = markers[index].id;

    if (markerIcon == null)
      markerIcon = await getBytesFromAsset(
          'packages/interactive_maps_marker/assets/marker.png', 100);
    if (markerIconSelected == null)
      markerIconSelected = await getBytesFromAsset(
          'packages/interactive_maps_marker/assets/marker_selected.png', 100);

    Set<Marker> _markers = Set<Marker>();

    markers.forEach((item) {
      _markers.add(
        Marker(
          markerId: MarkerId(item.id.toString()),
          position: LatLng(item.latitude, item.longitude),
          onTap: () {
            int tappedIndex =
                markers.indexWhere((element) => element.id == item.id);
            pageController.animateToPage(
              tappedIndex,
              duration: Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
            );
            _pageChanged(tappedIndex);
          },
          icon: item.id == current
              ? BitmapDescriptor.fromBytes(markerIconSelected)
              : BitmapDescriptor.fromBytes(markerIcon),
        ),
      );
    });

    setState(() {
      //  markers = _markers;
    });
    selectedMarker.value = current;
  }

  // }
}
