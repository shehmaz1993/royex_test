class ModelOfProduct {
  int? id;
  int? productId;
  int? position;
  String? createdAt;
  String? updatedAt;
  Null? alt;
  int? width;
  int? height;
  String? src;
  List<void>? variantIds;
  String? adminGraphqlApiId;

  ModelOfProduct(
      {this.id,
        this.productId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.alt,
        this.width,
        this.height,
        this.src,
        this.variantIds,
        this.adminGraphqlApiId});

  ModelOfProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    alt = json['alt'];
    width = json['width'];
    height = json['height'];
    src = json['src'];
    if (json['variant_ids'] != null) {
      variantIds = <Null>[];
      json['variant_ids'].forEach((v) {
       // variantIds!.add( Null.fromJson(v));
      });
    }
    adminGraphqlApiId = json['admin_graphql_api_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['alt'] = alt;
    data['width'] = width;
    data['height'] = height;
    data['src'] = src;
    if (variantIds != null) {
     // data['variant_ids'] = this.variantIds!.map((v) => v.toJson()).toList();
    }
    data['admin_graphql_api_id'] = adminGraphqlApiId;
    return data;
  }
}