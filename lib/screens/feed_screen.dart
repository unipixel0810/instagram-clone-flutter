import 'package:flutter/material.dart';
import 'dart:async';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram', style: TextStyle(fontFamily: 'Billabong', fontSize: 35)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.send_outlined), onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostCard(index: index);
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final int index;
  const PostCard({super.key, required this.index});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  bool _showHeart = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _isLiked = true;
      _showHeart = true;
    });
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/seed/${widget.index}p/100/100'),
            ),
            title: const Text('username', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onDoubleTap: _handleDoubleTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network('https://picsum.photos/500/500?random=${widget.index}'),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _showHeart ? 1.0 : 0.0,
                  child: const Icon(Icons.favorite, color: Colors.white, size: 100),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.white,
                      ),
                      onPressed: _toggleLike,
                    ),
                    IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.white), onPressed: () {}),
                    IconButton(icon: const Icon(Icons.send_outlined, color: Colors.white), onPressed: () {}),
                  ],
                ),
                IconButton(icon: const Icon(Icons.bookmark_border, color: Colors.white), onPressed: () {}),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('1,234 likes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: 'username ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'This is a cool post! #flutter #instagram'),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text('View all 5 comments', style: TextStyle(color: Colors.grey)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text('1 hour ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
