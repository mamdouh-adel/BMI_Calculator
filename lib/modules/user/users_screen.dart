import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class UsersRepo {
  static List<UserModel> getUsers() {
    List<UserModel> users = [];
    users.add(UserModel(id: 1, name: "Ezz El-Din", phone: "+20123434344"));
    users.add(UserModel(id: 2, name: "Ezz ahmed", phone: "+20993434344"));
    users.add(UserModel(id: 3, name: "Ezz El-Mallah", phone: "+20122110344"));
    users.add(UserModel(id: 4, name: "Seif El-Din", phone: "+201111434344"));

    users.add(UserModel(id: 1, name: "Ezz El-Din", phone: "+20123434344"));
    users.add(UserModel(id: 2, name: "Ezz ahmed", phone: "+20993434344"));
    users.add(UserModel(id: 3, name: "Ezz El-Mallah", phone: "+20122110344"));
    users.add(UserModel(id: 4, name: "Seif El-Din", phone: "+201111434344"));

    users.add(UserModel(id: 1, name: "Ezz El-Din", phone: "+20123434344"));
    users.add(UserModel(id: 2, name: "Ezz ahmed", phone: "+20993434344"));
    users.add(UserModel(id: 3, name: "Ezz El-Mallah", phone: "+20122110344"));
    users.add(UserModel(id: 4, name: "Seif El-Din", phone: "+201111434344"));

    return users;
  }
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Users",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          )),
      body: _buildUsersItems(),
    );
  }

  Widget _buildUsersItems() {
    List<UserModel> users = UsersRepo.getUsers();

    return ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 26.0,
                    child: Text(
                      users[index].id.toString(),
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        users[index].name.toString(),
                        style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 0.5,
                      ),
                      Text(
                        users[index].phone.toString(),
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),
        ),
        separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[200],
            ),
        itemCount: users.length);
  }
}
