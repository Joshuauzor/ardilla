import 'package:ardilla/app/view/app.dart';
import 'package:ardilla/bootstrap.dart';
import 'package:ardilla/core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.staging');
  configureDependencies();
  await bootstrap(() => const App());
}
