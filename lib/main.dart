import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/app.dart';

import 'core/network/local/hive_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  // HiveService().deleteHive();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
