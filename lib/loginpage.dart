import 'package:aplikasi/homepage.dart';
import 'package:aplikasi/navigationpage.dart';
import 'package:aplikasi/registerpage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              fontFamily: 'ChakraPetch',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: username,
            decoration: InputDecoration(
              labelText: "Username",
            ),
            style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 20),
          ),
          TextFormField(
            controller: pass,
            decoration: InputDecoration(
              labelText: "Password",
            ),
            style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 20),
            obscureText: true,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onSurface: Colors.white,
                    side: BorderSide(
                      color: Colors.black,
                    )),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
              ),
              SizedBox(width: 20),
              ElevatedButton(
                child: Container(
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    onSurface: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                    )),
                onPressed: () {
                  if (username.text == "rafi" && pass.text == "1234") {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return NavigationPage();
                    }));
                  } else {
                    username.text = "";
                    pass.text = "";
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Login Failed",
                            style: TextStyle(
                              fontFamily: 'ChakraPetch',
                            ),
                          ),
                          content: Text(
                            "Username or password is incorrect.",
                            style: TextStyle(
                              fontFamily: 'ChakraPetch',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  fontFamily: 'ChakraPetch',
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account yet? Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
