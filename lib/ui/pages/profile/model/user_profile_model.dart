

class UserProfileModel {
  final String uid;
  final String name;
  final int level;
  final int xp;
  final String? photoUrl;

  UserProfileModel({
    required this.uid,
    required this.name,
    required this.level,
    required this.xp,
    this.photoUrl,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserProfileModel(
      uid: uid,
      name: data['name'] ?? '',
      level: data['level'] ?? 1,
      xp: data['xp'] ?? 0,
      photoUrl: data['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'level': level,
      'xp': xp,
      'photoUrl': photoUrl,
    };
  }
}