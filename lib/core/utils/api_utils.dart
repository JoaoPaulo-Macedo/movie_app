// ignore_for_file: constant_identifier_names

class API {
  static const _apiKey = '21fe132d9740e702eadbfa7c5f8476ff';

  static requestImg(String img) => 'https://image.tmdb.org/t/p/w500/$img';

  static requestMoviesList(int list, int page) => '4/list/$list?page=$page';

  static const requestToken = '3/authentication/token/new?api_key=$_apiKey';
  static const validateWithLogin =
      '3/authentication/token/validate_with_login?api_key=$_apiKey';
  static const createSession = '3/authentication/session/new?api_key=$_apiKey';

  static requestAccountDetails(String sessionId) =>
      '3/account?api_key=$_apiKey&session_id=$sessionId';

  static requestFavoritesList({
    required String page,
    required String accountId,
    required String sessionId,
  }) {
    return '3/account/$accountId/favorite/movies?api_key=$_apiKey&session_id=$sessionId&page=$page';
  }

  static toggleFavorite({required String accountId, required String sessionId}) {
    return '3/account/$accountId/favorite?api_key=$_apiKey&session_id=$sessionId';
  }

  // static const REQUEST_MOVIE_LIST = 'list/1?page=1';
}
