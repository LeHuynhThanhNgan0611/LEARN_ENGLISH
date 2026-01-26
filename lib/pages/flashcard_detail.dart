import 'package:flutter/material.dart';

class FlashcardDetailView extends StatelessWidget {
  final String word;
  final String phonetic;

  const FlashcardDetailView({
    super.key,
    required this.word,
    required this.phonetic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.25,
                backgroundColor: Color(0xFFE0E0E0),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF8A65)),
                minHeight: 8,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "5 OF 20 WORDS",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.black54),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.style, size: 48, color: Color(0xFFBBDEFB)),
                  SizedBox(height: 24),
                  Text(
                    word,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    phonetic,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF42A5F5),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh),
                    label: const Text("Flip Card"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF3F0),
                      foregroundColor: const Color(0xFFFF8A65),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Text(
            "HOW HARD WAS THIS WORD?",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRatingButton(
                  "AGAIN",
                  Icons.history,
                  const Color(0xFFFFEBEE),
                  Colors.red,
                ),
                _buildRatingButton(
                  "HARD",
                  Icons.sentiment_dissatisfied,
                  const Color(0xFFFFF3E0),
                  Colors.orange,
                ),
                _buildRatingButton(
                  "GOOD",
                  Icons.sentiment_satisfied,
                  const Color(0xFFE8F5E9),
                  Colors.green,
                ),
                _buildRatingButton(
                  "EASY",
                  Icons.sentiment_very_satisfied,
                  const Color(0xFFE3F2FD),
                  Colors.blue,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildRatingButton(
    String label,
    IconData icon,
    Color bg,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 80,
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
