import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'dart:io';
import 'package:my_app/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInstall extends StatefulWidget {

  const AppInstall({Key? key}) : super(key: key);

  @override
  AppInstallState createState() => AppInstallState();
}

class AppInstallState extends State<AppInstall> {
  bool _switchSelected=false; //ラジオ スイッチの状態を維持する
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
                    backgroundImage: AssetImage('asserts/images/login_user1.png'),
                  ),
                ),
                ),
              ListTile(
                title: const Text('HOME PAGE'),
                trailing: const Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Close'),
                trailing: const Icon(Icons.cancel),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
                },
            ),
            ],
          ),
        ),
      body: Column(
        children: <Widget>[
        Switch(
          value: _switchSelected,//現在のステータス
          onChanged:(value){
            _installApp();
            // checkPermission();   
            //ページを再構築する  
            setState(() {
              _switchSelected=value; 
            });
          },
        ),
        ],
      ),
      ),
    ); 
  }    
}

_installApp() async {
  final availableMap = await MapLauncher.installedMaps;
  debugPrint(availableMap.toString());

  if (Platform.isAndroid || Platform.isIOS) {
    final appId = Platform.isAndroid ? "com.tencent.mm" : "414478124";
    final url = Uri.parse(
      Platform.isAndroid
      ? "market://details?id=$appId"
      : "https://apps.apple.apple.com/app/id@appId",
    );
    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  // if (Platform.isAndroid) {
  //   OpenStore.instance.open(androidAppBundleId: "com.tencent.mm");
  // } else if (Platform.isIOS) {
  //   OpenStore.instance.open(appStoreId: "414478124");
  // }

  // if (Platform.isAndroid) {
  //   LaunchReview.launch(androidAppId: "com.tencent.mm");
  // } else if (Platform.isIOS) {
  //   LaunchReview.launch(iOSAppId: "414478124");
  // }

  // if (Platform.isIOS) {
  //   if (await MapLauncher.isMapAvailable(MapType.googleGo) == true) {

  //     await MapLauncher.showMarker(
  //       mapType: MapType.googleGo,
  //       coords: Coords(31.233568, 121.505504),
  //       title: "title",
  //       description: "location",
  //     );
  //   } else if (await MapLauncher.isMapAvailable(MapType.apple) == true) {
  //     await MapLauncher.showMarker(
  //     mapType: MapType.apple,
  //     coords: Coords(31.233568, 121.505504),
  //     title: "title",
  //     description: "location",
  //     );
  //   }
  // } else if (Platform.isAndroid) {
  //   await MapLauncher.showMarker(
  //     mapType: MapType.google,
  //     coords: Coords(31.233568, 121.505504),
  //     title: "title",
  //     description: "location",
  //   );
  // }
}