import 'package:flutter/material.dart';
import '../models/challenge_models.dart'; // Import models for LeaderboardEntry

class LeaderboardScreen extends StatelessWidget {
  final List<LeaderboardEntry> leaderboard;

  LeaderboardScreen({required this.leaderboard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard")),
      body: ListView.builder(
        itemCount: leaderboard.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${index + 1}"),
            title: Text(leaderboard[index].username),
            trailing: Text("${leaderboard[index].progress}%"),
          );
        },
      ),
    );
  }
}
