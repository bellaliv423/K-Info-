import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/news_article.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  final String locale;
  final VoidCallback? onTap;
  final bool isLoading;

  const NewsCard({
    Key? key,
    required this.article,
    required this.locale,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  /// Format time difference (e.g., "2 hours ago", "3 days ago")
  String _timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return locale == 'en' ? 'Just now' : '방금 전';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return locale == 'en'
          ? '$minutes minute${minutes > 1 ? 's' : ''} ago'
          : '$minutes분 전';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return locale == 'en'
          ? '$hours hour${hours > 1 ? 's' : ''} ago'
          : '${hours}시간 전';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return locale == 'en'
          ? '$days day${days > 1 ? 's' : ''} ago'
          : '$days일 전';
    } else {
      return locale == 'en'
          ? '${dateTime.month}/${dateTime.day}'
          : '${dateTime.month}월 ${dateTime.day}일';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: AppColors.card,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.border.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                // Image section
                if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: AppColors.grey200,
                        child: isLoading
                            ? _buildImageShimmer()
                            : Image.network(
                                article.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: AppColors.grey100,
                                    child: Center(
                                      child: Icon(
                                        Icons.image_not_supported_outlined,
                                        color: AppColors.grey400,
                                        size: 48,
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                      // Category badge
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            article.category,
                            style: const TextStyle(
                              color: AppColors.textOnSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: AppColors.grey100,
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.grey400,
                            size: 48,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              article.category,
                              style: const TextStyle(
                                color: AppColors.textOnSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                // Content section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        article.getTitle(locale),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Source and time
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              article.source,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _timeAgo(article.publishedAt),
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageShimmer() {
    return Container(
      color: AppColors.shimmerBase,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.shimmerBase,
                    AppColors.shimmerHighlight,
                    AppColors.shimmerBase,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
