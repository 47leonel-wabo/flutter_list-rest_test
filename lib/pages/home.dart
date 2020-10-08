import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rest_test/model/user.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_test/pages/components/post_listview.dart';

Future<List<NewsPost>> fetchData(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/posts');

  return compute(parsePosts, response.body);
}

List<NewsPost> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NewsPost>((json) => NewsPost.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<NewsPost>>(
        future: fetchData(http.Client()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListViewData(posts: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
