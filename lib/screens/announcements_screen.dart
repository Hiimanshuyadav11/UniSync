import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Announcements'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAnnouncementCard(
            'Lecture: Library Maintenance',
            'The library will be closed for maintenance from Dec 20-22. Please return all books before the closure.',
            '3 days ago',
            Icons.library_books,
          ),
          _buildAnnouncementCard(
            'Hackathon Challenge',
            'Join the annual coding hackathon. Registration opens on Dec 10. Showcase your skills and win exciting prizes!',
            '6 days ago',
            Icons.code,
          ),
          _buildAnnouncementCard(
            'AI Foundations Open',
            'New course on AI Foundations is now open for enrollment. Limited seats available.',
            '8 days ago',
            Icons.school,
          ),
          _buildAnnouncementCard(
            'Campus WiFi Upgrade',
            'Campus WiFi will be upgraded on Dec 18. Expect brief interruptions between 2-4 PM.',
            '10 days ago',
            Icons.wifi,
          ),
          _buildAnnouncementCard(
            'Parking Rules Update',
            'New parking rules effective from Dec 15. Please review the updated guidelines.',
            '12 days ago',
            Icons.local_parking,
          ),
          _buildAnnouncementCard(
            'Exam Schedule Released',
            'Final exam schedule for December semester has been released. Check your portal for details.',
            '15 days ago',
            Icons.assignment,
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(
    String title,
    String description,
    String timeAgo,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppTheme.primaryBlue,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 14,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      timeAgo,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
