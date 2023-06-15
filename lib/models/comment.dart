class Comment {
  int id;
  String comment;
  String user_name;

  // User  user;

  Comment({
    required this.id,
    required this.comment,
    required  this.user_name
  });

  // map json to comment model
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      comment: json['data'],
      user_name:json['user']['name']
      /*user: User(
        id: json['user']['id'],
        name: json['user']['name'],
        image: json['user']['image']
      )*/
    );
  }
}
