class ProductsOfAdminModel {
  int? productId;
  int? productIdstore;
  String? productTitle;
  String? productDescription;
  int? productCount;
  int? productPrice;
  int? productDiscount;
  int? productCategory;
  int? imageId;
  int? imageProductId;
  String? image;
  int? categoryId;
  String? categoryName;
  int? categoryOwner;

  ProductsOfAdminModel(
      {this.productId,
      this.productIdstore,
      this.productTitle,
      this.productDescription,
      this.productCount,
      this.productPrice,
      this.productDiscount,
      this.productCategory,
      this.imageId,
      this.imageProductId,
      this.image,
      this.categoryId,
      this.categoryName,
      this.categoryOwner});

  ProductsOfAdminModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productIdstore = json['product_idstore'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productCount = json['product_count'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productCategory = json['product_category'];
    imageId = json['image_id'];
    imageProductId = json['image_product_id'];
    image = json['image'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryOwner = json['category_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_idstore'] = productIdstore;
    data['product_title'] = productTitle;
    data['product_description'] = productDescription;
    data['product_count'] = productCount;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['product_category'] = productCategory;
    data['image_id'] = imageId;
    data['image_product_id'] = imageProductId;
    data['image'] = image;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_owner'] = categoryOwner;
    return data;
  }
}
