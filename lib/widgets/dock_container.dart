import 'package:flutter/material.dart';

class DockContainer extends StatelessWidget {
  final double width;
  final List<Widget> children;

  const DockContainer({super.key, required this.width, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
