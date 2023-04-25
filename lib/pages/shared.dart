import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({Key? key}) : super(key: key);
  @override
  SharedPreferencesExampleState createState() =>
      SharedPreferencesExampleState();
}

class SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  SharedPreferences? sharedPreferences;

  // 设置持久化数据
  void _setData() async {
    // 实例化
    sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences?.setString("username", "Jimi");

    await sharedPreferences?.setInt("password", 123);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "UserName: ${sharedPreferences?.getString("username") ?? ""}",
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "PassWord: ${sharedPreferences?.getInt("password") ?? ""}",
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
