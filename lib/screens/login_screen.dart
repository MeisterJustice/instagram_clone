import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
      // Loggin in the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Billabong',
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (input) => !input.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      onSaved: (input) => _email = input,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (input) => input.length < 6
                          ? 'Must be atleast 6 characters'
                          : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    child: FlatButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(SignUpScreen.routeName),
                      color: Colors.blue,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Go to Signup',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
