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
        child: Column(children: [_buildSummaryHeader()]),
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
                      text: "8",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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
}
