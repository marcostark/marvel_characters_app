import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          child: Container(
            color: Colors.red,
          ),
          // child: FlareActor("assets/trim.flr",
          //     alignment: Alignment.center,
          //     fit: BoxFit.contain,
          //     animation: "anime"),
          // child: Image.asset("assets/flutter.jpg"),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    });
  }
}
