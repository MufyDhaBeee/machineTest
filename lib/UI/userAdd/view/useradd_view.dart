import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/UI/userAdd/view/useradd_more.dart';
import 'package:machine_test/UI/userAdd/view/useradd_view.dart';
import 'package:machine_test/res/image.dart';

class UserAddView extends StatelessWidget {
  const UserAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Add',
          style: TextStyle(color: Colors.white, fontSize: 13.0),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: AddUser(userId: '_id', name: 'name', email: 'email', address: 'address',),
    );
  }
}
