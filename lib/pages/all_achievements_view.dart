import 'package:flutter/material.dart';

class AllAchievementsView extends StatelessWidget {
  const AllAchievementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF42A5F5),
          ),
        ),
        title: Text(
          "All Achievements",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSummaryHeader(),
            SizedBox(height: 32),
            _buildAchievementsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "COMPLETED",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "8 ",
                      style: TextStyle(
                        color: Color(0xFFFF8A65),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "/ 24",
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          _buildMiniAvatars(),
        ],
      ),
    );
  }

  Widget _buildMiniAvatars() {
    return SizedBox(
      width: 100,
      height: 40,
      child: Stack(
        children: [
          _miniBadge(Colors.amber, Icons.stars, 0),
          _miniBadge(const Color(0xFF42A5F5), Icons.rocket_launch, 25),
          Positioned(
            left: 50,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Center(
                child: Text(
                  "+16",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniBadge(Color color, IconData icon, double left) {
    return Positioned(
      left: left,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }

  Widget _buildAchievementsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      childAspectRatio: 0.8,
      children: [
        _buildBadgeItem(
          "Early Bird",
          Icons.stars_rounded,
          Colors.orange,
          "Lvl. 3",
        ),
        _buildBadgeItem(
          "Fast Learner",
          Icons.rocket_launch_rounded,
          Colors.blue,
          "Lvl. 1",
        ),
        _buildBadgeItem(
          "On Fire",
          Icons.local_fire_department_rounded,
          Colors.teal,
          "Lvl. 2",
        ),
        _buildBadgeItem(
          "Vocab King",
          Icons.menu_book_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Perfect Week",
          Icons.calendar_month_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Socialite",
          Icons.groups_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Grand Master",
          Icons.emoji_events_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Native Echo",
          Icons.record_voice_over_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Mind Palace",
          Icons.psychology_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Top Ranker",
          Icons.workspace_premium_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "The Scribe",
          Icons.edit_note_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
        _buildBadgeItem(
          "Prestige",
          Icons.diamond_rounded,
          Colors.grey,
          "Locked",
          isLocked: true,
        ),
      ],
    );
  }

  Widget _buildBadgeItem(
    String title,
    IconData icon,
    Color color,
    String subtitle, {
    bool isLocked = false,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLocked ? Colors.black.withOpacity(0.03) : Colors.white,
            border: Border.all(
              color: isLocked ? Colors.transparent : color.withOpacity(0.5),
              width: 2,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, color: isLocked ? Colors.black12 : color, size: 35),
              if (isLocked)
                const Icon(Icons.lock_rounded, size: 20, color: Colors.black26),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2),
        Text(
          subtitle,
          style: TextStyle(
            color: isLocked ? Colors.black26 : Colors.black45,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
