// import 'package:flutter/material.dart';
// import 'package:my_app/pages/riverpod.dart';

// // アプリケーションプログラム実行入口
// void main(List<String> args) {
//   // 指定された Widget を初期化し、Widget をスクリーン上のアプリケーション プロシージャのエントリに処理します
//   runApp(const MaterialApp(
//     title: 'MAIN PAGE',
//     home: FirstPage(),
//   ));
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/pages/first_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final userNameProvider = StateProvider((ref) => 'ZHAO');
final passWordProvider = StateProvider((ref) => '123456');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MaterialApp(
        title: 'MAIN PAGE',
        home: FirstPage(),
      ),
    ),
  );
}
