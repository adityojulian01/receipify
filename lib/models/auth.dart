import 'dart:ffi';

class UserAuth {
  late int id_;
  late String username_;
  late String email_;

  int get id => this.id_;

  set id(int value) => this.id_ = value;

  get username => this.username_;

  set username(value) => this.username_ = value;

  get email => this.email_;

  set email(value) => this.email_ = value;
}

late int? idAuth;
late String? userNameAuth;
late String? emailAuth;
late String? accessToken;
