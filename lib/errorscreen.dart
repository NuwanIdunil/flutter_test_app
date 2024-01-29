import 'package:flutter/material.dart';
import 'package:flutter_test_app/screentwo.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFF201B51),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(children: [
                      Image.asset(
                        "assets/LankaQR_Logo.png",
                        height: 139.0,
                      ),
                      const Text(
                        "Qr Code Validator",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SFProText-Semibold',
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                )),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Column(
                  children: [
                    const Text(
                                  " Scan Result",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                    Padding(
                      padding: const EdgeInsets.only(top:40.0),
                      child: Container(
                                  
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF201B51),
                            width: 3.5, // You can adjust the border width
                          ),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 80,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:30.0),
                      child: Text(
                                    "Validation Failed",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFD84200),
                                    ),
                                  ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:20.0),
                      child: Text(
                                    " No data Found",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top:40.0),
                       child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Background color of the container
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade600,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ], // Border radius
                                ),
                                height: MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: const Center(
                                    child: Text(
                                  "Back to Scanner",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF201B51),
                                  ),
                                )),
                              ),
                            ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top:30.0),
                       child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => const SecoundScreen()));
                              },
                              icon: const Icon(
                                Icons.home,
                              ),
                              iconSize: 60,
                              color: const Color(0xFF707070),
                            ),
                     ),
                     const Padding(
                       padding: EdgeInsets.only(top:50.0),
                       child: Text(
                        "This application developed by DirectPay for devolopers \n merchants and communiunity version 1.0 ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                                         ),
                     ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
