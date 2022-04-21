import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/components/logo.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer_controller.dart';
import 'package:movie_app/core/utils/routes_name.dart';

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
    final theme = Theme.of(context);
    final enabledColor = theme.primaryColor;
    const disabledColor = Colors.white;

    final enabledStyle = theme.textTheme.subtitle1!.copyWith(
      color: enabledColor,
      fontWeight: FontWeight.w700,
    );
    final disabledStyle = theme.textTheme.subtitle1!.copyWith(color: disabledColor);

    final currentPage = ModalRoute.of(context)!.settings.name;

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
                              style: theme.textTheme.headline6,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.accountDetails?.username ?? '',
                              style: theme.textTheme.caption,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: 16,
                      color: currentPage == RoutesName.initial
                          ? enabledColor
                          : disabledColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Home',
                      style: currentPage == RoutesName.initial
                          ? enabledStyle
                          : disabledStyle,
                    ),
                  ],
                ),
                onTap: () {
                  if (currentPage == RoutesName.initial) {
                    Navigator.pop(context);
                  } else {
                    Navigator.popAndPushNamed(context, RoutesName.initial);
                  }
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      size: 16,
                      color: currentPage == RoutesName.favorites
                          ? enabledColor
                          : disabledColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Favorite Movies',
                      style: currentPage == RoutesName.favorites
                          ? enabledStyle
                          : disabledStyle,
                    ),
                  ],
                ),
                onTap: () {
                  if (currentPage == RoutesName.favorites) {
                    Navigator.pop(context);
                  } else {
                    Navigator.popAndPushNamed(context, RoutesName.favorites);
                  }
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
