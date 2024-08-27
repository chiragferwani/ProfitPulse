import 'package:flutter/material.dart';
import 'package:profitpulse/home.dart';
import 'package:profitpulse/main.dart';
import 'package:profitpulse/navigation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Navigation()));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.width *.5,
            left: mq.width * .15,
            width: mq.width * .7,
            child: Image.asset('assets/images/logo.png')),
            //label
            Positioned(
              bottom: mq.height * .35,
              width: mq.width,
              child: Text('Profit Pulse', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'PoppinsBold',
                fontSize: 30
                ),
              )
              ),
              //label
            Positioned(
              bottom: mq.height * .31,
              width: mq.width,
              child: Text('Empowering Your Financial Decisions', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'PoppinsMedium',
                fontWeight: FontWeight.bold,
                fontSize: 18
                ),
              )
              )
            ],
            ),
    );
  }
}