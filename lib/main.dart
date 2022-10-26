import 'dart:async';

import 'package:catapp/data/model/cat_model.dart';
import 'package:catapp/data/repository/get_cat_details_repo.dart';
import 'package:catapp/provider/cat_details_provider.dart';
import 'package:catapp/view/cat_screen.dart';
import 'package:flutter/cupertino.dart';
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
          home: const SplashScreen()),
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatDetailsProider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Welcome to Our Cat app',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/catimg.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                    color: Colors.blue,
                    child: const Text('Click to see Cats'),
                    onPressed: () async {
                      List<Cat> data = await getcatDetails();
                      provider.updateDataModel(data);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const CatScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero)
                                  .animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
