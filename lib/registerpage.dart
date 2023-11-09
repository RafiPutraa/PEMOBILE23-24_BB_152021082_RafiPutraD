import 'package:aplikasi/homepage.dart';
import 'package:aplikasi/loginpage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Register(),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            "REGISTER",
            style: TextStyle(
              fontSize: 70,
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
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
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
                  if (username.text == "" || pass.text == "") {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Registration Failed",
                            style: TextStyle(
                              fontFamily: 'ChakraPetch',
                            ),
                          ),
                          content: Text(
                            "Please complete your data.",
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
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
