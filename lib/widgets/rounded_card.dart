import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;

  const RoundedCard({
    required this.child,
    this.color = const Color(0xFF1D1E33),
    this.borderRadius = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 15),
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      child: child,
    );
  }
}
