import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../home/home.dart';

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
          child: FlareActor("assets/Thnx.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "loading"),
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
