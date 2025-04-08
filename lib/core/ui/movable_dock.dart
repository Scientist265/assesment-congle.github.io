import 'package:flutter/material.dart';

class MovableDockPage extends StatelessWidget {
  const MovableDockPage({super.key});
  static const String routeName = '/movable-dock';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('Movable Dock')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Container(width: screenWidth * 0.8)],
        ),
      ),
    );
  }
}
