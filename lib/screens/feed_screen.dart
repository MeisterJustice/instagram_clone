import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = 'feed-screen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Instagram',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Billabong',
              fontSize: 35,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(),
          child: Text('Logout'),
          color: Colors.white,
          textColor: Colors.blue,
          hoverColor: Colors.pink,
        ),
      ),
    );
  }
}
