// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db.dart';

class AddUser extends StatefulWidget{
  const AddUser({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
      return _AddUser();
  }
}

class _AddUser extends State<AddUser>{

  TextEditingController rollno = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  MyDb mydb = MyDb();

  @override
  void initState() {
    mydb.open();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
       return Scaffold(
            appBar: AppBar(
              title: const Text("Add User"),
            ),
            body:Container( 
               padding: const EdgeInsets.all(30),
               child: Column(children: [
                  TextField(
                     controller: rollno,
                     decoration: const InputDecoration(
                        hintText: "Roll No",
                     ),
                   ),
                   TextField(
                     controller: username,
                     decoration: const InputDecoration(
                        hintText: "User Name",
                     ),
                   ),
                   TextField(
                     controller: password,
                     decoration: const InputDecoration(
                        hintText: "Pass Word",
                     ),
                   ),
                   ElevatedButton(onPressed: (){

                         mydb.db.rawInsert("INSERT INTO user (roll_no,username,password) VALUES (?, ?, ?);",
                         [rollno.text,username.text,password.text]);

                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("New User Added")));

                         rollno.text = "";
                         username.text = "";
                         password.text = "";
                   }, child: const Text("Save User Data")),
               ],),
            )
       );
  }
}