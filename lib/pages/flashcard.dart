import 'package:flutter/material.dart';
import 'package:weather_app/pages/flashcard_detail.dart';

class FlashcardsView extends StatelessWidget {
  const FlashcardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _buildFilterChips(),
        const SizedBox(height: 20),
        _buildWordCard(
          word: "Serendipity",
          phonetic: "/ˌserənˈdipədē/",
          definition: "The occurrence of events by chance in a happy way.",
          status: "REVIEW",
          footerText: "Next review tomorrow",
          footerLabel: "Last seen: 2 days ago",
          isStarred: true,
          context: context,
        ),
        _buildWordCard(
          word: "Ephemeral",
          phonetic: "/əˈfem(ə)rəl/",
          definition: "Lasting for a very short time.",
          status: "MASTERED",
          footerText: "Keep it up!",
          footerLabel: "Accuracy: 98%",
          isMastered: true,
          context: context,
        ),
        _buildWordCard(
          word: "Ambiguous",
          phonetic: "/amˈbiɡyo͞oəs/",
          definition: "Open to more than one interpretation.",
          status: "REVIEW",
          footerText: "Critical",
          footerLabel: "Last seen: Just now",
          isStarred: true,
          isCritical: true,
          context: context,
        ),
        const SizedBox(height: 80), // Khoảng trống cho FAB
      ],
    );
  }

  Widget _buildFilterChips() {
    return Row(
      children: [
        _buildChip(
          Icons.star_rounded,
          "To Review (12)",
          const Color(0xFFFFEBE5),
          const Color(0xFFFF8A65),
        ),
        const SizedBox(width: 12),
        _buildChip(
          Icons.check_circle,
          "Mastered (148)",
          const Color(0xFFE3F2FD),
          const Color(0xFF4FC3F7),
        ),
      ],
    );
  }

  Widget _buildChip(
    IconData icon,
    String label,
    Color bgColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordCard({
    required BuildContext context,
    required String word,
    required String phonetic,
    required String definition,
    required String status,
    required String footerText,
    required String footerLabel,
    bool isStarred = false,
    bool isMastered = false,
    bool isCritical = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FlashcardDetailView(word: word, phonetic: phonetic),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      word,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.volume_down_rounded,
                      color: Color(0xFFBBDEFB),
                      size: 24,
                    ),
                  ],
                ),
                Icon(
                  isMastered ? Icons.check_circle : Icons.stars_rounded,
                  color: isMastered
                      ? const Color(0xFF4DB6AC)
                      : const Color(0xFFFFAB91),
                ),
              ],
            ),
            Text(
              phonetic,
              style: const TextStyle(color: Color(0xFF64B5F6), fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              definition,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isMastered
                      ? const Color(0xFFE0F2F1)
                      : const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isMastered
                        ? const Color(0xFF00897B)
                        : const Color(0xFFF4511E),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  footerLabel,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                ),
                Text(
                  footerText,
                  style: TextStyle(
                    color: isCritical ? Colors.red : const Color(0xFFFF8A65),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
