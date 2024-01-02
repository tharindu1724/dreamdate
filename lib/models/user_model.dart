class UserModel {
  String username;
  String email;
  String id;

  UserModel({required this.username, required this.email, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'], email: json['email'], id: json['id']);
  }

  Map<String,dynamic>toJson(){

    return{
      'username': username,
      'email':email,
      'id': id

    };
  }
  
}
