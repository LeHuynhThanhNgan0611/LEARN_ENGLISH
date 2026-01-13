import 'package:flutter/material.dart';

class StepTwoPage extends StatefulWidget {
  const StepTwoPage({super.key});

  @override
  State<StepTwoPage> createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  // Lưu trữ cấp độ được chọn (mặc định là Elementary)
  String selectedLevel = "Elementary";

  final List<Map<String, dynamic>> levels = [
    {
      "title": "Beginner",
      "subtitle": "I'm new to English",
      "icon": Icons.local_florist, // Icon mầm cây
      "color": Color(0xFFE0F7FA),
      "iconColor": Color(0xFF4DD0E1),
    },
    {
      "title": "Elementary",
      "subtitle": "I know basic phrases",
      "icon": Icons.chat_bubble,
      "color": Color(0xFFFFF3E0),
      "iconColor": Color(0xFFFF8A65),
    },
    {
      "title": "Intermediate",
      "subtitle": "I can have simple conversations",
      "icon": Icons.forum,
      "color": Color(0xFFFFFDE7),
      "iconColor": Color(0xFFFFB300),
    },
    {
      "title": "Advanced",
      "subtitle": "I want to perfect my fluency",
      "icon": Icons.auto_awesome, // Icon lấp lánh
      "color": Color(0xFFF3E5F5),
      "iconColor": Color(0xFF9575CD),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        ),
        centerTitle: true,
        title: _buildStepIndicator(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.orange.withOpacity(0.1),
              child: const Icon(Icons.bolt, color: Colors.amber),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0),
        child: Column(
          children: [SizedBox(height: 10), _buildIllustrationCard()],
        ),
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 6,
          decoration: BoxDecoration(
            color: Color(0xFFFFDCCF),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 30,
          height: 6,
          decoration: BoxDecoration(
            color: Color(0xFFFF8A65),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 8,
          height: 6,
          decoration: BoxDecoration(
            color: Color(0xFFFFDCCF),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        const Text(
          "STEP 2/3",
          style: TextStyle(
            color: Color(0xFFFF8A65),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildIllustrationCard() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Color(0xFF4FC3F7),
                  child: Icon(Icons.translate, size: 45, color: Colors.white),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: index == 1 ? 100 : 70,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Colors.red.shade100
                            : index == 1
                            ? Colors.blue.shade50
                            : Colors.yellow.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Row(
                children: [
                  Icon(Icons.trending_up, size: 14, color: Color(0xFFFF8A65)),
                  SizedBox(width: 14),
                  Text(
                    "Level Up",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFF8A65),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
