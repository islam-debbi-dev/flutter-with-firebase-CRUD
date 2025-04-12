class PersonModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? age;
  final String? date;

  PersonModel({
    this.date,
    this.id,
    this.name,
    this.email,
    this.password,
    this.age,
  });
  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
      password: json['password'],
      date: json['date'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      
    };
  }
}
