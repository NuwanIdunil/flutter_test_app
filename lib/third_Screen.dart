import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  late MobileScannerController cameraController;
  bool isTorchEnabled = false;

  @override
  void initState() {
    super.initState();
    initializeCameraController() ;
  }

  void initializeCameraController() {
    cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: isTorchEnabled,
    );
  }


  void toggleTorch() {
    setState(() {
      isTorchEnabled = !isTorchEnabled;
      cameraController.toggleTorch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: const Color(0xFF707070), // Set border color
                  width: 1.0, // Set border width
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/LankaQR_Banner.png",
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(
                          color: const Color(0xFFC01621), // Set border color
                          width: 1.0, // Set border width
                        ),
                      ),
                      child: MobileScanner(
                          allowDuplicates: false,
                          controller: cameraController,
                          onDetect: (barcode, args) {
                            if (barcode.rawValue == null) {
                              debugPrint('Failed to scan Barcode');
                            } else {
                              final String code = barcode.rawValue!;
                              debugPrint('Barcode found! $code');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FourthScreen(code: code),
                                  ))
                                .then((_) {
                                  initializeCameraController();
                                });
                            }
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Background color of the container
                        borderRadius: BorderRadius.circular(5),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600,
                            spreadRadius: 1,
                            blurRadius: 4,
                          ),
                        ], // Border radius
                      ),
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () => toggleTorch(),
                        icon: Icon(
                          isTorchEnabled ? Icons.flash_off : Icons.flash_on,
                        ),
                        iconSize: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(children: [
                const Text(
                  "Place above Squre direct to the QR code",
                  style: TextStyle(
                    color: Color(0xFF201B51),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "You will be re directed to the results screen \n aulomatically",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF201B51),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Background color of the container
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
                        "Back to Dasbord",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF201B51),
                        ),
                      )),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
