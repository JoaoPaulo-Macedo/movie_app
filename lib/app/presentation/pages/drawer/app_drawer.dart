import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/drawer/components/app_drawer_tile.dart';
import 'package:movie_app/app/presentation/components/logo.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';
import 'package:movie_app/app/presentation/app_styles.dart';
import 'package:movie_app/app/presentation/routes_name.dart';

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
    controller.currentPage = ModalRoute.of(context)!.settings.name;
    
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
                    const Logo(height: 70),
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
                              style: AppTextStyles.of(context).large,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.accountDetails?.username ?? '',
                              style: AppTextStyles.of(context).caption,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              AppDrawerTile(
                title: 'Home',
                icon: Icons.home,
                isEnabled: controller.currentPage == Routes.initial,
                onTap: () {
                  bool navigate = controller.onTap(Routes.initial);

                  if (navigate) {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.initial, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              AppDrawerTile(
                title: 'Favorite Movies',
                icon: Icons.favorite,
                isEnabled: controller.currentPage == Routes.favorites,
                onTap: () {
                  bool navigate = controller.onTap(Routes.favorites);

                  if (navigate) {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.favorites, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              title: ElevatedButton(
                onPressed: () async {
                  await controller.logOut();

                  Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
                },
                child: const Text('Log Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
