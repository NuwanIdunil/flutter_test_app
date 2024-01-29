import 'package:flutter/material.dart';
import 'package:flutter_test_app/screentwo.dart';
import 'package:flutter_test_app/third_Screen.dart';
//import 'package:flutter_test_app/widgets/shadowbox.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FourthScreen extends StatefulWidget {
  final String code;
  const FourthScreen({Key? key, required this.code}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  List<Map<String, dynamic>> maps = [
    {'Tag': '58 Country Code', 'Value': 'Lk', 'length': 2, 'Type': 'valid'},
    {'Tag': 'Merchant Name', 'Value': 'KING WAY', 'length': 8, 'Type': 'valid'},
    {'Tag': 'Merchant City', 'Value': 'KADUWELA', 'length': 8, 'Type': 'valid'},
    {'Tag': 'Postal Code', 'Value': '', 'length': 0, 'Type': 'Invalid'},
    {'Tag': '62 SubTag', 'Value': 'SMART PAY', 'length': 8, 'Type': 'valid'},
  ];

  late final WebViewController controller;
  var loadingPercentage = 0;
  bool isError = false; // Flag to track if an error occurred

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
  ..loadRequest(Uri.parse('https://sandbox.directpay.lk/qr/validate/${widget.code}'));
  
  }


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
              child: loadingPercentage < 100?
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.white24,
                  child: const CircularProgressIndicator(color: Colors.red,)
                ),
              )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: WebViewWidget(
                        controller: controller,
                        
                      ),
                      
                    ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (c) => const SecoundScreen()));
                            },
                            icon: const Icon(
                              Icons.home,
                            ),
                            iconSize: 40,
                            color: const Color(0xFF707070),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScanQr()));

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
                        ],
                      ),
                    ),
                    const Text(
                      "This application developed by DirectPay for devolopers \n merchants and communiunity version 1.0 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
