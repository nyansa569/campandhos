import 'dart:ffi';

import 'package:cnahr/screens/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const LatLng currentLocation = LatLng(5.5957416, -0.2227736);

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};

  final TextEditingController _searchController = TextEditingController();
  List<String> items = [];
  List<String> filteredItems = [];
  LatLng? selectedPlace;
  bool showPlaces = false;

  @override
  void initState() {
    super.initState();
    _loadItemsFromApi();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final searchQuery = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  Future<void> _loadItemsFromApi() async {
    final response = await http.get(Uri.parse(locations));
    print('Getting locationssss...');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      List<String> names = [];

      for (var item in data) {
        if (item.containsKey('name')) {
          names.add(item['name']);
        }
      }

      setState(() {
        items = names;
        filteredItems = items;
      });
    }
  }

  // Callback function to update the map target
  void updateMapTarget(LatLng coordinates) {
    setState(() {
      selectedPlace = coordinates;
    });
  }

  Future<void> getLocationByNameAndUpdateLocation(String name) async {
    final response = await http.get(Uri.parse(locations + '/' + name));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final LatLng coordinates = LatLng(data['lat'][0], data['lat'][1]);

      setState(() {
        selectedPlace = coordinates;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  TextEditingController destinationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('maps'),
          trailing: GestureDetector(
            child: showPlaces
                ? Icon(CupertinoIcons.location)
                : Icon(CupertinoIcons.search),
            onTap: () {
              setState(() {
                showPlaces = !showPlaces;
              });
            },
          ),
        ),
        body: Card(
          elevation: 0,
          margin: EdgeInsets.all(0),
          child: SafeArea(
            child: Stack(
              children: [
                showPlaces
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CupertinoSearchTextField(
                              controller: _searchController,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return _searchController.text.isEmpty
                                    ? SizedBox()
                                    : InkWell(
                                        onTap: () async {
                                          getLocationByNameAndUpdateLocation(
                                            filteredItems[index],
                                          );
                                          setState(() {
                                            showPlaces = !showPlaces;
                                          });
                                        },
                                        child: ListTile(
                                          title: Text(filteredItems[index]),
                                        ),
                                      );
                              },
                            ),
                          ),
                        ],
                      )
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: selectedPlace ?? currentLocation,
                          // zoom: MediaQuery.of(context).size.height * 0.013,
                          zoom: 16,
                        ),
                        onMapCreated: (controller) {
                          mapController = controller;
                          addMarker('test', selectedPlace ?? currentLocation);
                        },
                        markers: _markers.values.toSet(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addMarker(String markerId, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(markerId),
      position: location,
    );

    _markers[markerId] = marker;
    setState(() {});
  }
}
