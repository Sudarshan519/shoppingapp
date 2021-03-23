import 'package:get/get.dart';

class Product {
  int id;
  String description;
  final String productImage;
  double price;
  String productName;

  Product({
    this.id,
    this.productName,
    this.description,
    this.productImage,
    this.price,
    this.qty
  });
  final isFaourite = false.obs;
  var qty = 1.obs;
  void increment(){
    qty.value=qty.value+1;
    print(qty.value);
  }

  Product.fromJson(Map<String, dynamic> json, this.id, this.description,
      this.productImage, this.price, this.productName) {
    this.id = json['id'];
    this.productName = json['name'];
    this.description = json['name'];
    this.price = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.productName;
    return data;
  }
}
