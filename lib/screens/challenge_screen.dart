import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/challenge_models.dart'; // Import the models
import 'leaderboard_screen.dart'; // Import the leaderboard screen

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  Challenge currentChallenge = Challenge(
    title: "30-Day Fitness Challenge",
    description: "Complete daily exercises for 30 days to improve fitness.",
    totalDays: 30,
    completedDays: 0,
  );

  List<ChallengeBadge> badges = [
    ChallengeBadge(
        name: "Starter", description: "Complete 5 days", requiredDays: 5),
    ChallengeBadge(
        name: "Achiever", description: "Complete 15 days", requiredDays: 15),
    ChallengeBadge(
        name: "Champion", description: "Complete 30 days", requiredDays: 30),
  ];

  List<LeaderboardEntry> leaderboard = [
    LeaderboardEntry(username: "User1", progress: 75),
    LeaderboardEntry(username: "User2", progress: 60),
    LeaderboardEntry(username: "You", progress: 40),
  ];

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  // Load progress from SharedPreferences
  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentChallenge.completedDays = prefs.getInt('completedDays') ?? 0;
    });
  }

  // Save progress to SharedPreferences
  Future<void> _saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('completedDays', currentChallenge.completedDays);
  }

  // Update progress
  void updateProgress() {
    if (currentChallenge.completedDays < currentChallenge.totalDays) {
      setState(() {
        currentChallenge.completedDays++;
      });
      _saveProgress(); // Save progress whenever updated
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        currentChallenge.completedDays / currentChallenge.totalDays;

    return Scaffold(
      appBar: AppBar(title: Text("Challenge Mode")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(currentChallenge.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(currentChallenge.description,
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.blueAccent,
            ),
            Text("${(progress * 100).toStringAsFixed(0)}% Completed",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateProgress,
              child: Text("Mark Today's Progress"),
            ),
            SizedBox(height: 20),
            _buildBadgeSection(),
            SizedBox(height: 20),
            _buildLeaderboardButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Achievements",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: badges.map((badge) {
            bool isEarned =
                currentChallenge.completedDays >= badge.requiredDays;
            return Column(
              children: [
                Icon(isEarned ? Icons.emoji_events : Icons.lock,
                    color: isEarned ? Colors.orange : Colors.grey),
                Text(badge.name),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLeaderboardButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LeaderboardScreen(leaderboard: leaderboard)),
        );
      },
      child: Text("View Leaderboard"),
    );
  }
}
