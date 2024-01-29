import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Shadowbox extends StatelessWidget {
  double? height;
  double?  width;
  Widget? widget;
  Shadowbox(
{ 
  this.height,
  this.width,
  this.widget,
}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: height,
                    width:  width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 1,
                          blurRadius: 6,
                        )
                      ],
                    ),
                    child:widget ,
                  );
  }
}