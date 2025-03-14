
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zylentrixproject/detailpage.dart';
import 'dart:convert';
import 'package:zylentrixproject/model.dart';
import 'package:zylentrixproject/service.dart';
import 'colorwidget.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}
class _PostListScreenState extends State<PostListScreen> {
  late Future<List<PostModel>> _futurePosts;
  @override
  void initState() {
    super.initState();
    _futurePosts = webservice().fetchPosts(); // Call the webservice to fetch posts on initialization
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: RainbowColors.bgcolor,
      appBar: AppBar(
        backgroundColor: RainbowColors.bgcolor,
        surfaceTintColor: RainbowColors.bgcolor,
        title: Text('Post List',
            style: TextStyle(color: RainbowColors.textcolor, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _futurePosts,
        builder: (context, snapshot) {
           // Handling different states of the FutureBuilder
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts found'));
          }
            // Display the list of posts when data is available
          return ListView.separated(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailScreen(
                        post: snapshot.data![index],
                        initialColor: RainbowColors.rainbowColors[index % RainbowColors.rainbowColors.length], // Use RainbowColors here
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: RainbowColors.rainbowColors[index % RainbowColors.rainbowColors.length], 
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      snapshot.data![index].title.isNotEmpty
                          ? snapshot.data![index].title[0].toUpperCase() +
                              snapshot.data![index].title.substring(1)
                          : '',
                      style: TextStyle(
                          color: RainbowColors.textcolor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      snapshot.data![index].body.isNotEmpty
                          ? snapshot.data![index].body[0].toUpperCase() +
                              snapshot.data![index].body.substring(1)
                          : '',
                      style: TextStyle(color: RainbowColors.textcolor,
                    ),
                      maxLines: 2, // Limit the text to 3 lines
  overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              );
            },
          );
        },
      ),
    );
  }
}
