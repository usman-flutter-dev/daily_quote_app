import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFF68A1D), size: 28),
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      onTap: onTap,
    );
  }
}
