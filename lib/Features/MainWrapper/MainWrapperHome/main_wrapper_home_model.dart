class HomeProduct {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String category;

  HomeProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category
  });

  factory HomeProduct.fromJson(Map<String, dynamic> json) {
    return HomeProduct(
      id: json['id'],
      name: json['name'],
      imageUrl: json['images'][0]['src'],
      price: json['price'],
      category: json['categories'][0]['name'],
    );
  }
}
