// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'db.dart';
import 'edit_user.dart';

class ListUser extends StatefulWidget{
  const ListUser({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
     return _ListUser();
  }
}

class _ListUser extends State<ListUser>{

  List<Map> slist = [];
  MyDb mydb = MyDb();

  @override
  void initState() {
    mydb.open();
    getdata();
    super.initState();
  }

  getdata(){
    Future.delayed(const Duration(milliseconds: 500),() async {
        slist = await mydb.db.rawQuery('SELECT * FROM user');
        setState(() { });
    });
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
           title: const Text("List of User"),
        ),
        body: SingleChildScrollView(
          child: Container(
             child: slist.isEmpty?const Text("No any user to show."):
             Column( 
                children: slist.map((user){
                     return Card(
                       child: ListTile(
                          leading: const Icon(Icons.people),
                          title: Text(user["username"]),
                          subtitle: Text("Roll No:${user["roll_no"]}${", UserName: "}${user["username"]}"),
                          // subtitle: Text("Roll No:" + stuone["roll_no"].toString() + ", Add: " + stuone["password"]),
                          trailing: Wrap(children: [
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                    return EditUser(rollno: user["roll_no"]);
                                }));
                              }, icon: const Icon(Icons.edit)),


                              IconButton(onPressed: () async {
                                   await mydb.db.rawDelete("DELETE FROM user WHERE roll_no = ?", [user["roll_no"]]);
                                   debugPrint("Data Deleted");
                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User Info Deleted")));
                                   getdata();
                              }, icon: const Icon(Icons.delete, color:Colors.red))


                          ],),
                       ),
                     );
                }).toList(),
             ), 
          ),
        ),
     );
  }
}
