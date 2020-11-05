// To parse this JSON data, do
//
//     final brandList = brandListFromJson(jsonString);

// import 'dart:convert';

// BrandList brandListFromJson(String str) => BrandList.fromJson(json.decode(str));

// String brandListToJson(BrandList data) => json.encode(data.toJson());

class BrandList {
  BrandList({
    this.barndList,
  });

  BarndList barndList;

  factory BrandList.fromJson(Map<String, dynamic> json) => BrandList(
        barndList: json["barnd_list"] == null
            ? null
            : BarndList.fromJson(json["barnd_list"]),
      );

  Map<String, dynamic> toJson() => {
        "barnd_list": barndList == null ? null : barndList.toJson(),
      };
}

class BarndList {
  BarndList({
    this.barnds,
  });

  List<Barnd> barnds;

  factory BarndList.fromJson(Map<String, dynamic> json) => BarndList(
        barnds: json["barnds"] == null
            ? null
            : List<Barnd>.from(json["barnds"].map((x) => Barnd.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "barnds": barnds == null
            ? null
            : List<dynamic>.from(barnds.map((x) => x.toJson())),
      };
}

class Barnd {
  Barnd({
    this.brandName,
    this.productImage,
  });

  String brandName;
  List<ProductImage> productImage;

  factory Barnd.fromJson(Map<String, dynamic> json) => Barnd(
        brandName: json["brand_name"] == null ? null : json["brand_name"],
        productImage: json["product_image"] == null
            ? null
            : List<ProductImage>.from(
                json["product_image"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName == null ? null : brandName,
        "product_image": productImage == null
            ? null
            : List<dynamic>.from(productImage.map((x) => x.toJson())),
      };
}

class ProductImage {
  ProductImage({
    this.image,
  });

  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
      };
}
