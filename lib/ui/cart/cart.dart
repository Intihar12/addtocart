import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/addtocart_controller.dart';
import '../../widgits/cartitem.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetBuilder<AddToCartController>(
      // specify type as Controller
      init: AddToCartController(), // intialize with the Controller
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: controller.productlist.length,
              itemBuilder: (context, index) {
                var currentitem=controller.productlist[index];
                return   Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    controller.del(index);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    image: currentitem.products!.image,
                    //image:  controller.lst[index].image,
                   // itemName: controller.lst[index].name,
                    itemName: currentitem.products!.name,
                  count: currentitem.qty.toString(),
                  //  count:controller.productlist[index].qty.toString(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
