import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/addtocart_controller.dart';
import '../../models/product_modal.dart';
import '../../widgits/cartCoumter.dart';
import '../../widgits/productitem.dart';
import '../cart/cart.dart';


class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {

              Get.to(CartScreen());
            },
            child: Padding(
              padding:
              const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.blue, size: 25)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GetBuilder<AddToCartController>(
                      // specify type as Controller
                      init: AddToCartController(), // intialize with the Controller
                      builder: (value) => CartCounter(
                        count: value.sum.toString(),


                      //  count: value.lst.length.toString() ?? "0",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: const Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: screenSize.height * 0.24,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prds.length,
                itemBuilder: (context, index) => ProductItem(
                  index: index,
                  screenSize: screenSize,
                  images: prds[index]["image"],
                  itemName: prds[index]["name"],
                ),
              ),
            ),
          )),
    );
  }
}

