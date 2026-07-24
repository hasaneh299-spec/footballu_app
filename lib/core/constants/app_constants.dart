class AppConstants {
  static const String appName = 'Football App';
  static const String baseUrl = 'https://api.football-data.org/v4/';
  
  // Storage Keys
  static const String themeKey = 'is_dark_mode';
  static const String langKey = 'app_language';
  static const String favoritesKey = 'favorite_teams';
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
}
