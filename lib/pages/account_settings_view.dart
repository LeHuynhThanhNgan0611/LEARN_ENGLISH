import 'package:flutter/material.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          "Account Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildSettingItem(
              icon: Icons.person_rounded,
              title: "Personal Information",
              iconBgColor: const Color(0xFFE3F2FD),
              iconColor: const Color(0xFF42A5F5),
            ),
            _buildSettingItem(
              icon: Icons.notifications_rounded,
              title: "Notification Preferences",
              iconBgColor: const Color(0xFFE3F2FD),
              iconColor: const Color(0xFF42A5F5),
            ),
            _buildSettingItem(
              icon: Icons.shield_rounded,
              title: "Privacy & Security",
              iconBgColor: const Color(0xFFE3F2FD),
              iconColor: const Color(0xFF42A5F5),
            ),
            _buildSettingItem(
              icon: Icons.language_rounded,
              title: "Language Settings",
              iconBgColor: const Color(0xFFE3F2FD),
              iconColor: const Color(0xFF42A5F5),
            ),
            _buildSettingItem(
              icon: Icons.stars_rounded,
              title: "Subscription Plan",
              iconBgColor: const Color(0xFFFFF3E0),
              iconColor: const Color(0xFFFFAB91),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFFFCCBC)),
                ),
                child: Text(
                  "Pro",
                  style: TextStyle(
                    color: Color(0xFFFF8A65),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            TextButton.icon(
              onPressed: () {
                // Xử lý đăng xuất
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
                size: 22,
              ),
              label: const Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "VERSION 2.4.0 (142)",
              style: TextStyle(
                color: Colors.black26,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required Color iconBgColor,
    required Color iconColor,
    Widget? trailing,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          if (trailing != null) trailing,
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.black12, size: 28),
        ],
      ),
    );
  }
}
