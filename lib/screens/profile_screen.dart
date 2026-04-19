import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../services/supabase_service.dart';
import 'campus_map_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.primaryBlue,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Himanshu Yadav',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'B.Tech Computer Science',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: 12345678',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Menu Items
            _buildMenuSection(
              'Account',
              [
                _buildMenuItem(
                  context,
                  Icons.person_outline,
                  'Personal Information',
                  () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.lock_outline,
                  'Privacy Settings',
                  () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.notifications_outlined,
                  'Notifications',
                  () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMenuSection(
              'Campus',
              [
                _buildMenuItem(
                  context,
                  Icons.map_outlined,
                  'Campus Map',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CampusMapScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  Icons.info_outline,
                  'About UniSync',
                  () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMenuSection(
              'Support',
              [
                _buildMenuItem(
                  context,
                  Icons.help_outline,
                  'Help & Support',
                  () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.feedback_outlined,
                  'Feedback',
                  () {},
                ),
                _buildMenuItem(
                  context,
                  Icons.logout,
                  'Logout',
                  () {
                    _showLogoutDialog(context);
                  },
                  isDestructive: true,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Container(
      color: AppTheme.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDestructive ? AppTheme.alertOrange : AppTheme.textSecondary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: isDestructive ? AppTheme.alertOrange : AppTheme.textPrimary,
                  fontWeight: isDestructive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppTheme.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: GoogleFonts.inter(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await SupabaseService.signOut();
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.alertOrange,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
