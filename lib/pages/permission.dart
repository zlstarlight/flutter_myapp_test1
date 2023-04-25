import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';
import 'package:my_app/pages/home_page.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  GetLocationState createState() => GetLocationState();
}

class GetLocationState extends State<GetLocation> {
  bool _switchSelected = false; //ラジオ スイッチの状態を維持する
  // bool? _checkboxSelected=true;//チェックボックスの状態を維持する
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PERMISSION PAGE'),
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
                // _gotoMap();
                checkPermission();
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

//許可の有無の判断
void checkPermission() async {
  Permission permission = Permission.location;
  PermissionStatus status = await permission.status;
  if (status.isGranted) {
    //許可が下りました
  } else if (status.isDenied) {
    //許可が拒否されました。IOS と Android を区別する必要があります。この 2 つは異なります
    requestPermission(permission);
  } else if (status.isPermanentlyDenied) {
    //許可は永久に拒否され、プロンプトは表示されません。設定インターフェイスに入る必要があります
    AppSettings.openAppSettings();
  } else if (status.isRestricted) {
    //アクティビティの制限 (例: 保護者による /// コントロールが設定されています。iOS でのみサポートされています。
    AppSettings.openAppSettings();
  } else {
    requestPermission(permission);
  }
}

//アクセスのリクエスト
void requestPermission(Permission permission) async {
  PermissionStatus status = await permission.request();
  if (!status.isGranted) {
    AppSettings.openAppSettings();
  }
}
