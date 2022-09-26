class Products {
  Products({
    this.name,
    this.image,
  });

  String? name;
  String? image;

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}

final prds = [
  {
    "name": "ABCD",
    "image":
    "assets/images/veg.png"
  },
  {
    "name": "QQWE",
    "image":
    "assets/images/fruit.png"
  },
  {
    "name": "WWSA",
    "image":
    "assets/images/bakery.png"
  },
  {
    "name": "EXMP",
    "image":
    "assets/images/egg.png"
  },
  {
    "name": "SADS",
    "image":
    "assets/images/grapes.png"
  },
  {
    "name": "SADS",
    "image":
    "assets/images/apple.png"
  },
];


class ProductsModal {
  ProductsModal({
   this.products,
    this.qty,
  });

 Products? products;
 int? qty;

  Map<String, dynamic> toJson() => {
    "products": products,
    "qty": qty,
  };
}