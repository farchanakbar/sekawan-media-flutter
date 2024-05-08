import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sekawan_flutter/app/data/models/user.dart';
import '../controllers/detail_user_controller.dart';

class DetailUserView extends GetView<DetailUserController> {
  const DetailUserView({super.key});
  @override
  Widget build(BuildContext context) {
    User user = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getDetailUser(user.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            const Center(
              child: Text('tidak ada detail user'),
            );
          }

          var dataUser = snapshot.data;
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              CircleAvatar(
                radius: 60,
                child: ClipOval(
                  child: Image.network(
                    '${dataUser!.avatar}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${dataUser.firstName} ${dataUser.lastName}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${dataUser.email}',
                textAlign: TextAlign.center,
              )
            ],
          );
        },
      ),
    );
  }
}
