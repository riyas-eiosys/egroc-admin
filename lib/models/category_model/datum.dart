class CategoryData {
  int? id;
  bool? enabled;
  bool? displayInFooter;
  String? name;
  String? slug;
  String? icon;
  String? image;
  String? description;
  int? priority;
  bool? featured;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? createdBy;
  DateTime? createdTimestamp;
  dynamic updatedBy;
  DateTime? updatedTimestamp;

  CategoryData({
    this.id,
    this.enabled,
    this.displayInFooter,
    this.name,
    this.slug,
    this.icon,
    this.image,
    this.description,
    this.priority,
    this.featured,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.createdBy,
    this.createdTimestamp,
    this.updatedBy,
    this.updatedTimestamp,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] as int?,
      enabled: json['enabled'] as bool?,
      displayInFooter: json['displayInFooter'] as bool?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      icon: json['icon'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      priority: json['priority'] as int?,
      featured: json['featured'] as bool?,
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeywords: json['metaKeywords'] as String?,
      createdBy: json['createdBy'] as int?,
      createdTimestamp: json['createdTimestamp'] == null
          ? null
          : DateTime.parse(json['createdTimestamp'] as String),
      updatedBy: json['updatedBy'] as dynamic,
      updatedTimestamp: json['updatedTimestamp'] == null
          ? null
          : DateTime.parse(json['updatedTimestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'enabled': enabled,
      'displayInFooter': displayInFooter,
      'name': name,
      'slug': slug,
      'icon': icon,
      'image': image,
      'description': description,
      'priority': priority,
      'featured': featured,
      'metaTitle': metaTitle,
      'metaDescription': metaDescription,
      'metaKeywords': metaKeywords,
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp?.toIso8601String(),
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp?.toIso8601String(),
    };
  }
}
