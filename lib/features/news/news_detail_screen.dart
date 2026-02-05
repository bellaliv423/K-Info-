import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_info/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:k_info/data/providers/news_provider.dart';

class NewsDetailScreen extends ConsumerWidget {
  final String newsId;

  const NewsDetailScreen({
    Key? key,
    required this.newsId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final newsAsync = ref.watch(newsDetailProvider(newsId));
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.newsDetail),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: newsAsync.when(
        data: (news) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // News Image
                if (news.imageUrl != null)
                  Image.network(
                    news.imageUrl!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        news.getTitle(locale),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      // Metadata
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            news.source,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                          Text(
                            '${news.publishedAt.year}-${news.publishedAt.month.toString().padLeft(2, '0')}-${news.publishedAt.day.toString().padLeft(2, '0')}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Summary
                      Text(
                        _getSummary(news, locale),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _launchUrl(news.originalUrl),
                              icon: const Icon(Icons.open_in_browser),
                              label: Text(l10n.viewOriginal),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            onPressed: () => _shareNews(news.getTitle(locale), news.originalUrl),
                            icon: const Icon(Icons.share),
                            label: Text(l10n.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${l10n.errorLoading}: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.refresh(newsDetailProvider(newsId));
                },
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getSummary(news, String locale) {
    switch (locale) {
      case 'zh':
        return news.summaryZh ?? news.summaryEn ?? '';
      case 'zh_TW':
        return news.summaryZhTw ?? news.summaryEn ?? '';
      case 'en':
      default:
        return news.summaryEn ?? '';
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _shareNews(String title, String url) async {
    await Share.share(
      '$title\n$url',
      subject: title,
    );
  }
}
