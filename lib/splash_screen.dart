import 'package:flutter/material.dart';
import 'dart:async';
import 'screentwo.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

startTimer(){
    Timer(const Duration(seconds: 5),() async{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SecoundScreen()));
    });
 
    }   
   @override
  void initState(){
    super.initState();
    startTimer();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
           width: MediaQuery.of(context).size.width ,
           height:MediaQuery.of(context).size.height,
           
           color:const Color(0xFF201B51),
           child:Column(
            children: [
              Image.asset("assets/Loading_Screen_Image.png",
                     height: MediaQuery.of(context).size.height * 0.73,
                     width: MediaQuery.of(context).size.width ,
                     fit: BoxFit.fill),
               
              Padding(
                padding: const EdgeInsets.only(top:5.0),
                child: Image.asset("assets/LankaQR_Logo.png",
                              height: 100.0,
                         ),
              ),
              const Text("Qr Code Validator",
              style:TextStyle(
                                fontSize:20,
                                fontFamily: 'SFProText-Semibold',
                                color: Colors.white,
                            ),),    

              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.015,),
                child: const Text("From",
                style:TextStyle(
                                  fontSize:15,
                                  fontFamily: 'SF Pro',
                                  color: Colors.white,
                                  
                              ),),
              ),  

             const Text("DirectPay",
              style:TextStyle(
                                fontSize:20,
                                fontFamily: 'Century Gothic',
                                fontWeight:FontWeight.bold,
                                color: Colors.white,
                            ),),                 
            ]),
      
        ),
      );
  }
}