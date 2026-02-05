import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  try {
    return Supabase.instance.client;
  } catch (e) {
    // Return a mock client if Supabase is not initialized
    // This will cause queries to fail and fall back to mock data
    throw Exception('Supabase not initialized. Using mock data.');
  }
});
