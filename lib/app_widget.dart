import 'package:flutter/material.dart';
import 'package:pets_challenge/modules/home/controller/home_controller.dart';
import 'package:pets_challenge/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const HomePage(),
      ),
    );
  }
}
