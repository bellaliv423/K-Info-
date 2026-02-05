import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class LoadingShimmer extends StatefulWidget {
  final Widget child;

  const LoadingShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.shimmerBase,
                AppColors.shimmerHighlight,
                AppColors.shimmerBase,
              ],
              stops: [
                _controller.value - 1,
                _controller.value,
                _controller.value + 1,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class NewsCardShimmer extends StatelessWidget {
  const NewsCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Image placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.shimmerBase,
            ),
            // Content placeholder
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title lines
                  Container(
                    height: 16,
                    color: AppColors.shimmerBase,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 16,
                    width: 200,
                    color: AppColors.shimmerBase,
                  ),
                  const SizedBox(height: 12),
                  // Source and time
                  Row(
                    children: [
                      Container(
                        height: 14,
                        width: 100,
                        color: AppColors.shimmerBase,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 14,
                        width: 80,
                        color: AppColors.shimmerBase,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideCardShimmer extends StatelessWidget {
  const GuideCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon placeholder
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.shimmerBase,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 16),
              // Title placeholder
              Container(
                height: 16,
                width: 150,
                color: AppColors.shimmerBase,
              ),
              const SizedBox(height: 8),
              // Subtitle placeholders
              Container(
                height: 14,
                color: AppColors.shimmerBase,
              ),
              const SizedBox(height: 6),
              Container(
                height: 14,
                width: 200,
                color: AppColors.shimmerBase,
              ),
              const SizedBox(height: 12),
              // Arrow placeholder
              Container(
                height: 18,
                width: 18,
                color: AppColors.shimmerBase,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerListBuilder extends StatelessWidget {
  final int itemCount;
  final ShimmerType type;

  const ShimmerListBuilder({
    Key? key,
    this.itemCount = 5,
    this.type = ShimmerType.newsCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        switch (type) {
          case ShimmerType.newsCard:
            return const NewsCardShimmer();
          case ShimmerType.guideCard:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const GuideCardShimmer(),
            );
          default:
            return const NewsCardShimmer();
        }
      },
    );
  }
}

enum ShimmerType {
  newsCard,
  guideCard,
}
