

import 'package:get/get.dart';
import 'package:shoppingapp/model/product.dart';

class ShoppingController extends GetxController {
  var products=List<Product>.empty(growable: true).obs;
  @override
  void onInit(){
    super.onInit();
    fetchProducts();
      }
    
      void fetchProducts()async {
        await Future.delayed(Duration(seconds: 1));
        var productResult=[
          Product(
            id: 1,
            productName: 'Seom',
            description: 'slke'
            ,price: 2123,
          ),
          Product(
            id: 2,
            productName: 'Seomh',
            description: 'slke'
            ,price: 2123,
          ),
          Product(
            id: 1,
            productName: 'Seom',
            description: 'slke'
            ,price: 2123,
          ),
          
        ];
        products.value=productResult;

      }
}
