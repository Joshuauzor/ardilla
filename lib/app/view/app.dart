import 'package:ardilla/core/core.dart';
import 'package:ardilla/features/authentication/presentation/cubit/ardilla_user_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ArdillaUserBloc>(
          create: (context) => ArdillaUserBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            onGenerateRoute: generateRoute,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: AppColors.primaryBg,
              ),
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.fromSwatch(
                accentColor: AppColors.primaryColor,
              ),
            ),
            initialRoute: RouteName.splash,
          );
        },
      ),
    );
  }
}
