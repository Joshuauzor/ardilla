import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gox/app/app.dart';
import 'package:gox/bootstrap.dart';
import 'package:gox/injections.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.development');
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await bootstrap(
      () => DevicePreview(
        // ignore: avoid_redundant_argument_values
        enabled: !kReleaseMode,
        builder: (context) => const App(),
      ),
    );
  });
}
