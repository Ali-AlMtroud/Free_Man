class User {
  int id;
  String  Fname;
  String Lname;
 String link;
  String email;
  String location;
  String token;
  String jobTittle;
  String phone;

  User({
    required  this.id,
    required   this.Fname,
    required   this.Lname,
    required    this.email,
    required this.location,
    required  this.token,
    required this.link,
    required this.jobTittle,
    required this.phone
  });


  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['data']['id'],
      Fname: json['data']['Fname'],
      Lname: json['data']['Fname'],
      email: json['data']['email'],
      link: json['data']['link'],
      location: json['data']['location'],
      jobTittle: json['data']['jobTittle'],
      phone: json['data']['phone'],
      token: json['token'],

    );
  }
}