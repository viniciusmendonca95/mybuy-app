class Photos {
  String name;
  String mimiType;
  String url;

  Photos({this.name, this.mimiType, this.url});

  Photos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mimiType = json['mimiType'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mimiType'] = this.mimiType;
    data['url'] = this.url;
    return data;
  }
}
