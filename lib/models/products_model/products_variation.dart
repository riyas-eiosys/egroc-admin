class ProductsVariation {
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
  DateTime? createdTimestamp;
  dynamic updatedBy;
  DateTime? updatedTimestamp;
  List<dynamic>? productsVariationsAttribute;

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

  factory ProductsVariation.fromId1300EnabledTrueNameBedgiChilli100GSlugNullPriority0UnitOfMeasurementId2Multiplier1FeaturedFalseProductTypeSimpleTagsNullShortDescriptionNullDescriptionNullBrandIdNullIsTaxableFalseTaxIdNullHsnCodeNullManageStockFalseAllowBackOrderFalseLowStockThresholdNullSpecificationsNullFittingInstructionsNullCareInstructionsNullWarrantyNullReturnsNullYoutubeLinkNullMetaTitleNullMetaDescriptionNullMetaKeywordsNullCreatedBy6CreatedTimestamp20211211T155634704ZUpdatedBy6BidAllowed10000UpdatedTimestamp20211211T155645167ZCategoryAttributeProductsImageId1574ImageHttpsJustAskOnlineS3ApSouth1AmazonawsComApiProducts6e0b4e4845e441499c342d7b73ffd65aPngSmIsCoverTruePriority1ProductsVariationId1512EnabledTrueProductId1300NameBedgiChilli100GUnitPrice5000SalePrice3750DiscountPercentage000SkuImageNullStockStatusInStockStockQuantity000AllowBackOrderFalseLowStockThresholdNullManageStockFalseCreatedByNullCreatedTimestamp20211211T155634704ZUpdatedByNullUpdatedTimestamp20211211T155634704ZProductsVariationsAttributeMeasurementUnitId2CodeGmNameGramsBrandNullRelatedProductId1263EnabledTrueNameWal500GSlugNullPriority0UnitOfMeasurementId2Multiplier1FeaturedFalseProductTypeSimpleTagsNullShortDescriptionNullDescriptionNullBrandIdNullIsTaxableFalseTaxIdNullHsnCodeNullManageStockFalseAllowBackOrderFalseLowStockThresholdNullSpecificationsNullFittingInstructionsNullCareInstructionsNullWarrantyNullReturnsNullYoutubeLinkNullMetaTitleNullMetaDescriptionNullMetaKeywordsNullCreatedBy6CreatedTimestamp20211203T204751624ZUpdatedBy6BidAllowed10000UpdatedTimestamp20211203T210856117ZCategoryAttributeProductsImageId1515ImageHttpsJustAskOnlineS3ApSouth1AmazonawsComApiProducts78e0e83467f14530A5a9E170cf52f2fePngSmIsCoverTruePriority1ProductsVariationId1471EnabledTrueProductId1263NameWal500GUnitPrice8500SalePrice6375DiscountPercentage000SkuImageNullStockStatusInStockStockQuantity000AllowBackOrderFalseLowStockThresholdNullManageStockFalseCreatedByNullCreatedTimestamp20211203T204751624ZUpdatedByNullUpdatedTimestamp20211203T210856748ZProductsVariationsAttributeMeasurementUnitId2CodeGmNameGramsBrandNullRelatedProduct(
      Map<String, dynamic> json) {
    return ProductsVariation(
      id: json['id'] as int?,
      enabled: json['enabled'] as bool?,
      productId: json['productId'] as int?,
      name: json['name'] as String?,
      unitPrice: json['unitPrice'] as String?,
      salePrice: json['salePrice'] as String?,
      discountPercentage: json['discountPercentage'] as String?,
      sku: json['sku'] as String?,
      image: json['image'] as dynamic,
      stockStatus: json['stockStatus'] as String?,
      stockQuantity: json['stockQuantity'] as String?,
      allowBackOrder: json['allowBackOrder'] as bool?,
      lowStockThreshold: json['lowStockThreshold'] as dynamic,
      manageStock: json['manageStock'] as bool?,
      createdBy: json['createdBy'] as dynamic,
      createdTimestamp: json['createdTimestamp'] == null
          ? null
          : DateTime.parse(json['createdTimestamp'] as String),
      updatedBy: json['updatedBy'] as dynamic,
      updatedTimestamp: json['updatedTimestamp'] == null
          ? null
          : DateTime.parse(json['updatedTimestamp'] as String),
      productsVariationsAttribute:
          json['productsVariationsAttribute'] as List<dynamic>?,
    );
  }

  Map<String, dynamic>
      toId1300EnabledTrueNameBedgiChilli100GSlugNullPriority0UnitOfMeasurementId2Multiplier1FeaturedFalseProductTypeSimpleTagsNullShortDescriptionNullDescriptionNullBrandIdNullIsTaxableFalseTaxIdNullHsnCodeNullManageStockFalseAllowBackOrderFalseLowStockThresholdNullSpecificationsNullFittingInstructionsNullCareInstructionsNullWarrantyNullReturnsNullYoutubeLinkNullMetaTitleNullMetaDescriptionNullMetaKeywordsNullCreatedBy6CreatedTimestamp20211211T155634704ZUpdatedBy6BidAllowed10000UpdatedTimestamp20211211T155645167ZCategoryAttributeProductsImageId1574ImageHttpsJustAskOnlineS3ApSouth1AmazonawsComApiProducts6e0b4e4845e441499c342d7b73ffd65aPngSmIsCoverTruePriority1ProductsVariationId1512EnabledTrueProductId1300NameBedgiChilli100GUnitPrice5000SalePrice3750DiscountPercentage000SkuImageNullStockStatusInStockStockQuantity000AllowBackOrderFalseLowStockThresholdNullManageStockFalseCreatedByNullCreatedTimestamp20211211T155634704ZUpdatedByNullUpdatedTimestamp20211211T155634704ZProductsVariationsAttributeMeasurementUnitId2CodeGmNameGramsBrandNullRelatedProductId1263EnabledTrueNameWal500GSlugNullPriority0UnitOfMeasurementId2Multiplier1FeaturedFalseProductTypeSimpleTagsNullShortDescriptionNullDescriptionNullBrandIdNullIsTaxableFalseTaxIdNullHsnCodeNullManageStockFalseAllowBackOrderFalseLowStockThresholdNullSpecificationsNullFittingInstructionsNullCareInstructionsNullWarrantyNullReturnsNullYoutubeLinkNullMetaTitleNullMetaDescriptionNullMetaKeywordsNullCreatedBy6CreatedTimestamp20211203T204751624ZUpdatedBy6BidAllowed10000UpdatedTimestamp20211203T210856117ZCategoryAttributeProductsImageId1515ImageHttpsJustAskOnlineS3ApSouth1AmazonawsComApiProducts78e0e83467f14530A5a9E170cf52f2fePngSmIsCoverTruePriority1ProductsVariationId1471EnabledTrueProductId1263NameWal500GUnitPrice8500SalePrice6375DiscountPercentage000SkuImageNullStockStatusInStockStockQuantity000AllowBackOrderFalseLowStockThresholdNullManageStockFalseCreatedByNullCreatedTimestamp20211203T204751624ZUpdatedByNullUpdatedTimestamp20211203T210856748ZProductsVariationsAttributeMeasurementUnitId2CodeGmNameGramsBrandNullRelatedProduct() {
    return {
      'id': id,
      'enabled': enabled,
      'productId': productId,
      'name': name,
      'unitPrice': unitPrice,
      'salePrice': salePrice,
      'discountPercentage': discountPercentage,
      'sku': sku,
      'image': image,
      'stockStatus': stockStatus,
      'stockQuantity': stockQuantity,
      'allowBackOrder': allowBackOrder,
      'lowStockThreshold': lowStockThreshold,
      'manageStock': manageStock,
      'createdBy': createdBy,
      'createdTimestamp': createdTimestamp?.toIso8601String(),
      'updatedBy': updatedBy,
      'updatedTimestamp': updatedTimestamp?.toIso8601String(),
      'productsVariationsAttribute': productsVariationsAttribute,
    };
  }
}
