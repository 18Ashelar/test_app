// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class LoginData {
  final String? session_token;
  final String? detail;
  LoginData({
    this.session_token,
    this.detail,
  });

  @override
  String toString() => 'LoginData(session_token: $session_token, detail: $detail)';

 

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'session_token': session_token,
      'detail': detail,
    };
  }

  factory LoginData.fromJson(Map<String, dynamic> map) {
    return LoginData(
      session_token: map['session_token'] != null ? map['session_token'] as String : null,
      detail: map['detail'] != null ? map['detail'] as String : null,
    );
  }
}
