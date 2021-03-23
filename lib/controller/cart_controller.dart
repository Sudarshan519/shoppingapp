import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/model/product.dart';

class CartController extends GetxController {
//final MyRepository repository;
//cartController({@required this.repository}) : assert(repository != null);
  int get count => cartItems.length;
  var cartItems = List<Product>.empty(growable: true).obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.qty*item.price);
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;

  addToCart(Product product) {
    if (!cartItems.contains(product)) {
      cartItems.add(product);
    } else if(cartItems.contains(product)){
      product.increment();
      print(product.qty.value);
      //Get.snackbar('Item already in cart', product.productName.camelCase);
    }
  }
}
