import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildLeagueHeader(),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildRankItem(
                    1,
                    "Sarah Jenkins",
                    "Level 24",
                    "2,840",
                    isTop: true,
                    color: const Color(0xFFFFD700),
                  ),
                  _buildRankItem(
                    2,
                    "Marcus Chen",
                    "Level 19",
                    "2,615",
                    isTop: true,
                    color: const Color(0xFFC0C0C0),
                  ),
                  _buildRankItem(
                    3,
                    "Elena Rodriguez",
                    "Level 21",
                    "2,490",
                    isTop: true,
                    color: const Color(0xFFCD7F32),
                  ),

                  // Người dùng hiện tại (Alex) có viền nổi bật
                  _buildRankItem(
                    4,
                    "Bbi (You)",
                    "Level 18",
                    "2,240",
                    isMe: true,
                  ),

                  _buildRankItem(5, "Jordan Smith", "", "2,100"),
                  _buildRankItem(6, "Yuki Tanaka", "", "1,980"),
                  _buildRankItem(7, "Leo Dupont", "", "1,850"),
                  _buildRankItem(8, "Sophia Kim", "", "1,720"),

                  const SizedBox(height: 20),
                  _buildPromotionBanner(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeagueHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.emoji_events, color: Color(0xFFBDBDBD), size: 48),
          ),
          SizedBox(height: 12),
          const Text(
            "Silver League",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_filled,
                  color: Color(0xFFFF8A65),
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  "ENDS IN: 2D 14H 45M",
                  style: TextStyle(
                    color: Color(0xFFFF8A65),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget cho từng dòng trong bảng xếp hạng
  Widget _buildRankItem(
    int rank,
    String name,
    String level,
    String xp, {
    bool isTop = false,
    Color? color,
    bool isMe = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isMe
              ? const Color(0xFFFF8A65)
              : Colors.black.withOpacity(0.05),
          width: isMe ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Text(
            "$rank",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isTop ? Colors.black : Colors.black26,
            ),
          ),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Color(0xFFF5F5F5),
            radius: 22,
            child: isTop
                ? Icon(Icons.stars, color: color)
                : const Icon(Icons.person, color: Colors.black12),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isMe ? Color(0xFFFF8A65) : Colors.black87,
                  ),
                ),
                if (level.isNotEmpty)
                  Text(
                    level,
                    style: TextStyle(fontSize: 12, color: Colors.black26),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                xp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "XP",
                style: TextStyle(
                  color: Color(0xFFFF8A65),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionBanner() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE0F2F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.trending_up, color: Color(0xFF00897B)),
          SizedBox(width: 8),
          Text(
            "Top 10 are promoted to Gold League",
            style: TextStyle(
              color: Color(0xFF00897B),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
