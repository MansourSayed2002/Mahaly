class ShowProductModel {
  String? status;
  List<Data>? data;

  ShowProductModel({this.status, this.data});

  ShowProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? productId;
  int? productIdstore;
  String? productTitle;
  String? productDescription;
  int? productCount;
  int? productPrice;
  int? productDiscount;

  Data(
      {this.productId,
      this.productIdstore,
      this.productTitle,
      this.productDescription,
      this.productCount,
      this.productPrice,
      this.productDiscount});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productIdstore = json['product_idstore'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productCount = json['product_count'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
  }
}
