import 'dart:convert';

import 'package:e_commerce/features/post/models/post_data_UI_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUIModel>> getPosts() async {
    var client = http.Client();
    List<PostDataUIModel> posts = [];
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for(int i=0; i<result.length; i++) {
        PostDataUIModel post = PostDataUIModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      print(posts);
    } catch (e) {
      print(e);
    }
    return posts;
  }


  static Future<bool> addPost() async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: {
          "title": "Devansh Prakash Dhopte",
          "body": "He is a flutter Developer, currently learning BloC State Management",
          "userId": "09",
        });

      if(response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}