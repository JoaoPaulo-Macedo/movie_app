// ignore_for_file: constant_identifier_names

class API {
  static String requestImg(String img) => 'https://image.tmdb.org/t/p/w500/$img';

  static String requestMoviesList(int list, int page) => '4/list/$list?page=$page';

  static const String _apiKey = '21fe132d9740e702eadbfa7c5f8476ff';

  static const String requestToken = '3/authentication/token/new?api_key=$_apiKey';
  static const String validateWithLogin =
      '3/authentication/token/validate_with_login?api_key=$_apiKey';
  static const String createSession = '3/authentication/session/new?api_key=$_apiKey';

  // static const REQUEST_MOVIE_LIST = 'list/1?page=1';
}
