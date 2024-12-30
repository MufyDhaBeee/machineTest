class ViewUsersModelClass {
  String? sId;
  String? name;
  String? email;
  String? address;
  int? iV;

  ViewUsersModelClass({this.sId, this.name, this.email, this.address, this.iV});

  ViewUsersModelClass.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['__v'] = this.iV;
    return data;
  }
}
