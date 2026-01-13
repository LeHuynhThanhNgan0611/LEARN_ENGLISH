import 'package:flutter/material.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({super.key});

  @override
  State<StepThreePage> createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
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
              child: const Icon(Icons.celebration, color: Colors.amber),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildIllustrationCard(),
            SizedBox(height: 32),
            Text(
              "What is your current\nlevel?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "We'll tailor the curriculum to match your\nEnglish proficiency.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: levels.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final level = levels[index];
                  bool isSelected = selectedLevel == level['title'];
                  return _buildLevelItem(level, isSelected);
                },
              ),
            ),
            _buildContinueButton(),
            SizedBox(height: 30),
          ],
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
        SizedBox(width: 8),
        const Text(
          "STEP 3/3",
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFFFFEBEE),
            child: Icon(
              Icons.access_time_filled,
              size: 40,
              color: Color(0xFFFF8A65),
            ),
          ),
          SizedBox(height: 12),
          Text(
            "SET YOR PACE",
            style: TextStyle(
              color: Color(0xFFFF8A65),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelItem(Map<String, dynamic> level, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedLevel = level['title']),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF8A65) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: level['color'],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(level['icon'], color: level['iconColor']),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    level['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    level['subtitle'],
                    style: const TextStyle(color: Colors.black38, fontSize: 13),
                  ),
                ],
              ),
            ),
            // Radio button giả lập
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFFF8A65) : Colors.black12,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF8A65),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const StepTwoPage()),
          // );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFF8A65),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Countinue",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
