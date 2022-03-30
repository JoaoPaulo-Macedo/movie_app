// ignore_for_file: constant_identifier_names

class API {
  static String requestImg(String img) => 'https://image.tmdb.org/t/p/w500/$img';

  static const REQUEST_MOVIE_LIST = 'list/4?page=1';
}
