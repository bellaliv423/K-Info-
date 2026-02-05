import 'package:flutter/material.dart';
import 'package:k_info/l10n/app_localizations.dart';
import 'package:k_info/shared/widgets/guide_card.dart';
import 'package:k_info/features/guide/visa/visa_info_screen.dart';
// import 'package:k_info/features/guide/topik/topik_info_screen.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.guides,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visa Section
            Text(
              l10n.visaSection,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            GuideCard(
              title: l10n.visaInfo,
              subtitle: l10n.visaInfoDesc,
              icon: Icons.assignment,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VisaInfoScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            // TOPIK Section
            Text(
              l10n.topikSection,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            GuideCard(
              title: l10n.topikInfo,
              subtitle: l10n.topikInfoDesc,
              icon: Icons.school,
              onTap: () {
                // TODO: Implement TopikInfoScreen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TOPIK Info - Coming Soon')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
