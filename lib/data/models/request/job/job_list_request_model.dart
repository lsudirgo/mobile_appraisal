class JobListRequest {
  final int page;
  final int limit;
  final int flagpetugas;
  final int status;
  final String? q;
  final String? uker;

  JobListRequest({
    required this.page,
    required this.limit,
    required this.flagpetugas,
    required this.status,
    this.q,
    this.uker,
  });
}
