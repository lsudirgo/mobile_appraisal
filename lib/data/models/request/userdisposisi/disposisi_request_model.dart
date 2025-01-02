class DisposisiRequest {
  final String appraisalID;
  final String tipeID;
  final String userONDESKID;
  final String? userOTSID;

  DisposisiRequest({
    required this.appraisalID,
    required this.tipeID,
    required this.userONDESKID,
    this.userOTSID,
  });

  Map<String, dynamic> toJson() {
    return {
      'appraisalID': appraisalID,
      'tipeID': tipeID,
      'userONDESKID': userONDESKID,
      'userOTSID': userOTSID, // Null-safe: if null, it will be omitted
    };
  }

  static fromMap(jsonData) {}
}
