import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/news_article.dart';

class NewsRepository {
  final SupabaseClient? _supabaseClient;

  NewsRepository(this._supabaseClient);

  // Mock data for testing before Supabase is configured
  List<NewsArticle> _getMockNews() {
    final now = DateTime.now();
    return [
      NewsArticle(
        id: '1',
        titleZh: '韩国经济新闻',
        titleZhTw: '韓國經濟新聞',
        titleEn: 'Korean Economy News',
        summaryZh: '韩国经济最新动态和分析',
        summaryZhTw: '韓國經濟最新動態和分析',
        summaryEn: 'Latest updates and analysis on Korean economy',
        originalUrl: 'https://example.com/news/1',
        source: 'Korea Times',
        category: 'Economy',
        imageUrl: 'https://picsum.photos/seed/economy/400/300',
        publishedAt: now.subtract(const Duration(hours: 2)),
        createdAt: now.subtract(const Duration(hours: 2)),
      ),
      NewsArticle(
        id: '2',
        titleZh: 'K-pop 最新消息',
        titleZhTw: 'K-pop 最新消息',
        titleEn: 'Latest K-pop News',
        summaryZh: 'K-pop 明星和音乐行业的最新动态',
        summaryZhTw: 'K-pop 明星和音樂行業的最新動態',
        summaryEn: 'Latest updates from K-pop stars and music industry',
        originalUrl: 'https://example.com/news/2',
        source: 'Entertainment Weekly',
        category: 'Entertainment',
        imageUrl: 'https://picsum.photos/seed/kpop/400/300',
        publishedAt: now.subtract(const Duration(hours: 5)),
        createdAt: now.subtract(const Duration(hours: 5)),
      ),
      NewsArticle(
        id: '3',
        titleZh: '韩国社会新闻',
        titleZhTw: '韓國社會新聞',
        titleEn: 'Korean Society News',
        summaryZh: '韩国社会最新事件和趋势',
        summaryZhTw: '韓國社會最新事件和趨勢',
        summaryEn: 'Latest events and trends in Korean society',
        originalUrl: 'https://example.com/news/3',
        source: 'Korea Herald',
        category: 'Society',
        imageUrl: 'https://picsum.photos/seed/society/400/300',
        publishedAt: now.subtract(const Duration(days: 1)),
        createdAt: now.subtract(const Duration(days: 1)),
      ),
    ];
  }

  Future<List<NewsArticle>> fetchNews(String? category) async {
    // Return mock data if Supabase is not initialized
    if (_supabaseClient == null) {
      print('Supabase not initialized. Using mock data.');
      final mockNews = _getMockNews();
      if (category != null && category.isNotEmpty && category != 'All') {
        return mockNews.where((news) => news.category == category).toList();
      }
      return mockNews;
    }

    try {
      final queryBuilder = _supabaseClient!.from('news_articles').select();

      dynamic response;
      if (category != null && category.isNotEmpty && category != 'All') {
        response = await queryBuilder
            .eq('category', category)
            .order('created_at', ascending: false);
      } else {
        response = await queryBuilder.order('created_at', ascending: false);
      }

      if (response.isEmpty) {
        return [];
      }

      return (response as List)
          .map((data) => NewsArticle.fromJson(data as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Return mock data if Supabase query fails
      print('Supabase query failed. Using mock data: $e');
      final mockNews = _getMockNews();
      if (category != null && category.isNotEmpty && category != 'All') {
        return mockNews.where((news) => news.category == category).toList();
      }
      return mockNews;
    }
  }

  Future<NewsArticle> fetchNewsById(String id) async {
    // Return mock data if Supabase is not initialized
    if (_supabaseClient == null) {
      print('Supabase not initialized. Using mock data.');
      final mockNews = _getMockNews();
      return mockNews.firstWhere(
        (news) => news.id == id,
        orElse: () => mockNews.first,
      );
    }

    try {
      final response = await _supabaseClient!
          .from('news_articles')
          .select()
          .eq('id', id)
          .single();

      return NewsArticle.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      // Return mock data if Supabase query fails
      print('Supabase query failed. Using mock data: $e');
      final mockNews = _getMockNews();
      return mockNews.firstWhere(
        (news) => news.id == id,
        orElse: () => mockNews.first,
      );
    }
  }
}
