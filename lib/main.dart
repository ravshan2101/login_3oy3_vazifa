import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_3oy3_vazifa/service/prefs.dart';
import 'package:login_3oy3_vazifa/service/userr.dart';
import 'package:login_3oy3_vazifa/two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => MyHomePage(),
        'two': (context) => TwoPAge(),
      },
      initialRoute: 'home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  dologin() {
    String email = emailcontroller.text.toString().trim();
    String password = passwordcontroller.text.toString().trim();

    User user = User.from(email: email, password: password);

    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => print(user?.email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 240,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/login.webp'))),
                ),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Log in your existens account of Q Allu',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              passwordcontroller.clear();
                            },
                            icon: Icon(Icons.clear)),
                        prefixIcon: Icon(
                          Icons.person_outline,
                        ),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    controller: passwordcontroller,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              passwordcontroller.clear();
                            },
                            icon: Icon(Icons.clear)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(right: 35, bottom: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: () {
                      dologin();
                    },
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Or connect using',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: const [
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.facebook_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))),
                    Expanded(
                        child: Container(
                            height: 40,
                            margin: EdgeInsets.only(left: 10, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Container(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                        'assets/images/google.png')),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Facebook',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Don\'t have an account?  ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('two');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
