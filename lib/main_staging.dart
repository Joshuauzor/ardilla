import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gox/app/app.dart';
import 'package:gox/bootstrap.dart';
import 'package:gox/injections.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.staging');
  configureDependencies();
  await bootstrap(() => const App());
}
