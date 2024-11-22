class ItemsModel {
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

  ItemsModel(
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
      this.image});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
  }
}
