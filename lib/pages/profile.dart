import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 60),
            _buildAvatarSection(),
            SizedBox(height: 32),
            _buildStatisticsSection(),
            SizedBox(height: 32),
            _buildAchievementsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFFF8A65),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 20),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          "Bbi",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 14,
              color: Colors.black26,
            ),
            SizedBox(width: 6),
            Text(
              "Joined March 2024",
              style: TextStyle(fontSize: 14, color: Colors.black26),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        _buildStatCard(
          icon: Icons.local_fire_department_rounded,
          iconColor: Colors.orange,
          label: "LONGEST STREAK",
          value: "24 Days",
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.sailing_rounded,
                iconColor: Colors.amber,
                label: "TOTAL XP",
                value: "12,450",
                isSmall: true,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.menu_book_rounded,
                iconColor: Colors.blue,
                label: "LESSONS",
                value: "142",
                isSmall: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    bool isSmall = false,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26,
                ),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (!isSmall) const Spacer(),
          if (!isSmall) const Icon(Icons.chevron_right, color: Colors.black12),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Achievements",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(color: Color(0xFF42A5F5)),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAchievementItem(
              "Early Bird",
              Icons.stars_rounded,
              Colors.orange,
              false,
            ),
            _buildAchievementItem(
              "Fast Learner",
              Icons.rocket_launch_rounded,
              Colors.blue,
              false,
            ),
            _buildAchievementItem(
              "Grand Master",
              Icons.emoji_events_rounded,
              Colors.grey,
              true,
            ),
            _buildAchievementItem(
              "Socialite",
              Icons.groups_rounded,
              Colors.grey,
              true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementItem(
    String title,
    IconData icon,
    Color color,
    bool isLocked,
  ) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLocked ? Colors.grey.shade50 : Colors.white,
            border: Border.all(
              color: isLocked ? Colors.black12 : color.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, color: isLocked ? Colors.black12 : color, size: 30),
              if (isLocked)
                const Icon(Icons.lock, size: 16, color: Colors.black26),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
