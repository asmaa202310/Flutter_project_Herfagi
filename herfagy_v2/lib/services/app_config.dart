class AppConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const webClientId = String.fromEnvironment('GCP_WEB_CLIENT_ID');
  static const androidClientId = String.fromEnvironment(
    'GCP_ANDROID_CLIENT_ID',
  );
}
