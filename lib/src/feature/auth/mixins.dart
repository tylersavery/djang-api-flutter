mixin class ApiMixins {
  Map<String, dynamic> apiLimit(int limit) {
    return {'limit': limit};
  }

  Map<String, dynamic> apiPage(int page) {
    return {'page': page};
  }
}
