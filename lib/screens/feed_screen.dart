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
