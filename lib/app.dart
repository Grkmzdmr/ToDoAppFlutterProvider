import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_egitim/models/home_viewmodel.dart';
import 'package:provider_egitim/screens/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Material App",
        home: HomeView(),

      ),
    );
  }
}
