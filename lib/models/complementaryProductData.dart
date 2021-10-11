class ComplementaryProductData {
  int warrantyTime;
  int weight;

  ComplementaryProductData({this.warrantyTime, this.weight});

  ComplementaryProductData.fromJson(Map<String, dynamic> json) {
    warrantyTime = json['warrantyTime'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warrantyTime'] = this.warrantyTime;
    data['weight'] = this.weight;
    return data;
  }
}
