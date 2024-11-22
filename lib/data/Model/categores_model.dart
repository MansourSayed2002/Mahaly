class CategoresModel {
  int? categoryId;
  String? categoryName;
  int? categoryOwner;

  CategoresModel({this.categoryId, this.categoryName, this.categoryOwner});

  CategoresModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryOwner = json['category_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_owner'] = categoryOwner;
    return data;
  }
}
