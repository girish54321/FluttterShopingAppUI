// To parse this JSON data, do
//
//     final homeCategory = homeCategoryFromJson(jsonString);

// import 'dart:convert';

// HomeCategory homeCategoryFromJson(String str) =>
//     HomeCategory.fromJson(json.decode(str));

// String homeCategoryToJson(HomeCategory data) => json.encode(data.toJson());

class HomeCategory {
  HomeCategory({
    this.homeCategory,
  });

  HomeCategoryClass homeCategory;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        homeCategory: json["home_category"] == null
            ? null
            : HomeCategoryClass.fromJson(json["home_category"]),
      );

  Map<String, dynamic> toJson() => {
        "home_category": homeCategory == null ? null : homeCategory.toJson(),
      };
}

class HomeCategoryClass {
  HomeCategoryClass({
    this.category,
  });

  List<Category> category;

  factory HomeCategoryClass.fromJson(Map<String, dynamic> json) =>
      HomeCategoryClass(
        category: json["category"] == null
            ? null
            : List<Category>.from(
                json["category"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null
            ? null
            : List<dynamic>.from(category.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.categoryName,
    this.productImage,
  });

  String categoryName;
  List<ProductImage> productImage;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName:
            json["category_name"] == null ? null : json["category_name"],
        productImage: json["product_image"] == null
            ? null
            : List<ProductImage>.from(
                json["product_image"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName == null ? null : categoryName,
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
