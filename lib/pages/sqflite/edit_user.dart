// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db.dart';

class EditUser extends StatefulWidget{

  int rollno;
  EditUser({required this.rollno});

  @override
  State<StatefulWidget> createState() {
    return _EditUser();
  }
}

class _EditUser extends State<EditUser>{
  
  TextEditingController rollno = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  MyDb mydb = MyDb();

  @override
  void initState() {
    mydb.open();

    Future.delayed(const Duration(milliseconds: 500), () async {
        var data = await mydb.getUser(widget.rollno);
        if(data != null){
            rollno.text = data["roll_no"].toString();
            username.text = data["username"];
            password.text = data["password"];;
            setState(() {});
        }else{
           debugPrint("No any data with roll no: " + widget.rollno.toString());
        }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text("Edit Student"),
            ),
            body:Container( 
               padding: const EdgeInsets.all(30),
               child: Column(children: [
                   TextField(
                     controller: rollno,
                     decoration: const InputDecoration(
                        hintText: "Roll No.",
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
                         mydb.db.rawInsert("UPDATE user SET roll_no = ?,username = ?, password = ? WHERE roll_no = ?",
                         [rollno.text,username.text,password.text, widget.rollno]);

                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Info Updated")));

                   }, child: const Text("Update User Info")),
               ],),
            )
       );
  }

}