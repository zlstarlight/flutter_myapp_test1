import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb{
   late Database db;

   Future open() async {
        // Get a location using getDatabasesPath
        var databasesPath = await getDatabasesPath();
        String path = join(databasesPath, 'demo.db');
        //join is from path package
        debugPrint(path); //output /data/user/0/com.testapp.flutter.testapp/databases/demo.db

        db = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
             // When creating the db, create the table
              await db.execute('''

                    CREATE TABLE IF NOT EXISTS user( 
                          id primary key,
                          roll_no int not null,
                          username varchar(255) not null,
                          password varchar(255) not null
                      );

                      //create more table here
                  
                  ''');
            //table students will be created if there is no table 'students'
            debugPrint("Table Created");
        });
   }

  Future<Map<dynamic, dynamic>?> getUser(int rollno) async {
    List<Map> maps = await db.query('user',
        where: 'roll_no = ?',
        whereArgs: [rollno]);
    //getting student data with roll no.
    if (maps.isNotEmpty) {
       return maps.first;
    }
    return null;
  }
}