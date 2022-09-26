import 'package:addtocartflutter/models/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/addtocart_controller.dart';

class ProductItem extends StatelessWidget {
   ProductItem(
      {Key? key,
      @required this.screenSize,
      this.images,
      this.itemName,

      this.index,
      this.count})
      : super(key: key);

  Size? screenSize;
  String? images, itemName;
 int? index;
   int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize!.height * 0.2,
      width: screenSize!.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[200]!.withOpacity(0.3),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Image.asset(
              images ?? "",
              height: screenSize!.height * 0.13,
              width: double.infinity,
            ),

            // child: FadeInImage.assetNetwork(
            //   height: screenSize!.height * 0.13,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            //   placeholder:"assets/images/veg.png",
            //   image: image ?? 'assets/images/veg.png',
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(itemName ?? "Item"),
          ),
          GetBuilder<AddToCartController>(
            // specify type as Controller
            init: AddToCartController(),

            // intialize with the Controller
            builder: (controller) => controller.isadd != index
                ? InkWell(
                    onTap: () {
                      Get.log("index value:$index");
                      controller.isadd = index!;
                      Get.log("controller value:${controller.isadd}");
                      // controller.additems(Products(image: images,name:itemName),index:index!);
                      controller.additems(Products(image: images,name:itemName), index!);
                     // controller.additems(Products(image: images,name:itemName));

controller.isaddbtn.value==false;
                      controller.isaddbtn.value = controller.isaddbtn.value;

                     // controller.addcount.value++;
                      controller.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          height: screenSize!.height * 0.03,
                          width: screenSize!.width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue),
                          child: const Center(
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  )
                : Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    shape: BoxShape.circle),
                                child:  IconButton(
                                icon: Icon(Icons.remove,size: 10,color: Colors.white,),
                                    onPressed:(){
                                  controller.addDecrement(index!);
                                   controller.update();
                                    }

                                    )),
                            Text(controller.addcount.toString() ),
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    shape: BoxShape.circle),
                                child:  Center(
                                    child: IconButton(onPressed: (){
                                      controller.addIncrement(index!);
                                        controller.update();
                                    }, icon: Icon(Icons.add,size: 10,color: Colors.white,))))
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
