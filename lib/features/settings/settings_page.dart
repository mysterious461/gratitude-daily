import 'package:flutter/material.dart';
import '../../core/app_settings.dart';
import '../premium/premium_page.dart';
import '../premium/premium_manager.dart';

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
        children: [
          const _SectionHeader("Appearance"),

          // THEME TOGGLE (REAL)
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

          const SizedBox(height: 24),
          const _SectionHeader("Reminders"),

          // REMINDER PLACEHOLDER (SAFE)
          ValueListenableBuilder<bool>(
            valueListenable: AppSettings.dailyReminderEnabled,
            builder: (context, enabled, _) {
              return SwitchListTile(
                title: const Text("Daily reminders"),
                subtitle:
                    const Text("Get gentle reminders to practice gratitude"),
                value: enabled,
                onChanged: (value) {
                  AppSettings.dailyReminderEnabled.value = value;
                },
                secondary: const Icon(Icons.notifications_outlined),
              );
            },
          ),

          const SizedBox(height: 24),
          const _SectionHeader("Premium"),

          ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: const Text("Gratitude Daily Premium"),
            subtitle: const Text("Unlock all features and remove ads"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PremiumPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.restore),
            title: const Text("Restore purchases"),
            onTap: () {
              PremiumManager.restorePurchases();
            },
          ),

          const SizedBox(height: 24),
          const _SectionHeader("About"),

          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("App version"),
            subtitle: Text("Gratitude Daily v1.0.0"),
          ),
        ],
      ),
    );
  }
}

/* ---------- Helpers ---------- */

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
