class TopikInfo {
  final String id;
  final String titleZh;
  final String titleZhTw;
  final String titleEn;
  final String? contentZh;
  final String? contentZhTw;
  final String? contentEn;
  final DateTime? examDate;
  final DateTime? registrationStart;
  final DateTime? registrationEnd;
  final String infoType; // schedule, level, resource
  final DateTime updatedAt;

  TopikInfo({
    required this.id,
    required this.titleZh,
    required this.titleZhTw,
    required this.titleEn,
    this.contentZh,
    this.contentZhTw,
    this.contentEn,
    this.examDate,
    this.registrationStart,
    this.registrationEnd,
    required this.infoType,
    required this.updatedAt,
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

  /// Get content based on locale
  /// locale format: 'zh', 'zh_TW', 'en'
  String? getContent(String locale) {
    switch (locale) {
      case 'zh':
        return contentZh;
      case 'zh_TW':
        return contentZhTw;
      case 'en':
        return contentEn;
      default:
        return contentEn;
    }
  }

  /// Create a copy of this TopikInfo with some fields replaced
  TopikInfo copyWith({
    String? id,
    String? titleZh,
    String? titleZhTw,
    String? titleEn,
    String? contentZh,
    String? contentZhTw,
    String? contentEn,
    DateTime? examDate,
    DateTime? registrationStart,
    DateTime? registrationEnd,
    String? infoType,
    DateTime? updatedAt,
  }) {
    return TopikInfo(
      id: id ?? this.id,
      titleZh: titleZh ?? this.titleZh,
      titleZhTw: titleZhTw ?? this.titleZhTw,
      titleEn: titleEn ?? this.titleEn,
      contentZh: contentZh ?? this.contentZh,
      contentZhTw: contentZhTw ?? this.contentZhTw,
      contentEn: contentEn ?? this.contentEn,
      examDate: examDate ?? this.examDate,
      registrationStart: registrationStart ?? this.registrationStart,
      registrationEnd: registrationEnd ?? this.registrationEnd,
      infoType: infoType ?? this.infoType,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Convert TopikInfo to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleZh': titleZh,
      'titleZhTw': titleZhTw,
      'titleEn': titleEn,
      'contentZh': contentZh,
      'contentZhTw': contentZhTw,
      'contentEn': contentEn,
      'examDate': examDate?.toIso8601String(),
      'registrationStart': registrationStart?.toIso8601String(),
      'registrationEnd': registrationEnd?.toIso8601String(),
      'infoType': infoType,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create TopikInfo from JSON
  factory TopikInfo.fromJson(Map<String, dynamic> json) {
    return TopikInfo(
      id: json['id'] as String,
      titleZh: json['titleZh'] as String,
      titleZhTw: json['titleZhTw'] as String,
      titleEn: json['titleEn'] as String,
      contentZh: json['contentZh'] as String?,
      contentZhTw: json['contentZhTw'] as String?,
      contentEn: json['contentEn'] as String?,
      examDate: json['examDate'] != null
          ? DateTime.parse(json['examDate'] as String)
          : null,
      registrationStart: json['registrationStart'] != null
          ? DateTime.parse(json['registrationStart'] as String)
          : null,
      registrationEnd: json['registrationEnd'] != null
          ? DateTime.parse(json['registrationEnd'] as String)
          : null,
      infoType: json['infoType'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  String toString() =>
      'TopikInfo(id: $id, titleZh: $titleZh, titleZhTw: $titleZhTw, titleEn: $titleEn, infoType: $infoType)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopikInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          titleZh == other.titleZh &&
          titleZhTw == other.titleZhTw &&
          titleEn == other.titleEn &&
          contentZh == other.contentZh &&
          contentZhTw == other.contentZhTw &&
          contentEn == other.contentEn &&
          examDate == other.examDate &&
          registrationStart == other.registrationStart &&
          registrationEnd == other.registrationEnd &&
          infoType == other.infoType &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      titleZh.hashCode ^
      titleZhTw.hashCode ^
      titleEn.hashCode ^
      contentZh.hashCode ^
      contentZhTw.hashCode ^
      contentEn.hashCode ^
      examDate.hashCode ^
      registrationStart.hashCode ^
      registrationEnd.hashCode ^
      infoType.hashCode ^
      updatedAt.hashCode;
}
