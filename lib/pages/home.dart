import 'package:flutter/material.dart';
import 'package:weather_app/pages/step2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lưu trữ id mục đang được chọn
  int selectedIndex = 1; // Mặc định chọn Career Growth

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Travel & Culture",
      "desc": "Explore the world with ease",
      "icon": Icons.flight_takeoff,
      "color": Colors.cyan,
    },
    {
      "title": "Career Growth",
      "desc": "Land your dream global job",
      "icon": Icons.business_center,
      "color": Colors.deepOrangeAccent,
    },
    {
      "title": "Exam Prep",
      "desc": "Ace IELTS or TOEFL",
      "icon": Icons.edit_note,
      "color": Colors.orangeAccent,
    },
    {
      "title": "Social Life",
      "desc": "Connect with new people",
      "icon": Icons.chat_bubble_outline,
      "color": Colors.deepPurpleAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.close, color: Colors.black),
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildHeaderCard(),
            SizedBox(height: 30),
            Text(
              "Ready to master\nEnglish?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Let's personalize your journey. What is\nyour primary goal for learning?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.85,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildGoalCard(index);
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
          width: 25,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFFFF8A65),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDCCF),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFFFFDCCF),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          "STEP 1/3",
          style: TextStyle(
            color: Color(0xFFFF8A65),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xFF4FC3F7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(Icons.school, size: 70, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildGoalCard(int index) {
    bool isSelected = selectedIndex == index;
    var category = categories[index];
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF8A65) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: category['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(category['icon'], color: category['color'], size: 30),
            ),
            SizedBox(height: 15),
            Text(
              category['title'],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              category['desc'],
              style: TextStyle(fontSize: 12, color: Colors.grey),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StepTwoPage()),
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
