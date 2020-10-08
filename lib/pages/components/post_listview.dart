import 'dart:js';

import 'package:flutter/material.dart';
import 'package:rest_test/model/user.dart';

class ListViewData extends StatelessWidget {
  final List<NewsPost> posts;

  ListViewData(Key key, this.posts) : super(key: key);

  void _onTapItem(BuildContext context, NewsPost newsPost){
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(newsPost.id.toString()+' '+ newsPost.title)));
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.fromLTRB(.0, 5.0, .0, .0),
        itemBuilder: (context, position) {
          return Column(
            children: [
              Divider(
                height: 10.0,
              ),
              ListTile(
                onTap: () {
                  _onTapItem(context, posts[position]);
                },
                title: Text(
                  '${posts[position].title}',
                  style:
                      TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent),
                ),
                subtitle: Text(
                  '${posts[position].body}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    color: Colors.grey[850],
                  ),
                ),
                leading: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 28.0,
                      child: Text(
                        'User ${posts[position].userId}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
