import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        backgroundColor: Colors.black,
      ),
      body: Row(
        children: <Widget>[
          const Expanded(
            flex: 2,
            child: FeedScreen(),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[900],
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
