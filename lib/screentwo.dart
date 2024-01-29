// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for close button
import 'package:flutter_test_app/splash_screen.dart';
import 'package:flutter_test_app/third_Screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';
import 'errorscreen.dart';

class SecoundScreen extends StatefulWidget {
  const SecoundScreen({super.key});

  @override
  State<SecoundScreen> createState() => _SecoundScreenState();
}

class _SecoundScreenState extends State<SecoundScreen> {
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  Uint8List bytes = Uint8List(0);
  String? file;
  Future<void> _getimage() async {
    file = await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((picked) {
      if (picked == null) return null;
      return picked.path;
    });
    setState(() {
      imageXFile;
      file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Home_Screen.png"),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
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
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Use this Application to validate any lanka Qr codes \n easily,fast and accurately  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'SFProText-Semibold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 0.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const ScanQr()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/qrcodescan_120401.png",
                            height: 60.0,
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF201B51),
                                  fontFamily: "SF Pro",
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(text: 'SCAN '),
                                TextSpan(
                                  text: 'QR',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0)),
                                ),
                                TextSpan(text: ' CODE '),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Scan Qr Code From Gallery",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "SF Pro",
                    color: Color(0xFF201B51),
                  ),
                ),
              ),
              const Text(
                "Once uploard the Qr code to the App you will be \n redirected to the results Screen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: "SF Pro",
                  color: Color(0xFF201B51),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45.0, 20.0, 45.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => _getimage(),
                          child: Container(
                            height: 75,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Choose QR code",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFProText-Semibold',
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.file_upload_outlined),
                            iconSize: 35.0, // Size of the power icon
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // Color of the power icon

                            onPressed: () async {
                              try {
                                if (file == null) return;
                                await Permission.storage.request();
                                String barcode = await scanner.scanPath(file!);
                                print("barcode:$barcode");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FourthScreen(code: barcode),
                                    ));
                              } catch (e) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ErrorScreen(),
                                    ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "This application developed by DirectPay for devolopers \n merchants and communiunity version 1.0 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Positioned(
            left: 30,
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ], // Border radius
              ),
              child: IconButton(
                icon: const Icon(Icons.power_settings_new),
                iconSize: 35.0, // Size of the power icon
                color: const Color.fromARGB(
                    255, 0, 0, 0), // Color of the power icon

                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
