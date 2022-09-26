import 'package:flutter/material.dart';

import 'cartCoumter.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key? key, @required this.screenSize, this.image, this.itemName, this.del,this.count})
      : super(key: key);

  final Size? screenSize;
  final String? image, itemName;
  final Function? del;
  final String? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize!.height * 0.15,
      width: screenSize!.width,
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(image ?? "",),
          // child: FadeInImage.assetNetwork(
          //   height: screenSize!.height * 0.13,
          //   width: screenSize!.width * 0.3,
          //   fit: BoxFit.cover,
          //   placeholder: "assets/images/veg.png",
          //   image: image ?? 'https://picsum.photos/250?image=9',
          // ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            itemName ?? "Item",
            style: TextStyle(fontSize: 22),
          ),
        ),


    Container(
    height: 12,
    width: 12,
    decoration:
    BoxDecoration(color: Colors.red[800], shape: BoxShape.circle),
    child: Center(
    child: Text(
    count ?? "0",
    style: TextStyle(color: Colors.white, fontSize: 7),
    )))
        //CartCounter(count: count ?? "0",)
      ]),
    );
  }
}
