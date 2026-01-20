import 'package:flutter/material.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F6),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vocabulary",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildSearchBar(),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: _buildTabSwitcher(),
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: _buildFilterChips(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: TextField(
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
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF0EFEA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Flashcards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF8A65),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Word Bank",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Cho phép cuộn ngang
      clipBehavior: Clip.none, // Để không bị cắt bóng đổ (nếu có)
      child: Row(
        children: [
          _buildChip(
            Icons.star_rounded,
            "To Review (12)",
            const Color(0xFFFFEBE5),
            const Color(0xFFFF8A65),
            const Color.fromARGB(255, 250, 142, 109),
          ),
          const SizedBox(width: 12),
          _buildChip(
            Icons.check_circle,
            "Mastered (148)",
            const Color(0xFFE3F2FD),
            const Color(0xFF4FC3F7),
            const Color.fromARGB(255, 86, 201, 255),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    IconData icon,
    String label,
    Color bgColor,
    Color textColor,
    Color borderColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: textColor),
          SizedBox(width: 6),
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
}
