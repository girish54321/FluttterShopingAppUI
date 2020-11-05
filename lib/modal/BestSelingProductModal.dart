// To parse this JSON data, do
//
//     final bestSeliingProduct = bestSeliingProductFromJson(jsonString);

// import 'dart:convert';

// BestSeliingProduct bestSeliingProductFromJson(String str) =>
//     BestSeliingProduct.fromJson(json.decode(str));

// String bestSeliingProductToJson(BestSeliingProduct data) =>
//     json.encode(data.toJson());

class BestSeliingProduct {
  BestSeliingProduct({
    this.bestSelling,
  });

  BestSelling bestSelling;

  factory BestSeliingProduct.fromJson(Map<String, dynamic> json) =>
      BestSeliingProduct(
        bestSelling: json["best_selling"] == null
            ? null
            : BestSelling.fromJson(json["best_selling"]),
      );

  Map<String, dynamic> toJson() => {
        "best_selling": bestSelling == null ? null : bestSelling.toJson(),
      };
}

class BestSelling {
  BestSelling({
    this.products,
  });

  List<Product> products;

  factory BestSelling.fromJson(Map<String, dynamic> json) => BestSelling(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productName,
    this.productImage,
    this.prise,
    this.brandName,
    this.inStock,
  });

  String productName;
  List<ProductImage> productImage;
  String prise;
  String brandName;
  bool inStock;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"] == null ? null : json["product_name"],
        productImage: json["product_image"] == null
            ? null
            : List<ProductImage>.from(
                json["product_image"].map((x) => ProductImage.fromJson(x))),
        prise: json["prise"] == null ? null : json["prise"],
        brandName: json["brand_name"] == null ? null : json["brand_name"],
        inStock: json["in_stock"] == null ? null : json["in_stock"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "product_image": productImage == null
            ? null
            : List<dynamic>.from(productImage.map((x) => x.toJson())),
        "prise": prise == null ? null : prise,
        "brand_name": brandName == null ? null : brandName,
        "in_stock": inStock == null ? null : inStock,
      };
}

class ProductImage {
  ProductImage({
    this.image,
    this.image2,
    this.image3,
    this.image4,
  });

  String image;
  String image2;
  String image3;
  String image4;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        image: json["image"] == null ? null : json["image"],
        image2: json["image2"] == null ? null : json["image2"],
        image3: json["image3"] == null ? null : json["image3"],
        image4: json["image4"] == null ? null : json["image4"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "image2": image2 == null ? null : image2,
        "image3": image3 == null ? null : image3,
        "image4": image4 == null ? null : image4,
      };
}
