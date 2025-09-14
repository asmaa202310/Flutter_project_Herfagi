import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:herfagy_v2/app_config.dart';
import 'package:herfagy_v2/viewmodels/supabase/ModelsOperationsViewModel/order_operation_view_model.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_facebook_model_view.dart';
import 'package:herfagy_v2/viewmodels/supabase/auth_google_model_view.dart';
import 'package:herfagy_v2/viewmodels/supabase/modelsOperationsViewModel/profile_operation_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;
Future<void> setup() async {
  final GoogleSignIn signIn = GoogleSignIn.instance;
  signIn.initialize(
    clientId: AppConfig.androidClientId,
    serverClientId: AppConfig.webClientId,
  );

  final supabase = await Supabase.initialize(
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseKey,
  );

  sl.registerSingleton<Supabase>(supabase);
  sl.registerLazySingleton<SupabaseClient>(() => supabase.client);
  sl.registerLazySingleton<AuthGoogleModelView>(() => AuthGoogleModelView());
  
  sl.registerLazySingleton<AuthFacebookModelView>(
    () => AuthFacebookModelView(),
  );
  sl.registerLazySingleton<ProfileOperationViewModel>(
    () => ProfileOperationViewModel(),
  );
  sl.registerLazySingleton<OrderOperationViewModel>(
    () => OrderOperationViewModel(),
  );
}
