import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, color: Colors.white, size: 50),
            SizedBox(height: 10),
            Text('Add a new post', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
