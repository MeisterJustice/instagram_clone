import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = 'signup-screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                          labelText: 'Full Name',
                        ),
                        validator: (input) => (input.trim().isEmpty)
                            ? 'Please enter a valid full name'
                            : null,
                        onSaved: (input) => _name = input,
                      ),
                    ),
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
                          'SignUp',
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
                        onPressed: () => Navigator.of(context).pop(),
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Go to Login',
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
      ),
    );
  }
}
