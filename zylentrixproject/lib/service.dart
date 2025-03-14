

  import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zylentrixproject/model.dart';

class webservice{
 Future<List<PostModel>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
  }