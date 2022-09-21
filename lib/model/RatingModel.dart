class RatingModel {
  double? rate;
  int? count;

  RatingModel({
    this.rate,
    this.count,
  });

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = double.parse(json['rate'].toString());
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
