import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sekawan_flutter/app/data/models/user.dart';
import 'package:sekawan_flutter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIST USER'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: FutureBuilder(
        future: controller.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('tidak ada data'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              User user = snapshot.data![index];
              return ListTile(
                onTap: () => Get.toNamed(Routes.DETAIL_USER, arguments: user),
                leading: SizedBox(
                  height: 100,
                  width: 60,
                  child: Image.network(
                    '${user.avatar}',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text('${user.email}'),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            },
          );
        },
      ),
    );
  }
}
