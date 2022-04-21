import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late AppDrawerController controller;

  @override
  void initState() {
    super.initState();

    controller = GetIt.instance.get<AppDrawerController>();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text('Your Name'),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Favorite Movies'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Align(
            child: ListTile(
              title: ElevatedButton(
                  onPressed: () => controller.logOut(context),
                  child: const Text('Log Out')),
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );
  }
}
