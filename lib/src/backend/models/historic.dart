class Historic {
  String? usuarioid;
  String? servicioid;
  int? cantidad;
  double? total;
  String? fechacompra;

  Historic(
      {this.usuarioid,
      this.servicioid,
      this.cantidad,
      this.total,
      this.fechacompra});

  Historic.fromJson(Map<String, dynamic> json) {
    usuarioid = json['usuarioid'];
    servicioid = json['servicioid'];
    cantidad = json['cantidad'];
    total = json['total'];
    fechacompra = json['fechacompra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioid'] = this.usuarioid;
    data['servicioid'] = this.servicioid;
    data['cantidad'] = this.cantidad;
    data['total'] = this.total;
    data['fechacompra'] = this.fechacompra;
    return data;
  }
}