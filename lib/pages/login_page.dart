import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/pages/home_page.dart';

class Login extends ConsumerWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  
  final username = "zz";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  // List<Map> slist = [];
  // MyDb mydb = MyDb();

  // void initState() {
  //   mydb.open();
  //   getdata();
  //   super.initState();
  // }

  // getdata(){
  //   Future.delayed(const Duration(milliseconds: 500),() async {
  //       slist = await mydb.db.rawQuery('SELECT * FROM user');
  //       setState(() { });
  //   });
  // }
  
    return MaterialApp(
      title: 'LOGIN PAGE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN PAGE'),
        ),
        body: Consumer(builder: (context, ref, _) {
          List<Widget> childrens = [];
          final mainConatiner = Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('asserts/images/first_page.png'),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'user name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter user name';
                      } else if (value != username) {
                        return 'Your username is not found, Please check your username';
                      }
                      return null;
                    },
                    controller: _userNameTextController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'password'),
                    validator: (value) {
                      // if (value!.isEmpty) {
                      //   return 'Please enter password';
                      // } else if (value != pwd) {
                      //   return 'Your password is not incorrect, Please check your password';
                      // }
                      return null;
                    },
                    controller: _passwordTextController,
                    obscureText: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return const HomePage();
                          //   }));
                          if ((_formKey.currentState as FormState).validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomePage();
                            }));
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                        ),
                        child: const Text(
                          'lOGIN',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )),
                  )
                ],
              ),
            ),
          );
          childrens.add(mainConatiner);
          return Stack(
            children: childrens,
          );
        }),
      ),
    );
  }
}
