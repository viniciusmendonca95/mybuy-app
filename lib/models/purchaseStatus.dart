class PurchaseStatus {
  String id;
  int code;
  String name;
  String description;

  PurchaseStatus({this.id, this.code, this.name, this.description});

  PurchaseStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
