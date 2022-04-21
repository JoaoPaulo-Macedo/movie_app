import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/components/logo.dart';
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
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Logo(height: 50),
                    const Spacer(),
                    Observer(
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.accountDetails == null
                                  ? 'Welcome!'
                                  : 'Welcome, ${controller.accountDetails?.name}!',
                              style: textTheme.headline6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.accountDetails?.username ?? '',
                              style: textTheme.caption,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
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
