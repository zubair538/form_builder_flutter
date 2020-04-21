import 'package:flutter/material.dart';

import 'user_model.dart';

class SecondActivity extends StatelessWidget {
  User user;

  SecondActivity(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Activity'),),
     body:  body(),
    );

  }

  Widget body() {
   return   Column(children: <Widget>[
      Text(user.first_name),
      Text(user.email),
      Text(user.accept_terms),
      Text(user.language),
      Text(user.rate),
      Text(user.choice),
      Text(user.filter),

    ],);
  }
}
