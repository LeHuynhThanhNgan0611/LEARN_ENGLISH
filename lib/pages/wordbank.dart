import 'package:flutter/material.dart';

class WordBankView extends StatelessWidget {
  const WordBankView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _buildSectionHeader("ADDED TODAY"),
        _buildWordBankItem(
          word: "Resilient",
          type: "ADJ.",
          definition: "Able to withstand or recover quickly from difficulties.",
          isStarred: false,
        ),
        _buildWordBankItem(
          word: "Advocate",
          type: "NOUN",
          definition:
              "A person who publicly supports or recommends a particular cause.",
          isStarred: true,
        ),

        const SizedBox(height: 24),

        _buildSectionHeader("YESTERDAY"),
        _buildWordBankItem(
          word: "Eloquence",
          type: "NOUN",
          definition: "Fluent or persuasive speaking or writing.",
          isStarred: false,
        ),
        _buildWordBankItem(
          word: "Meticulous",
          type: "ADJ.",
          definition:
              "Showing great attention to detail; very careful and precise.",
          isStarred: false,
        ),
        _buildWordBankItem(
          word: "Synchronicity",
          type: "NOUN",
          definition:
              "The simultaneous occurrence of events which appear related.",
          isStarred: false,
        ),
        const SizedBox(height: 80), // Khoảng trống cho FAB
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(width: 12),
          Expanded(child: Divider(color: Colors.black12, thickness: 1)),
        ],
      ),
    );
  }

  Widget _buildWordBankItem({
    required String word,
    required String type,
    required String definition,
    bool isStarred = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      word,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          color: Color(0xFF42A5F5),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  definition,
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            isStarred ? Icons.star_rounded : Icons.star_border_rounded,
            color: isStarred ? const Color(0xFFFF8A65) : Colors.black12,
            size: 28,
          ),
        ],
      ),
    );
  }
}
