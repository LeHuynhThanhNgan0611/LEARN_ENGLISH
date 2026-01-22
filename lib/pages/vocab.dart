import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  // Biến lưu trữ vị trí tab đang được chọn
  int _selectedIndex = 1; // Mặc định chọn tab VOCAB (vị trí số 1)
  bool _isFlashcards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Vocabulary",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tab Switcher (Flashcards / Word Bank)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildTabSwitcher(),
            ),

            const SizedBox(height: 24),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildFilterChips(),
            ),

            const SizedBox(height: 20),

            // Danh sách từ vựng
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildWordCard(
                    word: "Serendipity",
                    phonetic: "/ˌserənˈdipədē/",
                    definition:
                        "The occurrence of events by chance in a happy way.",
                    status: "REVIEW",
                    footerText: "Next review tomorrow",
                    footerLabel: "Last seen: 2 days ago",
                    isStarred: true,
                  ),
                  _buildWordCard(
                    word: "Ephemeral",
                    phonetic: "/əˈfem(ə)rəl/",
                    definition: "Lasting for a very short time.",
                    status: "MASTERED",
                    footerText: "Keep it up!",
                    footerLabel: "Accuracy: 98%",
                    isMastered: true,
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
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      // Nút Floating Action Button (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFF8A65),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.style, color: Colors.white, size: 28),
      ),
    );
  }
  // --- Các Widget phụ trợ khác ---

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.black26),
          hintText: "Search words...",
          hintStyle: TextStyle(color: Colors.black26),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl<bool>(
        backgroundColor: Color(0xFFF0EFEA),
        thumbColor: Colors.white,
        groupValue: _isFlashcards,
        padding: EdgeInsets.all(4),
        children: {
          true: _buildTabText("Flashcards", _isFlashcards),
          false: _buildTabText("Word Bank", !_isFlashcards),
        },
        onValueChanged: (value) {
          if (value != null) {
            setState(() => _isFlashcards = value);
          }
        },
      ),
    );
  }

  Widget _buildTabText(String text, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isActive ? const Color(0xFFFF8A65) : Colors.black45,
        ),
      ),
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
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.volume_down_rounded,
                    color: Color(0xFFBBDEFB),
                    size: 24,
                  ),
                ],
              ),
              Icon(
                isMastered ? Icons.check_circle : Icons.stars_rounded,
                color: isMastered ? Color(0xFF4DB6AC) : Color(0xFFFFAB91),
              ),
            ],
          ),
          Text(
            phonetic,
            style: const TextStyle(color: Color(0xFF64B5F6), fontSize: 14),
          ),
          SizedBox(height: 12),
          Text(
            definition,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              height: 1.4,
            ),
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          Divider(height: 24),
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
    );
  }
}
