class ShopPageModel {
  String message;
  String code;
  List<Data> data;

  ShopPageModel({this.message, this.code, this.data});

  ShopPageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var top;
  String backgroundColor;
  var bottom;
  String backgroundImage;
  List<ImageUrl> imageUrl;
  var type;
  List<ListGoods> listGoods;
  Spike spike;

  Data(
      {this.top,
      this.backgroundColor,
      this.bottom,
      this.backgroundImage,
      this.imageUrl,
      this.type,
      this.listGoods,
      this.spike});

  Data.fromJson(Map<String, dynamic> json) {
    top = json['top'];
    backgroundColor = json['background_color'];
    bottom = json['bottom'];
    backgroundImage = json['backgroundImage'];
    if (json['ImageUrl'] != null) {
      imageUrl = new List<ImageUrl>();
      json['ImageUrl'].forEach((v) {
        imageUrl.add(new ImageUrl.fromJson(v));
      });
    }
    type = json['type'];
    if (json['ListGoods'] != null) {
      listGoods = new List<ListGoods>();
      json['ListGoods'].forEach((v) {
        listGoods.add(new ListGoods.fromJson(v));
      });
    }
    spike = json['spike'] != null ? new Spike.fromJson(json['spike']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['top'] = this.top;
    data['background_color'] = this.backgroundColor;
    data['bottom'] = this.bottom;
    data['backgroundImage'] = this.backgroundImage;
    if (this.imageUrl != null) {
      data['ImageUrl'] = this.imageUrl.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    if (this.listGoods != null) {
      data['ListGoods'] = this.listGoods.map((v) => v.toJson()).toList();
    }
    if (this.spike != null) {
      data['spike'] = this.spike.toJson();
    }
    return data;
  }
}

class ImageUrl {
  String id;
  String moduleId;
  String imgFlag;
  String imgId;
  String url;
  String productId;
  var imgWidth;
  var imgHeight;
  String addTime;
  var displayOrder;
  var deleteStatus;
  var isShow;
  Null title;
  Null secTitle;

  ImageUrl(
      {this.id,
      this.moduleId,
      this.imgFlag,
      this.imgId,
      this.url,
      this.productId,
      this.imgWidth,
      this.imgHeight,
      this.addTime,
      this.displayOrder,
      this.deleteStatus,
      this.isShow,
      this.title,
      this.secTitle});

  ImageUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleId = json['module_id'];
    imgFlag = json['img_flag'];
    imgId = json['img_id'];
    url = json['url'];
    productId = json['product_id'];
    imgWidth = json['img_width'];
    imgHeight = json['img_height'];
    addTime = json['add_time'];
    displayOrder = json['display_order'];
    deleteStatus = json['delete_status'];
    isShow = json['is_show'];
    title = json['title'];
    secTitle = json['sec_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['module_id'] = this.moduleId;
    data['img_flag'] = this.imgFlag;
    data['img_id'] = this.imgId;
    data['url'] = this.url;
    data['product_id'] = this.productId;
    data['img_width'] = this.imgWidth;
    data['img_height'] = this.imgHeight;
    data['add_time'] = this.addTime;
    data['display_order'] = this.displayOrder;
    data['delete_status'] = this.deleteStatus;
    data['is_show'] = this.isShow;
    data['title'] = this.title;
    data['sec_title'] = this.secTitle;
    return data;
  }
}

class ListGoods {
  String goodsDetails;
  String goodsId;
  var goodsCurrentPrice;
  var goodsPric;
  String goodsName;

  ListGoods(
      {this.goodsDetails,
      this.goodsId,
      this.goodsCurrentPrice,
      this.goodsPric,
      this.goodsName});

  ListGoods.fromJson(Map<String, dynamic> json) {
    goodsDetails = json['goodsDetails'];
    goodsId = json['goodsId'];
    goodsCurrentPrice = json['goodsCurrentPrice'];
    goodsPric = json['goodsPric'];
    goodsName = json['goodsName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsDetails'] = this.goodsDetails;
    data['goodsId'] = this.goodsId;
    data['goodsCurrentPrice'] = this.goodsCurrentPrice;
    data['goodsPric'] = this.goodsPric;
    data['goodsName'] = this.goodsName;
    return data;
  }
}

class Spike {
  SpikeDetails spikeDetails;
  List<GoodsList> goodsList;

  Spike({this.spikeDetails, this.goodsList});

  Spike.fromJson(Map<String, dynamic> json) {
    spikeDetails = json['spikeDetails'] != null
        ? new SpikeDetails.fromJson(json['spikeDetails'])
        : null;
    if (json['goodsList'] != null) {
      goodsList = new List<GoodsList>();
      json['goodsList'].forEach((v) {
        goodsList.add(new GoodsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.spikeDetails != null) {
      data['spikeDetails'] = this.spikeDetails.toJson();
    }
    if (this.goodsList != null) {
      data['goodsList'] = this.goodsList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpikeDetails {
  String id;
  Null addtime;
  Null deletestatus;
  bool status;
  Null goodsId;
  Null goodsPrice;
  var warmupTime;
  var beginTime;
  var endTime;
  var systemTime;
  Null picPath;
  Null goodsCount;
  Null userLimit;
  Null remark;
  Null residualTimeColor;
  Null titleMoreColor;
  Null startEndColor;
  Null backgroundType;
  Null backgroundColor;
  Null backgroundImg;

  SpikeDetails(
      {this.id,
      this.addtime,
      this.deletestatus,
      this.status,
      this.goodsId,
      this.goodsPrice,
      this.warmupTime,
      this.beginTime,
      this.endTime,
      this.systemTime,
      this.picPath,
      this.goodsCount,
      this.userLimit,
      this.remark,
      this.residualTimeColor,
      this.titleMoreColor,
      this.startEndColor,
      this.backgroundType,
      this.backgroundColor,
      this.backgroundImg});

  SpikeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addtime = json['addtime'];
    deletestatus = json['deletestatus'];
    status = json['status'];
    goodsId = json['goodsId'];
    goodsPrice = json['goodsPrice'];
    warmupTime = json['warmupTime'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    systemTime = json['systemTime'];
    picPath = json['picPath'];
    goodsCount = json['goodsCount'];
    userLimit = json['userLimit'];
    remark = json['remark'];
    residualTimeColor = json['residualTimeColor'];
    titleMoreColor = json['titleMoreColor'];
    startEndColor = json['startEndColor'];
    backgroundType = json['backgroundType'];
    backgroundColor = json['backgroundColor'];
    backgroundImg = json['backgroundImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['addtime'] = this.addtime;
    data['deletestatus'] = this.deletestatus;
    data['status'] = this.status;
    data['goodsId'] = this.goodsId;
    data['goodsPrice'] = this.goodsPrice;
    data['warmupTime'] = this.warmupTime;
    data['beginTime'] = this.beginTime;
    data['endTime'] = this.endTime;
    data['systemTime'] = this.systemTime;
    data['picPath'] = this.picPath;
    data['goodsCount'] = this.goodsCount;
    data['userLimit'] = this.userLimit;
    data['remark'] = this.remark;
    data['residualTimeColor'] = this.residualTimeColor;
    data['titleMoreColor'] = this.titleMoreColor;
    data['startEndColor'] = this.startEndColor;
    data['backgroundType'] = this.backgroundType;
    data['backgroundColor'] = this.backgroundColor;
    data['backgroundImg'] = this.backgroundImg;
    return data;
  }
}

class GoodsList {
  String id;
  String goodsId;
  String goodsName;
  String goodsPrice;
  String spikePrice;
  var goodsCount;
  String goodsDesc;
  var spikeCount;
  var purchaseQuantity;
  var restrictionQuantity;
  String photo;
  String goodsSubtitleAsserted;

  GoodsList(
      {this.id,
      this.goodsId,
      this.goodsName,
      this.goodsPrice,
      this.spikePrice,
      this.goodsCount,
      this.goodsDesc,
      this.spikeCount,
      this.purchaseQuantity,
      this.restrictionQuantity,
      this.photo,
      this.goodsSubtitleAsserted});

  GoodsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    goodsPrice = json['goodsPrice'];
    spikePrice = json['spikePrice'];
    goodsCount = json['goodsCount'];
    goodsDesc = json['goodsDesc'];
    spikeCount = json['spikeCount'];
    purchaseQuantity = json['purchaseQuantity'];
    restrictionQuantity = json['restrictionQuantity'];
    photo = json['photo'];
    goodsSubtitleAsserted = json['goodsSubtitleAsserted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['goodsPrice'] = this.goodsPrice;
    data['spikePrice'] = this.spikePrice;
    data['goodsCount'] = this.goodsCount;
    data['goodsDesc'] = this.goodsDesc;
    data['spikeCount'] = this.spikeCount;
    data['purchaseQuantity'] = this.purchaseQuantity;
    data['restrictionQuantity'] = this.restrictionQuantity;
    data['photo'] = this.photo;
    data['goodsSubtitleAsserted'] = this.goodsSubtitleAsserted;
    return data;
  }
}
