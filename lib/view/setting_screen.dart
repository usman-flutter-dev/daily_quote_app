import 'package:daily_quote_app/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(''),
                  Text(
                    'Settings',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.search, color: Color(0xFFF68A1D)),
                ],
              ),

              /// 1. Profile Section
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/15/5d/44/155d443821b50fddaecd10b51bb495f1.jpg',
                      ),
                      backgroundColor: Color(0xFFFFBFB8),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarah Josiah',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'sarahjos@gmail.com',
                          style: GoogleFonts.roboto(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    SettingsTile(
                      icon: Icons.person_add_alt_1,
                      title: 'Account',
                      subtitle: 'Security notifications, change email',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.emoji_events_outlined,
                      title: 'Challenges',
                      subtitle: 'Select difficulty levels',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    // Add Below
                    SettingsTile(
                      icon: Icons.person,
                      title: 'Avatar',
                      subtitle: 'Create, edit, profile photo',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.lock,
                      title: 'Privacy',
                      subtitle: 'Block authors',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.notifications_active,
                      title: 'Notifications',
                      subtitle: 'Daily check-in, quote of the day',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.download,
                      title: 'Storage and data',
                      subtitle: 'Network usage, auto-download',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.language,
                      title: 'App language',
                      subtitle: 'English (device’s langauge)',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.help_outline,
                      title: 'Help',
                      subtitle: 'Help centre, contact us, privacy policy',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
