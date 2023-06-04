import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MapPage());
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(35.697421, 139.682461),
    zoom: 11.5,
  );

  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    final data = await rootBundle.loadString('assets/disposal_sites.txt');
    final lines = data.split('\n');

    for (final line in lines) {
      final items = line.split(',');

      final markerId = MarkerId(items[0]);
      final latitude = double.parse(items[1]);
      final longitude = double.parse(items[2]);
      final imageAssetName = items[3];
      print("$imageAssetName");
      final markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)),
        'assets/yellowPet.png',
      );

      // if (imageAssetName.compareTo('yellowPet.png') == 0) {

      // } else if (imageAssetName == 'marker2.png') {
      //   markerIcon = await BitmapDescriptor.fromAssetImage(
      //     ImageConfiguration(size: Size(48, 48)),
      //     'assets/marker2.png',
      //   );
      // } else if (imageAssetName == 'marker3.png') {
      //   markerIcon = await BitmapDescriptor.fromAssetImage(
      //     ImageConfiguration(size: Size(48, 48)),
      //     'assets/marker3.png',
      //   );
      // } else {
      //   // Handle other cases or provide a default marker icon
      //   markerIcon = BitmapDescriptor.defaultMarker;
      // }

      final marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        icon: markerIcon,
        infoWindow: InfoWindow(
          title: '$markerId',
        ),
      );

      setState(() {
        _markers[markerId] = marker;
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        markers: Set<Marker>.of(_markers.values),
      ),
    );
  }
}
