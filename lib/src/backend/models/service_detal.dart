class Credits {
  double? credits;

  Credits({this.credits});

  Credits.fromJson(Map<String, dynamic> json) {
    credits = json['credits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credits'] = this.credits;
    return data;
  }
}