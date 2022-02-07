class Usuario {
  String user_name;
  String user_pass;

  Usuario(this.user_name, this.user_pass);

  Map<String, dynamic> toMap() => {
        'user': user_name,
        'pass': user_pass,
      };

  Usuario.fromMap(Map<String, dynamic> map) {
    user_name = map['user_name'];
    user_pass = map['pass'];
  }
}
