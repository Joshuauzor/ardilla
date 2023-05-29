import 'package:ardilla/app/view/app.dart';
import 'package:ardilla/bootstrap.dart';
import 'package:ardilla/core/core.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.staging');
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await bootstrap(
      () => DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const App(),
      ),
    );
  });
}
