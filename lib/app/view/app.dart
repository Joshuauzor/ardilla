import 'package:flutter/material.dart';

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
                color: Color(0xFF7DC245),
              ),
              primarySwatch: const MaterialColor(
                0xff3A86FF,
                AppColors.colorScratch,
              ),
              primaryColor: const Color(0xFF7DC245),
              colorScheme: ColorScheme.fromSwatch(
                accentColor: const Color(0xFF7DC245),
              ),
            ),
            initialRoute: RouteName.splash,
          );
        },
      ),
    );
  }
}
