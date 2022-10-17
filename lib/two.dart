import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_3oy3_vazifa/service/prefs.dart';
import 'package:login_3oy3_vazifa/service/user2.dart';
import 'package:login_3oy3_vazifa/service/userr.dart';

class TwoPAge extends StatefulWidget {
  const TwoPAge({Key? key}) : super(key: key);

  @override
  State<TwoPAge> createState() => _TwoPAgeState();
}

class _TwoPAgeState extends State<TwoPAge> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phonController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  doLogin() {
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phonController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String confrim = confirmController.text.toString().trim();

    User2 user2 =
        User2(email: email, password: password, name: name, phon: phone);

    Prefs.storeUser2(user2);
    Prefs.loadUser2().then((user2) => print(user2?.phon));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              'Let\'s Get Started!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Create an account to Q Allure to get all features',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )),
            SizedBox(
              height: 40,
            ),
            textw('Name', Icon(Icons.person_outline), nameController),
            textw('Email', Icon(Icons.email_outlined), emailController),
            textw('Phon', Icon(Icons.phone_iphone), phonController),
            textw('Password', Icon(Icons.lock_outline), passwordController),
            textw('Confirm Password', Icon(Icons.lock_outline),
                confirmController),
            Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.only(top: 70, left: 70, right: 70),
              decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                onPressed: () {
                  doLogin();
                },
                child: Text(
                  'CREATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    ' Login here',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget textw(String text, Icon icon, TextEditingController controller) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          labelText: text,
          prefixIcon: icon),
    ),
  );
}
