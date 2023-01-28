import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_blocs.dart';
import '../blocs/app_events.dart';
import '../blocs/app_states.dart';
import '../models/user_model.dart';
import '../repos/repositories.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(UserLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("api bloc exmple"),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            print("loading");
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            print("loaded");
            List<UserModel> userList = state.users;

            return buildUsers(userList);
          }

          if (state is UserErrorState) {
            print("error");
            String error = state.error;
            return Center(
              child: Text(error),
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget buildUsers(List<UserModel> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                          user: user,
                        )));
              },
              child: Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(user.image)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(user.university),
                        Text(user.email),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}