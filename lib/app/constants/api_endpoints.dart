class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 5000);
  static const Duration receiveTimeout = Duration(seconds: 5000);

  //IP for iPhone
  static const String baseUrl = 'http://localhost:8000/';

  //Auth Endpoints

  static const String login = 'api/auth/login';
  static const String register = 'api/auth/register';
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";
}
