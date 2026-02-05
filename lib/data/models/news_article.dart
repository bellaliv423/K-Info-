class NewsArticle {
  final String id;
  final String titleZh;
  final String titleZhTw;
  final String titleEn;
  final String? summaryZh;
  final String? summaryZhTw;
  final String? summaryEn;
  final String originalUrl;
  final String source;
  final String category; // economy, entertainment, society
  final String? imageUrl;
  final DateTime publishedAt;
  final DateTime createdAt;

  NewsArticle({
    required this.id,
    required this.titleZh,
    required this.titleZhTw,
    required this.titleEn,
    this.summaryZh,
    this.summaryZhTw,
    this.summaryEn,
    required this.originalUrl,
    required this.source,
    required this.category,
    this.imageUrl,
    required this.publishedAt,
    required this.createdAt,
  });

  /// Get title based on locale
  /// locale format: 'zh', 'zh_TW', 'en'
  String getTitle(String locale) {
    switch (locale) {
      case 'zh':
        return titleZh;
      case 'zh_TW':
        return titleZhTw;
      case 'en':
        return titleEn;
      default:
        return titleEn;
    }
  }

  /// Create a copy of this NewsArticle with some fields replaced
  NewsArticle copyWith({
    String? id,
    String? titleZh,
    String? titleZhTw,
    String? titleEn,
    String? summaryZh,
    String? summaryZhTw,
    String? summaryEn,
    String? originalUrl,
    String? source,
    String? category,
    String? imageUrl,
    DateTime? publishedAt,
    DateTime? createdAt,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      titleZh: titleZh ?? this.titleZh,
      titleZhTw: titleZhTw ?? this.titleZhTw,
      titleEn: titleEn ?? this.titleEn,
      summaryZh: summaryZh ?? this.summaryZh,
      summaryZhTw: summaryZhTw ?? this.summaryZhTw,
      summaryEn: summaryEn ?? this.summaryEn,
      originalUrl: originalUrl ?? this.originalUrl,
      source: source ?? this.source,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Convert NewsArticle to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleZh': titleZh,
      'titleZhTw': titleZhTw,
      'titleEn': titleEn,
      'summaryZh': summaryZh,
      'summaryZhTw': summaryZhTw,
      'summaryEn': summaryEn,
      'originalUrl': originalUrl,
      'source': source,
      'category': category,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Create NewsArticle from JSON
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] as String,
      titleZh: json['titleZh'] as String,
      titleZhTw: json['titleZhTw'] as String,
      titleEn: json['titleEn'] as String,
      summaryZh: json['summaryZh'] as String?,
      summaryZhTw: json['summaryZhTw'] as String?,
      summaryEn: json['summaryEn'] as String?,
      originalUrl: json['originalUrl'] as String,
      source: json['source'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  @override
  String toString() =>
      'NewsArticle(id: $id, titleZh: $titleZh, titleZhTw: $titleZhTw, titleEn: $titleEn, source: $source, category: $category)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsArticle &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          titleZh == other.titleZh &&
          titleZhTw == other.titleZhTw &&
          titleEn == other.titleEn &&
          summaryZh == other.summaryZh &&
          summaryZhTw == other.summaryZhTw &&
          summaryEn == other.summaryEn &&
          originalUrl == other.originalUrl &&
          source == other.source &&
          category == other.category &&
          imageUrl == other.imageUrl &&
          publishedAt == other.publishedAt &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      titleZh.hashCode ^
      titleZhTw.hashCode ^
      titleEn.hashCode ^
      summaryZh.hashCode ^
      summaryZhTw.hashCode ^
      summaryEn.hashCode ^
      originalUrl.hashCode ^
      source.hashCode ^
      category.hashCode ^
      imageUrl.hashCode ^
      publishedAt.hashCode ^
      createdAt.hashCode;
}
