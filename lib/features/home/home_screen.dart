import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_info/l10n/app_localizations.dart';
import 'package:k_info/shared/widgets/news_card.dart';
import 'package:k_info/shared/widgets/loading_shimmer.dart';
import 'package:k_info/data/providers/news_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Economy', 'Entertainment', 'Society'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final newsAsync = ref.watch(newsProvider(_selectedCategory));
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 2,
      ),
      body: Column(
        children: [
          // Category Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  final isSelected = category == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      backgroundColor: Colors.transparent,
                      selectedColor: Theme.of(context).primaryColor.withOpacity(0.3),
                      side: BorderSide(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // News List
          Expanded(
            child: newsAsync.when(
              data: (newsList) {
                if (newsList.isEmpty) {
                  return Center(
                    child: Text(l10n.noNewsFound),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    ref.refresh(newsProvider(_selectedCategory));
                  },
                  child: ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        article: newsList[index],
                        locale: locale,
                        onTap: () {
                          // TODO: Navigate to news detail
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const ShimmerListBuilder(
                itemCount: 6,
                type: ShimmerType.newsCard,
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${l10n.errorLoading}: $error',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ref.refresh(newsProvider(_selectedCategory));
                      },
                      child: Text(l10n.retry),
                    ),
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
