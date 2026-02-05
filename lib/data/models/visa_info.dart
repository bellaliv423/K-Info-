class VisaInfo {
  final String id;
  final String visaType; // F-2, F-4, F-5, E-7
  final String titleZh;
  final String titleZhTw;
  final String titleEn;
  final String? descriptionZh;
  final String? descriptionZhTw;
  final String? descriptionEn;
  final Map<String, dynamic>? requirements;
  final Map<String, dynamic>? pointsInfo;
  final DateTime updatedAt;

  VisaInfo({
    required this.id,
    required this.visaType,
    required this.titleZh,
    required this.titleZhTw,
    required this.titleEn,
    this.descriptionZh,
    this.descriptionZhTw,
    this.descriptionEn,
    this.requirements,
    this.pointsInfo,
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

  /// Get description based on locale
  /// locale format: 'zh', 'zh_TW', 'en'
  String? getDescription(String locale) {
    switch (locale) {
      case 'zh':
        return descriptionZh;
      case 'zh_TW':
        return descriptionZhTw;
      case 'en':
        return descriptionEn;
      default:
        return descriptionEn;
    }
  }

  /// Create a copy of this VisaInfo with some fields replaced
  VisaInfo copyWith({
    String? id,
    String? visaType,
    String? titleZh,
    String? titleZhTw,
    String? titleEn,
    String? descriptionZh,
    String? descriptionZhTw,
    String? descriptionEn,
    Map<String, dynamic>? requirements,
    Map<String, dynamic>? pointsInfo,
    DateTime? updatedAt,
  }) {
    return VisaInfo(
      id: id ?? this.id,
      visaType: visaType ?? this.visaType,
      titleZh: titleZh ?? this.titleZh,
      titleZhTw: titleZhTw ?? this.titleZhTw,
      titleEn: titleEn ?? this.titleEn,
      descriptionZh: descriptionZh ?? this.descriptionZh,
      descriptionZhTw: descriptionZhTw ?? this.descriptionZhTw,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      requirements: requirements ?? this.requirements,
      pointsInfo: pointsInfo ?? this.pointsInfo,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Convert VisaInfo to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'visaType': visaType,
      'titleZh': titleZh,
      'titleZhTw': titleZhTw,
      'titleEn': titleEn,
      'descriptionZh': descriptionZh,
      'descriptionZhTw': descriptionZhTw,
      'descriptionEn': descriptionEn,
      'requirements': requirements,
      'pointsInfo': pointsInfo,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create VisaInfo from JSON
  factory VisaInfo.fromJson(Map<String, dynamic> json) {
    return VisaInfo(
      id: json['id'] as String,
      visaType: json['visaType'] as String,
      titleZh: json['titleZh'] as String,
      titleZhTw: json['titleZhTw'] as String,
      titleEn: json['titleEn'] as String,
      descriptionZh: json['descriptionZh'] as String?,
      descriptionZhTw: json['descriptionZhTw'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      requirements: json['requirements'] as Map<String, dynamic>?,
      pointsInfo: json['pointsInfo'] as Map<String, dynamic>?,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  String toString() =>
      'VisaInfo(id: $id, visaType: $visaType, titleZh: $titleZh, titleZhTw: $titleZhTw, titleEn: $titleEn)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisaInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          visaType == other.visaType &&
          titleZh == other.titleZh &&
          titleZhTw == other.titleZhTw &&
          titleEn == other.titleEn &&
          descriptionZh == other.descriptionZh &&
          descriptionZhTw == other.descriptionZhTw &&
          descriptionEn == other.descriptionEn &&
          requirements == other.requirements &&
          pointsInfo == other.pointsInfo &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      visaType.hashCode ^
      titleZh.hashCode ^
      titleZhTw.hashCode ^
      titleEn.hashCode ^
      descriptionZh.hashCode ^
      descriptionZhTw.hashCode ^
      descriptionEn.hashCode ^
      requirements.hashCode ^
      pointsInfo.hashCode ^
      updatedAt.hashCode;
}
