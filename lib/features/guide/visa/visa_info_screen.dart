import 'package:flutter/material.dart';
import 'package:k_info/l10n/app_localizations.dart';

class VisaInfoScreen extends StatefulWidget {
  const VisaInfoScreen({Key? key}) : super(key: key);

  @override
  State<VisaInfoScreen> createState() => _VisaInfoScreenState();
}

class _VisaInfoScreenState extends State<VisaInfoScreen> {
  int? _expandedIndex;

  final List<Map<String, dynamic>> visaTypes = [
    {
      'type': 'F-2',
      'name': 'Long-term Residence Visa',
      'description': 'For foreign investors, skilled workers, and others seeking long-term residence.',
      'requirements': [
        'Minimum investment amount (varies)',
        'Health certificate',
        'Criminal record check',
        'Proof of financial stability',
      ],
    },
    {
      'type': 'F-4',
      'name': 'Overseas Korean Visa',
      'description': 'For overseas Koreans and their families.',
      'requirements': [
        'Proof of Korean ancestry',
        'Marriage certificate (if applicable)',
        'Health certificate',
        'Criminal record check',
      ],
    },
    {
      'type': 'F-5',
      'name': 'Permanent Residence Visa',
      'description': 'For individuals seeking permanent resident status.',
      'requirements': [
        'F-2 visa holders with 5+ years residence',
        'Or significant investment in Korea',
        'Health certificate',
        'Criminal record check',
        'Proof of stable income',
      ],
    },
    {
      'type': 'E-7',
      'name': 'Specially Occupation Visa',
      'description': 'For highly skilled professionals and experts.',
      'requirements': [
        'University degree or equivalent qualification',
        'Relevant work experience',
        'Job offer from Korean company',
        'Health certificate',
        'Criminal record check',
      ],
    },
    {
      'type': 'D-10',
      'name': 'Job Seeker Visa',
      'description': 'For foreigners seeking employment in Korea.',
      'requirements': [
        'Passport valid for 6+ months',
        'University degree or equivalent',
        'Health certificate',
        'Criminal record check',
        'Financial support proof',
      ],
    },
    {
      'type': 'D-2',
      'name': 'Student Visa',
      'description': 'For students pursuing education in Korea.',
      'requirements': [
        'Acceptance from Korean educational institution',
        'Proof of financial ability',
        'Health certificate',
        'Criminal record check',
        'Academic credentials',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.visaInfo),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: visaTypes.length,
        itemBuilder: (context, index) {
          final visa = visaTypes[index];
          final isExpanded = _expandedIndex == index;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              title: Text(
                visa['type'] as String,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(visa['name'] as String),
              onExpansionChanged: (expanded) {
                setState(() {
                  _expandedIndex = expanded ? index : null;
                });
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        visa['description'] as String,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.requirements,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      ...(visa['requirements'] as List<String>).map((requirement) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Expanded(
                                child: Text(
                                  requirement,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
