import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  const User(
      {this.id, this.username, this.email, this.firstname, this.lastname});

  final String? id;
  final String? username;
  final String? email;
  final String? firstname;
  final String? lastname;

  @override
  List<Object?> get props => [id, username, email, firstname, lastname];

  static const empty = User();
}
