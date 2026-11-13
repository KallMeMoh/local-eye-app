import 'package:flutter/material.dart';

class FirstObservationPage extends StatelessWidget {
  const FirstObservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shield_outlined,
            size: 120,
            color: Color(0xFF1DE9B6),
          ),
          SizedBox(height: 40),
          
          Text(
            'Local Storage',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          
          Text(
            'Videos are saved and analyzed on the camera itself, without leaving to any external server.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          
        ],
      ),
    );
  }
}