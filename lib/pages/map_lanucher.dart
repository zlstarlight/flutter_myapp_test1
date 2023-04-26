import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'dart:io';
import 'package:my_app/pages/home_page.dart';
import 'package:location/location.dart';

class MapLanucher extends StatefulWidget {
  const MapLanucher({Key? key}) : super(key: key);

  @override
  MapLanucherState createState() => MapLanucherState();
}

class MapLanucherState extends State<MapLanucher> {
  bool _switchSelected = false; //ラジオ スイッチの状態を維持する
  // bool? _checkboxSelected=true;//チェックボックスの状態を維持する
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MAP LANUCHER'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text('ZHAO'),
                accountEmail: const Text('zhaolaing@hyron.com'),
                currentAccountPicture: GestureDetector(
                  onTap: () => debugPrint('current user'),
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('asserts/images/login_user1.png'),
                  ),
                ),
              ),
              ListTile(
                title: const Text('HOME PAGE'),
                trailing: const Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Close'),
                trailing: const Icon(Icons.cancel),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()));
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected, //現在のステータス
              onChanged: (value) {
                _gotoMap();
                // checkPermission();
                //ページを再構築する
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            // Checkbox(
            //   value: _checkboxSelected,
            //   activeColor: Colors.red,
            //   onChanged:(value){
            //     setState(() {
            //       _checkboxSelected=value;
            //     });
            //   } ,
            // )
          ],
        ),
      ),
    );
  }
}

_gotoMap() async {
  final availableMap = await MapLauncher.installedMaps;
  debugPrint("availableMap${availableMap.toString()}");
  LocationData locationDat = await Location().getLocation();
  final double? longitude = locationDat.longitude;
  final double? latitude = locationDat.latitude;
  debugPrint("longitude${longitude!}latitude${latitude!}");

  if (Platform.isIOS) {
    if (await MapLauncher.isMapAvailable(MapType.googleGo) == true) {
      await MapLauncher.showMarker(
        mapType: MapType.googleGo,
        coords: Coords(longitude, latitude),
        title: "title",
        description: "location",
      );
    } else if (await MapLauncher.isMapAvailable(MapType.apple) == true) {
      await MapLauncher.showMarker(
        mapType: MapType.apple,
        coords: Coords(longitude, latitude),
        title: "title",
        description: "location",
      );
    }
  } else if (Platform.isAndroid) {
    await MapLauncher.showMarker(
      mapType: MapType.google,
      coords: Coords(latitude, longitude),
      title: "title",
      description: "location",
    );
  }
}
