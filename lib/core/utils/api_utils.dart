// ignore_for_file: constant_identifier_names

class API {
  static String requestImg(String img) => 'https://image.tmdb.org/t/p/w500/$img';
  
  static String requestMoviesList(int list, int page) => 'list/$list?page=$page';

  // static const REQUEST_MOVIE_LIST = 'list/1?page=1';
}
