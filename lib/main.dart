import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'LayoutsandWigtes.dart';

void main() {
  runApp(
      ScreenUtilInit(
        designSize: Size(375, 812), // Set your base design size
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          home: MyApp(),
        ),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Layoutsandwigtes() ));
            }, child: Text('BSNL Screen',style: TextStyle(fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}
