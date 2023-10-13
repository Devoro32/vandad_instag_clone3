// ignore_for_file: public_member_api_docs, sort_constructors_first
//https://youtu.be/vtGCteFYs4M?t=17668
import 'dart:convert';

import 'package:vandad_insta_gram3/export.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;
  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
  });
  //https://youtu.be/vtGCteFYs4M?t=17756
  //when you first login, your state is unknown
  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userId = null;

  //https://youtu.be/vtGCteFYs4M?t=17803
  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
      );

  //https://youtu.be/vtGCteFYs4M?t=17801
  //implement equality for RP
  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  //https://youtu.be/vtGCteFYs4M?t=17901
  @override
  //int get hashCode => result.hashCode ^ isLoading.hashCode ^ userId.hashCode; AUTO generated
  int get hasCode => Object.hash(
        result,
        isLoading,
        userId,
      );
}
