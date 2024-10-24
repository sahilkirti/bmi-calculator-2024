import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiMeter extends StatelessWidget {
  final double bmi;

  const BmiMeter({required this.bmi});

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;

    if (bmi < 18.5) {
      indicatorColor = Colors.blue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      indicatorColor = Colors.green;
    } else if (bmi >= 25 && bmi < 29.9) {
      indicatorColor = Colors.orange;
    } else {
      indicatorColor = Colors.red;
    }

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            'BMI Meter',
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: (bmi / 40).clamp(0.0, 1.0), // Normalized value for meter
            backgroundColor: Colors.white30,
            valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            minHeight: 15,
          ),
          SizedBox(height: 10),
          Text(
            'BMI: ${bmi.toStringAsFixed(1)}',
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
