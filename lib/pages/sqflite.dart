import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/sqflite/add_user.dart';
import 'package:my_app/pages/sqflite/list_user.dart';

class SqliteDemoApp extends StatelessWidget {
  const SqliteDemoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
          appBar: AppBar(
             title: const Text("Add User"),
          ),
          body: Container( 
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(20),
            child: Column(
                children:[
                    ElevatedButton(
                      onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return const AddUser();
                            }));
                      },
                      child: const Text("Add User"),
                    ),

                    ElevatedButton(
                      onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return const ListUser();
                            }));
                      },
                      child: const Text("List User Info"),
                    ),

                ]
            ),
          ),
          drawer: Drawer (
          child: ListView(
            children: <Widget>[
               ListTile(
                title: const Text('HOME PAGE'),
                trailing: const Icon(Icons.arrow_upward),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
                },
              ),
            ]
          ),
        ),  
     );
  }
 
}

