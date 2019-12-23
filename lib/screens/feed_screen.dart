import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/services/auth_service.dart';
import 'package:instagram_clone/services/database_service.dart';

class FeedScreen extends StatefulWidget {
  static const routeName = 'feed-screen';
  final String currentUserId;

  FeedScreen({this.currentUserId});
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _setupFeed();
  }

  _setupFeed() async {
    List<Post> posts = await DatabaseService.getFeedPosts(widget.currentUserId);
    setState(() {
      _posts = posts;
    });
  }

  _buildPost(Post post, User author) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProfileScreen(
                currentUserId: widget.currentUserId,
                userId: post.authorId,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey,
                  backgroundImage: author.profileImageUrl.isEmpty
                      ? AssetImage('assets/images/placeholder.jpeg')
                      : CachedNetworkImageProvider(
                          author.profileImageUrl,
                        ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  author.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(post.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.comment,
                    ),
                    iconSize: 30,
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  '7 likes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 6),
                    child: Text(
                      author.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      post.caption,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _posts.length > 0
          ? RefreshIndicator(
              onRefresh: () => _setupFeed(),
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int index) {
                  Post post = _posts[index];
                  return FutureBuilder(
                    future: DatabaseService.getUserWithId(
                      post.authorId,
                    ),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox.shrink();
                      }
                      User author = snapshot.data;
                      return _buildPost(post, author);
                    },
                  );
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
