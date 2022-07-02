class AllProductsModel {
  AllProductsModel({this.product});
  AllProductsModel.fromJson(dynamic json) {
    if (json != null) {
      product = [];
      json.forEach((v) {
        product?.add(ProductModel.fromJson(v));
      });
    }
  }

  List<ProductModel>? product;
}

class ProductModel {
  ProductModel({
    this.id,
    this.enabled,
    this.name,
    this.slug,
    this.priority,
    this.unitOfMeasurementId,
    this.multiplier,
    this.featured,
    this.productType,
    this.tags,
    this.shortDescription,
    this.description,
    this.brandId,
    this.isTaxable,
    this.taxId,
    this.hsnCode,
    this.manageStock,
    this.allowBackOrder,
    this.lowStockThreshold,
    this.specifications,
    this.fittingInstructions,
    this.careInstructions,
    this.warranty,
    this.returns,
    this.youtubeLink,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.createdBy,
    this.createdTimestamp,
    this.updatedBy,
    this.bidAllowed,
    this.updatedTimestamp,
    this.category,
    this.attribute,
    this.productsImage,
    this.productsVariation,
    this.measurementUnit,
    this.brand,
    this.relatedProduct,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    enabled = json['enabled'];
    name = json['name'];
    slug = json['slug'];
    priority = json['priority'];
    unitOfMeasurementId = json['unitOfMeasurementId'];
    multiplier = json['multiplier'];
    featured = json['featured'];
    productType = json['productType'];
    tags = json['tags'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    brandId = json['brandId'];
    isTaxable = json['isTaxable'];
    taxId = json['taxId'];
    hsnCode = json['hsnCode'];
    manageStock = json['manageStock'];
    allowBackOrder = json['allowBackOrder'];
    lowStockThreshold = json['lowStockThreshold'];
    specifications = json['specifications'];
    fittingInstructions = json['fittingInstructions'];
    careInstructions = json['careInstructions'];
    warranty = json['warranty'];
    returns = json['returns'];
    youtubeLink = json['youtubeLink'];
    metaTitle = json['metaTitle'];
    metaDescription = json['metaDescription'];
    metaKeywords = json['metaKeywords'];
    createdBy = json['createdBy'];
    createdTimestamp = json['createdTimestamp'];
    updatedBy = json['updatedBy'];
    bidAllowed = json['bidAllowed'];
    updatedTimestamp = json['updatedTimestamp'];
    if (json['category'] != null) {
      category = [];
      category = json['category'] as List<dynamic>?;
    }
    if (json['attribute'] != null) {
      attribute = [];
      attribute = json['attribute'] as List<dynamic>?;
    }
    if (json['productsImage'] != null) {
      productsImage = [];
      json['productsImage'].forEach((v) {
        productsImage?.add(ProductsImage.fromJson(v));
      });
    }
    if (json['productsVariation'] != null) {
      productsVariation = [];
      json['productsVariation'].forEach((v) {
        productsVariation?.add(ProductsVariation.fromJson(v));
      });
    }
    measurementUnit = json['measurementUnit'] != null
        ? MeasurementUnit.fromJson(json['measurementUnit'])
        : null;
    brand = json['brand'];
    if (json['relatedProduct'] != null) {
      relatedProduct = [];
      relatedProduct = json['relatedProduct'] as List<dynamic>?;
    }
  }
  int? id;
  bool? enabled;
  String? name;
  dynamic slug;
  int? priority;
  int? unitOfMeasurementId;
  int? multiplier;
  bool? featured;
  String? productType;
  dynamic tags;
  dynamic shortDescription;
  dynamic description;
  dynamic brandId;
  bool? isTaxable;
  dynamic taxId;
  dynamic hsnCode;
  bool? manageStock;
  bool? allowBackOrder;
  dynamic lowStockThreshold;
  dynamic specifications;
  dynamic fittingInstructions;
  dynamic careInstructions;
  dynamic warranty;
  dynamic returns;
  dynamic youtubeLink;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeywords;
  int? createdBy;
  String? createdTimestamp;
  int? updatedBy;
  String? bidAllowed;
  String? updatedTimestamp;
  List<dynamic>? category;
  List<dynamic>? attribute;
  List<ProductsImage>? productsImage;
  List<ProductsVariation>? productsVariation;
  MeasurementUnit? measurementUnit;
  dynamic brand;
  List<dynamic>? relatedProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enabled'] = enabled;
    map['name'] = name;
    map['slug'] = slug;
    map['priority'] = priority;
    map['unitOfMeasurementId'] = unitOfMeasurementId;
    map['multiplier'] = multiplier;
    map['featured'] = featured;
    map['productType'] = productType;
    map['tags'] = tags;
    map['shortDescription'] = shortDescription;
    map['description'] = description;
    map['brandId'] = brandId;
    map['isTaxable'] = isTaxable;
    map['taxId'] = taxId;
    map['hsnCode'] = hsnCode;
    map['manageStock'] = manageStock;
    map['allowBackOrder'] = allowBackOrder;
    map['lowStockThreshold'] = lowStockThreshold;
    map['specifications'] = specifications;
    map['fittingInstructions'] = fittingInstructions;
    map['careInstructions'] = careInstructions;
    map['warranty'] = warranty;
    map['returns'] = returns;
    map['youtubeLink'] = youtubeLink;
    map['metaTitle'] = metaTitle;
    map['metaDescription'] = metaDescription;
    map['metaKeywords'] = metaKeywords;
    map['createdBy'] = createdBy;
    map['createdTimestamp'] = createdTimestamp;
    map['updatedBy'] = updatedBy;
    map['bidAllowed'] = bidAllowed;
    map['updatedTimestamp'] = updatedTimestamp;
    if (category != null) {
      map['category'] = category?.map((v) => v.toJson()).toList();
    }
    if (attribute != null) {
      map['attribute'] = attribute?.map((v) => v.toJson()).toList();
    }
    if (productsImage != null) {
      map['productsImage'] = productsImage?.map((v) => v.toJson()).toList();
    }
    if (productsVariation != null) {
      map['productsVariation'] =
          productsVariation?.map((v) => v.toJson()).toList();
    }
    if (measurementUnit != null) {
      map['measurementUnit'] = measurementUnit?.toJson();
    }
    map['brand'] = brand;
    if (relatedProduct != null) {
      map['relatedProduct'] = relatedProduct?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MeasurementUnit {
  MeasurementUnit({
    this.id,
    this.code,
    this.name,
  });

  MeasurementUnit.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
  }
  int? id;
  String? code;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    return map;
  }
}

class ProductsVariation {
  ProductsVariation({
    this.id,
    this.enabled,
    this.productId,
    this.name,
    this.unitPrice,
    this.salePrice,
    this.discountPercentage,
    this.sku,
    this.image,
    this.stockStatus,
    this.stockQuantity,
    this.allowBackOrder,
    this.lowStockThreshold,
    this.manageStock,
    this.createdBy,
    this.createdTimestamp,
    this.updatedBy,
    this.updatedTimestamp,
    this.productsVariationsAttribute,
  });

  ProductsVariation.fromJson(dynamic json) {
    id = json['id'];
    enabled = json['enabled'];
    productId = json['productId'];
    name = json['name'];
    unitPrice = json['unitPrice'];
    salePrice = json['salePrice'];
    discountPercentage = json['discountPercentage'];
    sku = json['sku'];
    image = json['image'];
    stockStatus = json['stockStatus'];
    stockQuantity = json['stockQuantity'];
    allowBackOrder = json['allowBackOrder'];
    lowStockThreshold = json['lowStockThreshold'];
    manageStock = json['manageStock'];
    createdBy = json['createdBy'];
    createdTimestamp = json['createdTimestamp'];
    updatedBy = json['updatedBy'];
    updatedTimestamp = json['updatedTimestamp'];
    if (json['productsVariationsAttribute'] != null) {
      productsVariationsAttribute = [];
      productsVariationsAttribute =
          json['productsVariationsAttribute'] as List<dynamic>?;
    }
  }
  int? id;
  bool? enabled;
  int? productId;
  String? name;
  String? unitPrice;
  String? salePrice;
  String? discountPercentage;
  String? sku;
  dynamic image;
  String? stockStatus;
  String? stockQuantity;
  bool? allowBackOrder;
  dynamic lowStockThreshold;
  bool? manageStock;
  dynamic createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? updatedTimestamp;
  List<dynamic>? productsVariationsAttribute;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enabled'] = enabled;
    map['productId'] = productId;
    map['name'] = name;
    map['unitPrice'] = unitPrice;
    map['salePrice'] = salePrice;
    map['discountPercentage'] = discountPercentage;
    map['sku'] = sku;
    map['image'] = image;
    map['stockStatus'] = stockStatus;
    map['stockQuantity'] = stockQuantity;
    map['allowBackOrder'] = allowBackOrder;
    map['lowStockThreshold'] = lowStockThreshold;
    map['manageStock'] = manageStock;
    map['createdBy'] = createdBy;
    map['createdTimestamp'] = createdTimestamp;
    map['updatedBy'] = updatedBy;
    map['updatedTimestamp'] = updatedTimestamp;
    if (productsVariationsAttribute != null) {
      map['productsVariationsAttribute'] =
          productsVariationsAttribute?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductsImage {
  ProductsImage({
    this.id,
    this.image,
    this.isCover,
    this.priority,
  });

  ProductsImage.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    isCover = json['isCover'];
    priority = json['priority'];
  }
  int? id;
  String? image;
  bool? isCover;
  int? priority;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['isCover'] = isCover;
    map['priority'] = priority;
    return map;
  }
}
