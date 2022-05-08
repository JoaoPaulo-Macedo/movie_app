import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/pages/theme.dart';

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.isEnabled,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isEnabled;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTextStyles.of(context);
    final enabledColor = Theme.of(context).primaryColor;
    const disabledColor = Colors.white;

    final enabledStyle = theme.drawerTile!.copyWith(color: enabledColor);
    final disabledStyle = theme.drawerTile!.copyWith(color: disabledColor);

    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isEnabled ? enabledColor : disabledColor,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: isEnabled ? enabledStyle : disabledStyle,
          ),
        ],
      ),
      onTap: () => onTap(),
    );
  }
}
