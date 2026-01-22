import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/flashcard.dart';
import 'package:weather_app/pages/wordbank.dart';

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
            Expanded(
              child: _isFlashcards
                  ? const FlashcardsView() // Widget cũ của bạn
                  : const WordBankView(), // Widget mới từ file vừa tách
            ),
            const SizedBox(height: 20),
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
}
