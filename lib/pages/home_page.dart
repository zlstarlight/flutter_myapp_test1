import 'package:flutter/material.dart';
import 'package:my_app/pages/first_page.dart';
import 'package:my_app/pages/map_lanucher.dart';
import 'package:my_app/pages/open_store.dart';
import 'package:my_app/pages/permission.dart';
import 'package:my_app/pages/riverpod.dart';
import 'package:my_app/pages/shared.dart';
import 'package:my_app/pages/sqflite.dart';
import './login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME PAGE',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HOME PAGE'),
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
                // otherAccountsPictures: <Widget>[
                //   GestureDetector(
                //     onTap: () => debugPrint('other user'),
                //     child: const CircleAvatar(
                //       backgroundImage: AssetImage('asserts/images/login_user1.png'),
                //   ),
                //   )
                // ],
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('asserts/images/first_page.png'),
                //   )
                //   ),
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
              ListTile(
                title: const Text('FIRST PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const FirstPage()));
                },
              ),
              ListTile(
                title: const Text('LOGIN PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                },
              ),
              ListTile(
                title: const Text('PERMISSION PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const GetLocation()));
                },
              ),
              ListTile(
                title: const Text('MAP LANUCHER'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MapLanucher()));
                },
              ),
              ListTile(
                title: const Text('STORE LANUCHER'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const StoreLanucher()));
                },
              ),
              ListTile(
                title: const Text('RIVERPOD PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const RiverPod()));
                },
              ),
              ListTile(
                title: const Text('SQFLITE PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SqliteDemoApp()));
                },
              ),
              ListTile(
                title: const Text('SHARED PAGE'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const SharedPreferencesExample()));
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
      ),
    );
  }
}
