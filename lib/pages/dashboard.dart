import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  // Hàm xử lý khi nhấn vào BottomNav
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      _buildHomeView(), // Trang chủ (nội dung bạn đang viết)
      const Center(
        child: Text("Vocabulary Page", style: TextStyle(fontSize: 24)),
      ), // Trang từ vựng
      const Center(child: Text("Ranking Page", style: TextStyle(fontSize: 24))),
      const Center(child: Text("Profile Page", style: TextStyle(fontSize: 24))),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F6),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHomeView() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 30),
            _buildDailyGoalCard(),
            const SizedBox(height: 24),
            _buildStatRow(),
            const SizedBox(height: 32),
            _buildSectionHeader("Your Lessons"),
            const SizedBox(height: 16),
            _buildLessonItem(
              title: "Basics 1",
              subtitle: "Master the essentials of English",
              progress: 0.8,
              color: Colors.orangeAccent,
              icon: Icons.menu_book,
            ),
            _buildLessonItem(
              title: "Food & Drink",
              subtitle: "Order like a local anywhere",
              progress: 0.3,
              color: Colors.tealAccent.shade700,
              icon: Icons.restaurant,
            ),
            _buildLessonItem(
              title: "Travel Essentials",
              subtitle: "Navigate the world with ease",
              progress: 0.0,
              color: Colors.grey,
              icon: Icons.explore,
              isLocked: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFFFCCBC),
              child: Icon(Icons.person_3, color: Colors.deepOrange),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning,",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                Text(
                  "Bbi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.local_fire_department, color: Colors.orange, size: 20),
              SizedBox(width: 4),
              Text("15", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailyGoalCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daily Goal",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Almost there! 85% of your target reached today.",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF8A65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Giữ cho nút không bị quá dài
                    children: [
                      Text(
                        "Resume Study",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.play_arrow, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: 0.85,
                  strokeWidth: 10,
                  backgroundColor: Colors.orange.withOpacity(0.1),
                  color: Color(0xFFFF8A65),
                ),
              ),
              Text(
                "85%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildStatItem(
            Icons.start,
            "1,240 XP",
            Colors.orange.shade50,
            Colors.orange,
          ),
          SizedBox(width: 12),
          _buildStatItem(
            Icons.emoji_events,
            "Silver League",
            Colors.teal.shade50,
            Colors.teal,
          ),
          SizedBox(width: 12),
          _buildStatItem(
            Icons.timer,
            "24 min left",
            Colors.red.shade50,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    IconData icon,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 18),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          "See All",
          style: TextStyle(
            color: Color(0xFFFF8A65),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLessonItem({
    required String title,
    required String subtitle,
    required double progress,
    required Color color,
    required IconData icon,
    bool isLocked = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLocked ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: isLocked
            ? Border.all(color: Colors.black12, style: BorderStyle.none)
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.black38, fontSize: 12),
                ),
                if (!isLocked) ...[
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.black12,
                    color: color,
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ],
            ),
          ),
          if (isLocked)
            Icon(Icons.lock, color: Colors.black26)
          else
            Text(
              "${(progress * 100).toInt()}%",
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFFFF8A65),
      unselectedItemColor: Colors.black26,
      showUnselectedLabels: true,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_rounded),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: "Vocabulary",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Ranking"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
