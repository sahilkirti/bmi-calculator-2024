import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionGuide extends StatelessWidget {
  final double bmi;
  final String
      goal; // This can be "Gain Weight", "Lose Weight", or "Maintain Weight"

  const NutritionGuide({required this.bmi, required this.goal});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> nutritionPlan = _getNutritionPlan(bmi, goal);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nutrition Recommendations for ${goal.toUpperCase()}',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Macronutrient Breakdown',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Carbohydrates: ${nutritionPlan['carbs']}%',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
            Text(
              'Proteins: ${nutritionPlan['proteins']}%',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
            Text(
              'Fats: ${nutritionPlan['fats']}%',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Meal Tips',
              style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              nutritionPlan['mealTips'],
              style: GoogleFonts.lato(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF0A0E21),
    );
  }

  Map<String, dynamic> _getNutritionPlan(double bmi, String goal) {
    if (goal == 'Gain Weight') {
      return {
        'carbs': 50,
        'proteins': 25,
        'fats': 25,
        'mealTips':
            'Focus on calorie-dense foods like nuts, seeds, and healthy fats. Include lean protein sources and whole grains to aid muscle growth.',
      };
    } else if (goal == 'Lose Weight') {
      return {
        'carbs': 40,
        'proteins': 40,
        'fats': 20,
        'mealTips':
            'Prioritize high-protein foods, leafy greens, and complex carbs. Avoid sugary drinks and processed snacks. Hydrate well!',
      };
    } else {
      // Maintain Weight
      return {
        'carbs': 45,
        'proteins': 30,
        'fats': 25,
        'mealTips':
            'Maintain a balanced diet with lean proteins, whole grains, and a variety of fruits and vegetables. Practice portion control.',
      };
    }
  }
}
