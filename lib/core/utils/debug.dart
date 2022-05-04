import 'dart:developer' as dart;

import 'package:movie_app/core/utils/app_configs.dart';

class Debug {
  static exception(dynamic e, String name) {
    dart.log(e.toString(), name: name);
  }

  static description(String description) {
    if (!AppConfigs.i!.debug) return;

    dart.log(description, name: 'Description');
  }

  static log(
    data, {
    String? path,
    String? description,
  }) {
    if (!AppConfigs.i!.debug) return;

    final String logData = data.toString();
    final int length = logData.length;

    String name = 'Local';
    if (description != null) name += ': $description';
    if (path != null) name += ': $path';

    dart.log(
      logData.substring(
        0,
        length < AppConfigs.i!.debugMaxChars ? length : AppConfigs.i!.debugMaxChars,
      ),
      name: name,
    );
  }
}
