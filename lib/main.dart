import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/domain/core/colors/colors.dart';
import 'package:netflix_app/domain/core/di/injectable.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';

Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(ctx) => getIt<DownloadsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          backgroundColor: Colors.black,
          primarySwatch:Colors.red,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),
          )
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}