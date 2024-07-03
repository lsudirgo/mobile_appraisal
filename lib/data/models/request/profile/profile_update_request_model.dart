class ProfileUpdate {
  final String? level;
  final String jabatanID;
  final String? gender;

  ProfileUpdate({
    required this.level,
    required this.jabatanID,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'level': level ?? '',
      'jabatanID': jabatanID,
      'gender': gender ?? '',
    };
  }
}
