import 'package:flutter/material.dart';

import './home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPod extends ConsumerWidget {
  const RiverPod({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final String username = ref.watch(userNameProvider);
    // final String pwd = ref.watch(passWordProvider);
    return MaterialApp(
      title: 'RIVERPOD PAGE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RIVERPOD PAGE'),
        ),
        body: Center(
          child: Consumer(builder: (context, ref, _) {
            // final String userinfo = username + pwd;
            return const Text('');
          }),
        ),
        drawer: Drawer(
          child: ListView(children: <Widget>[
            ListTile(
              title: const Text('HOME PAGE'),
              trailing: const Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
