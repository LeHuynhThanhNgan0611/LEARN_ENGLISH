import 'package:flutter/material.dart';
import 'package:weather_app/pages/dashboard.dart';

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
      "title": "Casual",
      "subtitle": "5 mins / day",
      "icon": Icons.local_cafe_outlined,
      "color": Color(0xFFE1F5FE),
      "iconColor": Color(0xFF03A9F4),
    },
    {
      "title": "Regular",
      "subtitle": "10 mins / day",
      "icon": Icons.show_chart,
      "color": Color(0xFFFFF3E0),
      "iconColor": Color(0xFFFF7043),
    },
    {
      "title": "Serious",
      "subtitle": "20 mins / day",
      "icon": Icons.psychology_outlined,
      "color": Color(0xFFFFFDE7),
      "iconColor": Color(0xFFFFB300),
    },
    {
      "title": "Intense",
      "subtitle": "30 mins / day",
      "icon": Icons.local_fire_department_outlined,
      "color": Color(0xFFFFEBEE),
      "iconColor": Color(0xFFEF5350),
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
              "Set your daily goal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "How many minutes do you want to practice\nEnglish each day?",
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DashboardPage()),
            (route) => false,
          );
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
              "Finish",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.check_circle, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
