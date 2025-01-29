 class ApiConstants{
  static const String baseUrl ='https://api.themoviedb.org/3';
  static const String apiKey='api_key=8afd0264e8f3f2fe92c77ea224bd1012';
  static const String getNowPlayingMoviesEndpoint = '/movie/now_playing?';
  static const String getPopularMoviesEndpoint = '/movie/popular?';
  static const String getTopRatedMoviesEndpoint = '/movie/top_rated?';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String movieDetailsEndPoint(int movieId) =>
      "/movie/${movieId.toString()}?";

  static String recommendationsEndPoint(int movieId) =>
      "/movie/${movieId.toString()}/recommendations?";

  static String imageUrl(String bath)=>'$baseImageUrl$bath';
}