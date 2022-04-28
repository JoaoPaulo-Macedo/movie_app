import 'dart:developer' as dart;

import 'package:movie_app/core/utils/app_configs.dart';

enum DebugSource { remote, local, mock }

class Debug {
  static exception(dynamic e) {
    dart.log(e.toString(), name: 'Debug Exception');
  }

  static log(data, {String? path, String? description, bool response = false, DebugSource? debugSource}) {
    if (!AppConfigs.debug!) return;

    final String logData = data.toString();
    final int length = logData.length;
    String source;

    switch (debugSource) {
      case DebugSource.remote:
        source = 'Remote';
        break;
      case DebugSource.local:
        source = 'Local';
        break;
      case DebugSource.mock:
        source = 'Mock';
        break;
      default:
        source = 'Remote';
        break;
    }

    String name = source;
    response ? name += ' - Response' : null;
    if (description != null) name += ': $description';
    if (path != null) name += ': $path';

    dart.log(
      logData.substring(
        0,
        length < AppConfigs.debugMaxChars ? length : AppConfigs.debugMaxChars,
      ),
      name: name,
    );
  }
}
