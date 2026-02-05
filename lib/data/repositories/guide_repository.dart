import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/visa_model.dart';
import '../models/topik_model.dart';
import 'supabase_provider.dart';

class GuideRepository {
  final SupabaseClient _supabaseClient;

  GuideRepository(this._supabaseClient);

  Future<List<VisaGuide>> fetchVisaList() async {
    try {
      final response = await _supabaseClient
          .from('visa_guides')
          .select()
          .order('created_at', ascending: false);

      if (response.isEmpty) {
        return [];
      }

      return (response as List)
          .map((data) => VisaGuide.fromJson(data as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch visa guides: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch visa guides: $e');
    }
  }

  Future<VisaGuide> fetchVisaById(String id) async {
    try {
      final response = await _supabaseClient
          .from('visa_guides')
          .select()
          .eq('id', id)
          .single();

      return VisaGuide.fromJson(response as Map<String, dynamic>);
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch visa guide: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch visa guide: $e');
    }
  }

  Future<List<TopikGuide>> fetchTopikList() async {
    try {
      final response = await _supabaseClient
          .from('topik_guides')
          .select()
          .order('created_at', ascending: false);

      if (response.isEmpty) {
        return [];
      }

      return (response as List)
          .map((data) => TopikGuide.fromJson(data as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch TOPIK guides: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch TOPIK guides: $e');
    }
  }

  Future<TopikGuide> fetchTopikById(String id) async {
    try {
      final response = await _supabaseClient
          .from('topik_guides')
          .select()
          .eq('id', id)
          .single();

      return TopikGuide.fromJson(response as Map<String, dynamic>);
    } on PostgrestException catch (e) {
      throw Exception('Failed to fetch TOPIK guide: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch TOPIK guide: $e');
    }
  }
}

final guideRepositoryProvider = Provider<GuideRepository>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return GuideRepository(supabaseClient);
});
