/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static String base_url = 'https://smdb.sadeem-lab.com/';
  static String v1 = 'api/v1';
  static String base = base_url + v1;

  static String movies = '$base/movies';
  static String actors = '$base/actors';
  static String genres = '$base/genres';


  static String post(String? id) => '$base/post/$id';


}
