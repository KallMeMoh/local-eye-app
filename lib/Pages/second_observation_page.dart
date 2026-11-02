import 'package:flutter/material.dart';

class SecondObservationPage extends StatelessWidget {
  const SecondObservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.notifications_none_rounded, 
            size: 120,
            color: Color(0xFF1DE9B6),
          ),
          SizedBox(height: 40),
          
          Text(
            'Smart Alerts',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          
          Text(
            'The camera detects any unusual changes between frames and sends you an instant notification.',
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