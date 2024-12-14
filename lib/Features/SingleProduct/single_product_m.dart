
class SingleProductM {
  final int id;
  final String name;
  final String slug;
  final String permalink;
  final DateTime dateCreated;
  final DateTime dateCreatedGmt;
  final DateTime dateModified;
  final DateTime dateModifiedGmt;
  final String type;
  final String status;
  final bool featured;
  final String catalogVisibility;
  final String description;
  final String imageUrl;
  final String price;
  final String regularPrice;

  SingleProductM({
    required this.imageUrl,
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.price,
    required this.regularPrice,
  });

  factory SingleProductM.fromJson(Map<String, dynamic> json) {
    return SingleProductM(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      permalink: json['permalink'] as String,
      dateCreated: DateTime.parse(json['date_created']),
      dateCreatedGmt: DateTime.parse(json['date_created_gmt']),
      dateModified: DateTime.parse(json['date_modified']),
      dateModifiedGmt: DateTime.parse(json['date_modified_gmt']),
      type: json['type'] as String,
      status: json['status'] as String,
      featured: json['featured'] as bool,
      catalogVisibility: json['catalog_visibility'] as String,
      description: json['description'] as String,
      imageUrl: json['images'][0]['src'] as String,
      price: json['price'] as String,
      regularPrice: json['regular_price'] as String,
    );
  }
}
