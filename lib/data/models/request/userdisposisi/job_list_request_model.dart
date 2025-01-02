class ListUserDisposisiRequest {
  final int page;
  final int limit;
  final String? q;

  ListUserDisposisiRequest({
    required this.page,
    required this.limit,
    this.q,
  });
}
