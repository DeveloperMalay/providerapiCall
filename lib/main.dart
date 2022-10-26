import 'package:catapp/provider/cat_details_provider.dart';
import 'package:catapp/view/cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatDetailsProider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CatScreen()),
    );

    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => CatDetailsProvider(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: const CatScreen()),
    // );
  }
}
