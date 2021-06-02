class Patient {
  String? sId;
  String? name;
  String? naturalness;
  String? maritalStatus;
  String? cpf;
  String? rg;
  String? birthDate;
  String? genre;
  String? email;
  String? cep;
  String? address;
  String? district;
  String? city;
  String? state;
  String? telephone;
  String? cellphone;
  String? profession;
  String? userId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Patient(
      {this.sId,
      this.name,
      this.naturalness,
      this.maritalStatus,
      this.cpf,
      this.rg,
      this.birthDate,
      this.genre,
      this.email,
      this.cep,
      this.address,
      this.district,
      this.city,
      this.state,
      this.telephone,
      this.cellphone,
      this.profession,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Patient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    naturalness = json['naturalness'];
    maritalStatus = json['maritalStatus'];
    cpf = json['cpf'];
    rg = json['rg'];
    birthDate = json['birthDate'];
    genre = json['genre'];
    email = json['email'];
    cep = json['cep'];
    address = json['address'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
    telephone = json['telephone'];
    cellphone = json['cellphone'];
    profession = json['profession'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['naturalness'] = this.naturalness;
    data['maritalStatus'] = this.maritalStatus;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    data['birthDate'] = this.birthDate;
    data['genre'] = this.genre;
    data['email'] = this.email;
    data['cep'] = this.cep;
    data['address'] = this.address;
    data['district'] = this.district;
    data['city'] = this.city;
    data['state'] = this.state;
    data['telephone'] = this.telephone;
    data['cellphone'] = this.cellphone;
    data['profession'] = this.profession;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
