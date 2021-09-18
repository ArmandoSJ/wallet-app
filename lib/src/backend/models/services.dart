class Services {
  String servicename;
  String description;
  double price;
  bool available;
  String category;

  Services(
      {this.servicename ="",
      this.description ="",
      this.price = 0,
      this.available = true,
      this.category = ""});

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    servicename : json['servicename'],
    description : json['description'],
    price : json['price'],
    available : json['available'],
    category : json['category'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servicename'] = this.servicename;
    data['description'] = this.description;
    data['price'] = this.price;
    data['available'] = this.available;
    data['category'] = this.category;
    return data;
  }
}