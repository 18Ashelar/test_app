import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/business_logic/bloc/login/bloc/map_data_bloc.dart';
import 'package:test_app/data/data_provider/login_details_api.dart';
import 'package:test_app/screens/loading_indicator.dart';

import '../../data/model/map_data/geo_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.token});

  final String token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapDataBloc mapDataBloc = MapDataBloc();

  List<GeoData>? geoData;

  @override
  void initState() {
    super.initState();
  }

  final Map<String, Marker> _markers = {};
  LatLng _center = LatLng(73.8215083, 18.6378567);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _markers.clear();

      for (final mapData in geoData!) {
        print((mapData.geojson!.geometry!.coordinates[0]));

        final marker = Marker(
          markerId: MarkerId(mapData.geojson!.properties!.uid!),
          position: LatLng(mapData.geojson!.geometry!.coordinates[0],
              mapData.geojson!.geometry!.coordinates[1]),
          infoWindow: InfoWindow(
            title: mapData.geojson!.properties!.contractor,
            // snippet: office.address,
          ),
        );
        _markers[mapData.geojson!.properties!.uid!] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goole Map Location'),
      ),
      body: BlocProvider(
        create: (context) => mapDataBloc..add(LoadMapData(widget.token)),
        child: BlocBuilder<MapDataBloc, MapDataState>(
          builder: (context, state) {
            if (state is MapDataLoading) {
              return const LoadingIndicator();
            }
            if (state is MapDataLoaded) {
              geoData = state.data;
              return GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 2,
                ),
                markers: _markers.values.toSet(),
              );
            }
            if (state is MapDataFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
