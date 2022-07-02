import 'datum.dart';

class CategoryModel {
  List<CategoryData>? data;
  int? total;

  CategoryModel({this.data, this.total});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}
