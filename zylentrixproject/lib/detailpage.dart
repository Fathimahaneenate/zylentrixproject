
import 'package:flutter/material.dart';
import 'package:zylentrixproject/colorwidget.dart';
import 'package:zylentrixproject/model.dart';

class PostDetailScreen extends StatelessWidget {
  final PostModel post;
  final Color initialColor;

  const PostDetailScreen({Key? key, required this.post, required this.initialColor})
      : super(key: key);

  // Helper function for text capitalization
  String capitalize(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RainbowColors.bgcolor,
      appBar: AppBar(
        backgroundColor: RainbowColors.bgcolor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,size: 20,)),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title of the post with the first letter capitalized
            Text(
              capitalize(post.title),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Post body with selected background color
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: initialColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))],
              ),
              child: Text(
                capitalize(post.body),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
