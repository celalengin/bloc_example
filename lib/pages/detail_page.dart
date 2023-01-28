import 'package:flutter/material.dart';

import '../models/user_model.dart';

class DetailPage extends StatelessWidget {
  final UserModel user;

  const DetailPage({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(user.image)),
          const SizedBox(height: 48),
          DefaultTextStyle(
            style: TextStyle(
                fontSize: 19,
                color: Theme.of(context).textTheme.bodyText2!.color),
            child: Column(
              children: [
                Text(
                  user.username,
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email),
                Text(user.phone),
                Text(user.address.address),
                Text(user.address.city!),
                Text(user.address.state),
              ],
            ),
          ),
        ],
      ),
    );
  }
}