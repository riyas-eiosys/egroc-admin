class OrderModel {
  OrderModel({
      this.data, 
      this.count, 
      this.total, 
      this.page, 
      this.pageCount,});

  OrderModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(OrderData.fromJson(v));
      });
    }
    count = json['count'];
    total = json['total'];
    page = json['page'];
    pageCount = json['pageCount'];
  }
  List<OrderData>? data;
  int? count;
  int? total;
  int? page;
  int? pageCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['total'] = total;
    map['page'] = page;
    map['pageCount'] = pageCount;
    return map;
  }

}

class OrderData {
  OrderData({
      this.id, 
      this.enabled, 
      this.orderReference, 
      this.customerIP, 
      this.status, 
      this.paymentMethod, 
      this.orderedBy, 
      this.rating, 
      this.comments, 
      this.deliveryInstructions, 
      this.deliverySlot, 
      this.total, 
      this.driverId, 
      this.shippingCharges, 
      this.shippingId, 
      this.taxedAmount, 
      this.discountAmount, 
      this.couponId, 
      this.grandTotal, 
      this.amountReceived, 
      this.totalProducts, 
      this.totalQuantity, 
      this.deliveryOtp, 
      this.orderTimestamp, 
      this.deliveredTimestamp, 
      this.outForDeliveryTimestamp, 
      this.cancelledTimestamp, 
      this.paymentInitiated, 
      this.paymentInitiatedTimestamp, 
      this.lastLocation, 
      this.platform, 
      this.version, 
      this.uuid, 
      this.model, 
      this.deviceId, 
      this.device, 
      this.oSVersion, 
      this.uniqueID, 
      this.manufacturer, 
      this.appVersion, 
      this.createdBy, 
      this.createdTimestamp, 
      this.updatedBy, 
      this.updatedTimestamp, 
      this.userId, 
      this.countryId, 
      this.stateId, 
      this.cityId, 
      this.pincodeId, 
      this.contactId, 
      this.addressId, 
      this.user, 
      this.ordersProduct,});

  OrderData.fromJson(dynamic json) {
    id = json['id'];
    enabled = json['enabled'];
    orderReference = json['orderReference'];
    customerIP = json['customerIP'];
    status = json['status'];
    paymentMethod = json['paymentMethod'];
    orderedBy = json['orderedBy'];
    rating = json['rating'];
    comments = json['comments'];
    deliveryInstructions = json['deliveryInstructions'];
    deliverySlot = json['deliverySlot'];
    total = json['total'];
    driverId = json['driverId'];
    shippingCharges = json['shippingCharges'];
    shippingId = json['shippingId'];
    taxedAmount = json['taxedAmount'];
    discountAmount = json['discountAmount'];
    couponId = json['couponId'];
    grandTotal = json['grandTotal'];
    amountReceived = json['amountReceived'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
    deliveryOtp = json['deliveryOtp'];
    orderTimestamp = json['orderTimestamp'];
    deliveredTimestamp = json['deliveredTimestamp'];
    outForDeliveryTimestamp = json['outForDeliveryTimestamp'];
    cancelledTimestamp = json['cancelledTimestamp'];
    paymentInitiated = json['paymentInitiated'];
    paymentInitiatedTimestamp = json['paymentInitiatedTimestamp'];
    lastLocation = json['lastLocation'];
    platform = json['platform'];
    version = json['version'];
    uuid = json['uuid'];
    model = json['model'];
    deviceId = json['deviceId'];
    device = json['device'];
    oSVersion = json['OSVersion'];
    uniqueID = json['uniqueID'];
    manufacturer = json['manufacturer'];
    appVersion = json['appVersion'];
    createdBy = json['createdBy'];
    createdTimestamp = json['createdTimestamp'];
    updatedBy = json['updatedBy'];
    updatedTimestamp = json['updatedTimestamp'];
    userId = json['userId'];
    countryId = json['countryId'];
    stateId = json['stateId'];
    cityId = json['cityId'];
    pincodeId = json['pincodeId'];
    contactId = json['contactId'];
    addressId = json['addressId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['ordersProduct'] != null) {
      ordersProduct = [];
      json['ordersProduct'].forEach((v) {
        ordersProduct?.add(OrdersProduct.fromJson(v));
      });
    }
  }
  int? id;
  bool? enabled;
  dynamic orderReference;
  dynamic customerIP;
  String? status;
  String? paymentMethod;
  dynamic orderedBy;
  dynamic rating;
  dynamic comments;
  dynamic deliveryInstructions;
  dynamic deliverySlot;
  String? total;
  dynamic driverId;
  String? shippingCharges;
  dynamic shippingId;
  String? taxedAmount;
  String? discountAmount;
  dynamic couponId;
  String? grandTotal;
  String? amountReceived;
  int? totalProducts;
  int? totalQuantity;
  dynamic deliveryOtp;
  dynamic orderTimestamp;
  dynamic deliveredTimestamp;
  dynamic outForDeliveryTimestamp;
  dynamic cancelledTimestamp;
  bool? paymentInitiated;
  dynamic paymentInitiatedTimestamp;
  dynamic lastLocation;
  dynamic platform;
  dynamic version;
  dynamic uuid;
  dynamic model;
  dynamic deviceId;
  dynamic device;
  dynamic oSVersion;
  dynamic uniqueID;
  dynamic manufacturer;
  dynamic appVersion;
  dynamic createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? updatedTimestamp;
  int? userId;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic pincodeId;
  dynamic contactId;
  dynamic addressId;
  User? user;
  List<OrdersProduct>? ordersProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enabled'] = enabled;
    map['orderReference'] = orderReference;
    map['customerIP'] = customerIP;
    map['status'] = status;
    map['paymentMethod'] = paymentMethod;
    map['orderedBy'] = orderedBy;
    map['rating'] = rating;
    map['comments'] = comments;
    map['deliveryInstructions'] = deliveryInstructions;
    map['deliverySlot'] = deliverySlot;
    map['total'] = total;
    map['driverId'] = driverId;
    map['shippingCharges'] = shippingCharges;
    map['shippingId'] = shippingId;
    map['taxedAmount'] = taxedAmount;
    map['discountAmount'] = discountAmount;
    map['couponId'] = couponId;
    map['grandTotal'] = grandTotal;
    map['amountReceived'] = amountReceived;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    map['deliveryOtp'] = deliveryOtp;
    map['orderTimestamp'] = orderTimestamp;
    map['deliveredTimestamp'] = deliveredTimestamp;
    map['outForDeliveryTimestamp'] = outForDeliveryTimestamp;
    map['cancelledTimestamp'] = cancelledTimestamp;
    map['paymentInitiated'] = paymentInitiated;
    map['paymentInitiatedTimestamp'] = paymentInitiatedTimestamp;
    map['lastLocation'] = lastLocation;
    map['platform'] = platform;
    map['version'] = version;
    map['uuid'] = uuid;
    map['model'] = model;
    map['deviceId'] = deviceId;
    map['device'] = device;
    map['OSVersion'] = oSVersion;
    map['uniqueID'] = uniqueID;
    map['manufacturer'] = manufacturer;
    map['appVersion'] = appVersion;
    map['createdBy'] = createdBy;
    map['createdTimestamp'] = createdTimestamp;
    map['updatedBy'] = updatedBy;
    map['updatedTimestamp'] = updatedTimestamp;
    map['userId'] = userId;
    map['countryId'] = countryId;
    map['stateId'] = stateId;
    map['cityId'] = cityId;
    map['pincodeId'] = pincodeId;
    map['contactId'] = contactId;
    map['addressId'] = addressId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (ordersProduct != null) {
      map['ordersProduct'] = ordersProduct?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrdersProduct {
  OrdersProduct({
      this.id, 
      this.orderId, 
      this.bidId, 
      this.productId, 
      this.productsVariationId, 
      this.taxId, 
      this.categoryId, 
      this.quantity, 
      this.unitPrice, 
      this.salePrice, 
      this.subTotal, 
      this.taxedAmount, 
      this.discountAmount, 
      this.taxRate, 
      this.userId, 
      this.createdBy, 
      this.createdTimestamp, 
      this.updatedBy, 
      this.updatedTimestamp, 
      this.productsVariation, 
      this.product,});

  OrdersProduct.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['orderId'];
    bidId = json['bidId'];
    productId = json['productId'];
    productsVariationId = json['productsVariationId'];
    taxId = json['taxId'];
    categoryId = json['categoryId'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    salePrice = json['salePrice'];
    subTotal = json['subTotal'];
    taxedAmount = json['taxedAmount'];
    discountAmount = json['discountAmount'];
    taxRate = json['taxRate'];
    userId = json['userId'];
    createdBy = json['createdBy'];
    createdTimestamp = json['createdTimestamp'];
    updatedBy = json['updatedBy'];
    updatedTimestamp = json['updatedTimestamp'];
    productsVariation = json['productsVariation'] != null ? ProductsVariation.fromJson(json['productsVariation']) : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  int? orderId;
  dynamic bidId;
  int? productId;
  int? productsVariationId;
  dynamic taxId;
  int? categoryId;
  int? quantity;
  String? unitPrice;
  String? salePrice;
  String? subTotal;
  String? taxedAmount;
  String? discountAmount;
  String? taxRate;
  int? userId;
  int? createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? updatedTimestamp;
  ProductsVariation? productsVariation;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['orderId'] = orderId;
    map['bidId'] = bidId;
    map['productId'] = productId;
    map['productsVariationId'] = productsVariationId;
    map['taxId'] = taxId;
    map['categoryId'] = categoryId;
    map['quantity'] = quantity;
    map['unitPrice'] = unitPrice;
    map['salePrice'] = salePrice;
    map['subTotal'] = subTotal;
    map['taxedAmount'] = taxedAmount;
    map['discountAmount'] = discountAmount;
    map['taxRate'] = taxRate;
    map['userId'] = userId;
    map['createdBy'] = createdBy;
    map['createdTimestamp'] = createdTimestamp;
    map['updatedBy'] = updatedBy;
    map['updatedTimestamp'] = updatedTimestamp;
    if (productsVariation != null) {
      map['productsVariation'] = productsVariation?.toJson();
    }
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
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
      this.updatedTimestamp,});

  Product.fromJson(dynamic json) {
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
  String? shortDescription;
  dynamic description;
  int? brandId;
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
  dynamic createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? bidAllowed;
  String? updatedTimestamp;

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
      this.updatedTimestamp,});

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
  }
  int? id;
  bool? enabled;
  int? productId;
  String? name;
  String? unitPrice;
  String? salePrice;
  String? discountPercentage;
  dynamic sku;
  String? image;
  String? stockStatus;
  String? stockQuantity;
  bool? allowBackOrder;
  int? lowStockThreshold;
  bool? manageStock;
  dynamic createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? updatedTimestamp;

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
    return map;
  }

}

class User {
  User({
      this.id, 
      this.enabled, 
      this.fullName, 
      this.usersRoleId, 
      this.mobileNumber, 
      this.countryCode, 
      this.preferredLanguage, 
      this.emailAddress, 
      this.isEmailVerified, 
      this.isMobileVerified, 
      this.gender, 
      this.avatar, 
      this.password, 
      this.forgotPasswordHash, 
      this.forgotPasswordExpiryTimestamp, 
      this.referralCode, 
      this.canUseReferralCode, 
      this.lastLogin, 
      this.lastLocation, 
      this.lastLocationTimestamp, 
      this.lastOrderTimestamp, 
      this.lastOrderTotal, 
      this.pushId, 
      this.platform, 
      this.version, 
      this.uuid, 
      this.model, 
      this.deviceId, 
      this.device, 
      this.oSVersion, 
      this.uniqueID, 
      this.manufacturer, 
      this.appVersion, 
      this.createdBy, 
      this.createdTimestamp, 
      this.updatedBy, 
      this.updatedTimestamp, 
      this.pushUpdatedTimestamp,});

  User.fromJson(dynamic json) {
    id = json['id'];
    enabled = json['enabled'];
    fullName = json['fullName'];
    usersRoleId = json['usersRoleId'];
    mobileNumber = json['mobileNumber'];
    countryCode = json['countryCode'];
    preferredLanguage = json['preferredLanguage'];
    emailAddress = json['emailAddress'];
    isEmailVerified = json['isEmailVerified'];
    isMobileVerified = json['isMobileVerified'];
    gender = json['gender'];
    avatar = json['avatar'];
    password = json['password'];
    forgotPasswordHash = json['forgotPasswordHash'];
    forgotPasswordExpiryTimestamp = json['forgotPasswordExpiryTimestamp'];
    referralCode = json['referralCode'];
    canUseReferralCode = json['canUseReferralCode'];
    lastLogin = json['lastLogin'];
    lastLocation = json['lastLocation'];
    lastLocationTimestamp = json['lastLocationTimestamp'];
    lastOrderTimestamp = json['lastOrderTimestamp'];
    lastOrderTotal = json['lastOrderTotal'];
    pushId = json['pushId'];
    platform = json['platform'];
    version = json['version'];
    uuid = json['uuid'];
    model = json['model'];
    deviceId = json['deviceId'];
    device = json['device'];
    oSVersion = json['OSVersion'];
    uniqueID = json['uniqueID'];
    manufacturer = json['manufacturer'];
    appVersion = json['appVersion'];
    createdBy = json['createdBy'];
    createdTimestamp = json['createdTimestamp'];
    updatedBy = json['updatedBy'];
    updatedTimestamp = json['updatedTimestamp'];
    pushUpdatedTimestamp = json['pushUpdatedTimestamp'];
  }
  int? id;
  bool? enabled;
  String? fullName;
  int? usersRoleId;
  String? mobileNumber;
  dynamic countryCode;
  dynamic preferredLanguage;
  String? emailAddress;
  bool? isEmailVerified;
  bool? isMobileVerified;
  String? gender;
  String? avatar;
  String? password;
  dynamic forgotPasswordHash;
  String? forgotPasswordExpiryTimestamp;
  dynamic referralCode;
  bool? canUseReferralCode;
  dynamic lastLogin;
  dynamic lastLocation;
  dynamic lastLocationTimestamp;
  dynamic lastOrderTimestamp;
  String? lastOrderTotal;
  String? pushId;
  String? platform;
  dynamic version;
  dynamic uuid;
  dynamic model;
  String? deviceId;
  String? device;
  String? oSVersion;
  dynamic uniqueID;
  String? manufacturer;
  String? appVersion;
  dynamic createdBy;
  String? createdTimestamp;
  dynamic updatedBy;
  String? updatedTimestamp;
  String? pushUpdatedTimestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['enabled'] = enabled;
    map['fullName'] = fullName;
    map['usersRoleId'] = usersRoleId;
    map['mobileNumber'] = mobileNumber;
    map['countryCode'] = countryCode;
    map['preferredLanguage'] = preferredLanguage;
    map['emailAddress'] = emailAddress;
    map['isEmailVerified'] = isEmailVerified;
    map['isMobileVerified'] = isMobileVerified;
    map['gender'] = gender;
    map['avatar'] = avatar;
    map['password'] = password;
    map['forgotPasswordHash'] = forgotPasswordHash;
    map['forgotPasswordExpiryTimestamp'] = forgotPasswordExpiryTimestamp;
    map['referralCode'] = referralCode;
    map['canUseReferralCode'] = canUseReferralCode;
    map['lastLogin'] = lastLogin;
    map['lastLocation'] = lastLocation;
    map['lastLocationTimestamp'] = lastLocationTimestamp;
    map['lastOrderTimestamp'] = lastOrderTimestamp;
    map['lastOrderTotal'] = lastOrderTotal;
    map['pushId'] = pushId;
    map['platform'] = platform;
    map['version'] = version;
    map['uuid'] = uuid;
    map['model'] = model;
    map['deviceId'] = deviceId;
    map['device'] = device;
    map['OSVersion'] = oSVersion;
    map['uniqueID'] = uniqueID;
    map['manufacturer'] = manufacturer;
    map['appVersion'] = appVersion;
    map['createdBy'] = createdBy;
    map['createdTimestamp'] = createdTimestamp;
    map['updatedBy'] = updatedBy;
    map['updatedTimestamp'] = updatedTimestamp;
    map['pushUpdatedTimestamp'] = pushUpdatedTimestamp;
    return map;
  }

}