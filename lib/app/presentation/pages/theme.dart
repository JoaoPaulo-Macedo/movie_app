import 'package:flutter/material.dart';

const double kCardBorderRadius = 5;
const double kListSpacing = 15;
const double kVerticalPadding = 15;
const double kHorizontalPadding = 20;
const EdgeInsets kAppPagePadding = EdgeInsets.symmetric(
  vertical: kVerticalPadding,
  horizontal: kHorizontalPadding,
);

class AppTextStyles {
  AppTextStyles._(this._context);
  final BuildContext? _context;

  factory AppTextStyles.of(BuildContext? context) {
    return AppTextStyles._(context);
  }

  TextTheme get _textTheme => Theme.of(_context!).textTheme;

  TextStyle? get listName =>
      _textTheme.titleSmall!.copyWith(fontSize: 17, fontWeight: FontWeight.normal);
  TextStyle? get movieName =>
      _textTheme.titleMedium!.copyWith(fontSize: 23, fontWeight: FontWeight.w600);
  TextStyle? get large =>
      _textTheme.titleLarge!.copyWith(fontSize: 25, fontWeight: FontWeight.normal);
  TextStyle? get drawerTile =>
      _textTheme.bodyLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.normal);
  TextStyle? get caption => _textTheme.caption;
}
