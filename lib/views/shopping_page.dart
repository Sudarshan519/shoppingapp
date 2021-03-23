import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppingapp/controller/cart_controller.dart';
import 'package:shoppingapp/controller/shpping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (_, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(controller.products[i].productName),
                                Obx(() {
                                  return InkWell(
                                      onTap: () {
                                       print( controller.products[i].qty);
                                      },
                                      child: Text(controller.products[i].qty
                                          .toString()));
                                }),
                              ],
                            ),
                            Obx(() => IconButton(
                                  icon: controller.products[i].isFaourite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(Icons.check_box_outlined),
                                  onPressed: () {
                                    controller.products[i].isFaourite.toggle();
                                  },
                                )),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[i]);
                              },
                              child: Text('Add to cart'),
                            )
                          ])),
                    );
                  });
            }),
          ),
          GetX<CartController>(
              builder: (_) => Text('Total amount:\$ ${_.totalPrice}'))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
          label: GetX<CartController>(
            builder: (_) {
              return Text(cartController.count.toString());
            },
          )),
    );
  }
}
