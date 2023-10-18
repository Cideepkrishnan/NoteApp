import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/view/notelist_screen/notelist_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => notelist_screen(
                title: '',
                description: '',
                date: '',
              ),
            )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Container(
            // height: 200,
            // width: 307,
            child: Lottie.asset("assets/lottie/animation_lnvrhyvv.json")),
            
      ),
    );
  }
}
