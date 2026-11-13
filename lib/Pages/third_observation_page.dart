import 'package:flutter/material.dart';

class ThirdObservationPage extends StatelessWidget {
  const ThirdObservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.person_outline_rounded, 
            size: 120,
            color: Color(0xFF1DE9B6),
          ),
          SizedBox(height: 40),
          
          Text(
            'You Are in Control',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          
          Text(
            'Choose which devices can view the stream or control the camera.',
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