import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://mhjdrtiobknptepcxpxc.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1oamRydGlvYmtucHRlcGN4cHhjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE0MjgxOTEsImV4cCI6MjA4NzAwNDE5MX0.cRNb5ajWhicXTwCj0cEcRao_UTW-GMXw5bwd6jdZt4c';

  static SupabaseClient get client => Supabase.instance.client;

  // Authentication
  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? metadata,
  }) async {
    return await client.auth.signUp(
      email: email,
      password: password,
      data: metadata,
    );
  }

  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static User? get currentUser => client.auth.currentUser;
  static Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;

  // User Profile
  static Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final response = await client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();
    return response;
  }

  static Future<void> updateUserProfile(
    String userId,
    Map<String, dynamic> updates,
  ) async {
    await client.from('profiles').update(updates).eq('id', userId);
  }

  // Wallet
  static Future<Map<String, dynamic>?> getWalletBalance(String userId) async {
    final response = await client
        .from('wallets')
        .select()
        .eq('user_id', userId)
        .single();
    return response;
  }

  static Future<void> updateWalletBalance(
    String userId,
    double amount,
  ) async {
    await client
        .from('wallets')
        .update({'balance': amount})
        .eq('user_id', userId);
  }

  static Future<List<Map<String, dynamic>>> getTransactions(
    String userId,
  ) async {
    final response = await client
        .from('transactions')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .limit(50);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<void> addTransaction(
    String userId,
    Map<String, dynamic> transaction,
  ) async {
    await client.from('transactions').insert({
      'user_id': userId,
      ...transaction,
    });
  }

  // Events
  static Future<List<Map<String, dynamic>>> getEvents() async {
    final response = await client
        .from('events')
        .select()
        .order('event_date', ascending: true);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<Map<String, dynamic>?> getEvent(String eventId) async {
    final response = await client
        .from('events')
        .select()
        .eq('id', eventId)
        .single();
    return response;
  }

  static Future<void> registerForEvent(String userId, String eventId) async {
    await client.from('event_registrations').insert({
      'user_id': userId,
      'event_id': eventId,
    });
  }

  static Future<bool> isRegisteredForEvent(
    String userId,
    String eventId,
  ) async {
    final response = await client
        .from('event_registrations')
        .select()
        .eq('user_id', userId)
        .eq('event_id', eventId)
        .maybeSingle();
    return response != null;
  }

  // Announcements
  static Future<List<Map<String, dynamic>>> getAnnouncements() async {
    final response = await client
        .from('announcements')
        .select()
        .order('created_at', ascending: false)
        .limit(50);
    return List<Map<String, dynamic>>.from(response);
  }

  // Attendance
  static Future<List<Map<String, dynamic>>> getAttendanceRecords(
    String userId,
  ) async {
    final response = await client
        .from('attendance')
        .select()
        .eq('user_id', userId)
        .order('attendance_date', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  static Future<Map<String, dynamic>> getAttendanceStats(String userId) async {
    final records = await getAttendanceRecords(userId);
    final total = records.length;
    final present = records.where((r) => r['status'] == 'present').length;
    final absent = total - present;
    final percentage = total > 0 ? (present / total * 100).round() : 0;

    return {
      'total': total,
      'present': present,
      'absent': absent,
      'percentage': percentage,
    };
  }

  static Future<void> markAttendance(
    String userId,
    String qrCode,
    String status,
  ) async {
    await client.from('attendance').insert({
      'user_id': userId,
      'qr_code': qrCode,
      'status': status,
      'attendance_date': DateTime.now().toIso8601String(),
    });
  }
}
