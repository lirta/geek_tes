import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geek_garden/SplashPage.dart';
import 'package:geek_garden/home/home.dart';
import 'package:geek_garden/network/ApiProvider.dart';
import 'package:provider/provider.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => ApiProvider()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     routes: {
    //       '/': (context) => SplashPage(),
    //       '/products': (context) => HomeMain(),
    //     },
    //   ),
    // );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Geek Garden',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(color: Color(0xff333333))),
        home: HomeMain(),
      ),
    );
  }
}
