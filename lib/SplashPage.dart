import 'package:flutter/material.dart';
import 'package:geek_garden/network/ApiProvider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ApiProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor1,
      body: Center(child: Text("welcome")),
    );
  }
}
