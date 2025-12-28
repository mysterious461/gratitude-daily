import '../../core/app_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SectionHeader("Appearance"),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: AppSettings.themeMode,
            builder: (context, mode, _) {
              return SwitchListTile(
                title: const Text("Dark mode"),
                subtitle: const Text("Use dark theme"),
                value: mode == ThemeMode.dark,
                onChanged: (enabled) {
                  AppSettings.themeMode.value =
                      enabled ? ThemeMode.dark : ThemeMode.light;
                },
                secondary: const Icon(Icons.dark_mode),
              );
            },
          ),


          SizedBox(height: 16),
          _SectionHeader("Reminders"),
         ValueListenableBuilder<bool>(
          valueListenable: AppSettings.dailyReminderEnabled,
          builder: (context, enabled, _) {
            return SwitchListTile(
              title: const Text("Daily reminders"),
              subtitle: const Text("Get gentle reminders to practice gratitude"),
              value: enabled,
              onChanged: (value) {
                AppSettings.dailyReminderEnabled.value = value;
                // Notifications will be implemented later
              },
              secondary: const Icon(Icons.notifications_outlined),
            );
          },
        ),


          SizedBox(height: 16),
          _SectionHeader("Premium"),
          _SettingTile(
            icon: Icons.star,
            title: "Gratitude Daily Premium",
            subtitle: "Unlock all features and remove ads",
            isPremium: true,
          ),

          SizedBox(height: 16),
          _SectionHeader("Data & Privacy"),
          _SettingTile(
            icon: Icons.download_outlined,
            title: "Export journal",
            subtitle: "Save your entries as text or PDF",
          ),
          _SettingTile(
            icon: Icons.privacy_tip_outlined,
            title: "Privacy policy",
            subtitle: "Read how your data is handled",
          ),

          SizedBox(height: 16),
          _SectionHeader("About"),
          _SettingTile(
            icon: Icons.info_outline,
            title: "App version",
            subtitle: "Gratitude Daily v1.0.0",
          ),
        ],
      ),
    );
  }
}

/* ---------- Helper Widgets ---------- */

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isPremium;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isPremium = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isPremium ? Colors.amber : null,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Wire actions later (theme, reminders, premium, etc.)
        },
      ),
    );
  }
}
