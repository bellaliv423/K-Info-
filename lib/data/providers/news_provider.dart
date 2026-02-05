import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/news_article.dart';
import '../repositories/news_repository.dart';
import 'supabase_provider.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  try {
    final supabaseClient = ref.watch(supabaseClientProvider);
    return NewsRepository(supabaseClient);
  } catch (e) {
    // Create a dummy client for mock data
    return NewsRepository(null as dynamic);
  }
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);

// Provider for news feed filtered by category
final newsProvider = FutureProvider.family<List<NewsArticle>, String>(
  (ref, category) async {
    final newsRepository = ref.watch(newsRepositoryProvider);
    if (category == 'All') {
      return newsRepository.fetchNews(null);
    }
    return newsRepository.fetchNews(category);
  },
);

final newsDetailProvider = FutureProvider.family<NewsArticle, String>(
  (ref, id) async {
    final newsRepository = ref.watch(newsRepositoryProvider);
    return newsRepository.fetchNewsById(id);
  },
);
