class Category {
  int id;
  String name;
  String categoryDescription;
  String categoryImage;
  String createdAt;
  String updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.categoryDescription,
    required this.categoryImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      categoryDescription: json['category_description'],
      categoryImage: json['category_image'] ?? '',
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Brands {
  int id;
  String name;
  String brandDescription;
  String brandImage;
  String createdAt;
  String updatedAt;

  Brands({
    required this.id,
    required this.name,
    required this.brandDescription,
    required this.brandImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brands.fromJson(Map<String, dynamic> json) {
    return Brands(
      id: json['id'],
      name: json['name'],
      brandDescription: json['brand_description'],
     brandImage: json['brand_image'] ?? '',
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
