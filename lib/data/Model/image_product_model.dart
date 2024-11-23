class ImageProductModel {
  int? imageId;
  int? imageProductId;
  String? image;

  ImageProductModel({this.imageId, this.imageProductId, this.image});

  ImageProductModel.fromJson(Map<String, dynamic> json) {
    imageId = json['image_id'];
    imageProductId = json['image_product_id'];
    image = json['image'];
  }
}
