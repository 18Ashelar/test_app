// ignore_for_file: public_member_api_docs, sort_constructors_first
class Properties {
  final String? contractor;
  final String? uid;
  Properties({
    this.contractor,
    this.uid,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'contractor': contractor,
      'uid': uid,
    };
  }

  factory Properties.fromJson(Map<String, dynamic> map) {
    return Properties(
      contractor:
          map['contractor'] != null ? map['contractor'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
    );
  }

  @override
  String toString() => 'Properties(contractor: $contractor, uid: $uid)';
}
