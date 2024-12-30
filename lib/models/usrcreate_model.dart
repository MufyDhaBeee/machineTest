class CreateUserModelClass {
  String? name;
  String? email;
  String? address;
  String? sId;
  int? iV;

  CreateUserModelClass(
      {this.name, this.email, this.address, this.sId, this.iV});

  CreateUserModelClass.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
