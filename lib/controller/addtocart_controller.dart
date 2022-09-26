//import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';

import '../models/product_modal.dart';

class AddToCartController extends GetxController {
  List<Products> lst = <Products>[];
  List<ProductsModal> productlist = <ProductsModal>[].obs;
  RxBool isaddbtn = true.obs;
  int isadd = -1;

  var addcount = 0.obs;
  var addcountvalue = 0.obs;

 int get sum=> addcountvalue.value + addcount.value;

  addIncrement( int index) {
   productlist[index].qty=
    addcount.value++;
    update();
  }

  addDecrement( int index) {
    if (addcount.value > 0) {
     // productlist[index].qty=
      addcount.value--;
      update();
    }
    // update();
  }

  additems(Products products,int index) {
    final index =
        productlist.indexWhere((element) => element.products == products);
    // qty=addcountvalue.value +addcount.value;
Get.log("additem index ${index}");
    if (index > 0) {
      productlist[index] = ProductsModal(
          products: products, qty: (addcountvalue.value + productlist[index].qty!));

      Get.log("product list inddex ${productlist[index]}");
      update();
    }
    else{
      productlist.add(ProductsModal(products: products,qty: addcount.value));


      update();
    }
     addcountvalue.value=addcountvalue.value + addcount.value;
Get.log("addcount value ${addcountvalue.value}");
    // addIncrement(index);
     addcount.value=1;
    update();
  }

// add(String image, String name,) {
//
//     lst.add(Products(image: image, name: name));
//    // qty=addcountvalue.value +addcount.value;
//
//     update();
// }

  void additeminCart(Products products) {}

  del(int index) {
    productlist.removeAt(index);
    update();
  }
}
