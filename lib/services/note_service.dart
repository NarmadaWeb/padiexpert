import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class NoteService {
  static const String _notePrefix = 'calendar_note_';

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  Future<void> saveNoteForDate(DateTime date, String note) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _notePrefix + _formatDate(date);
    await prefs.setString(key, note);
  }

  Future<String> getNoteForDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _notePrefix + _formatDate(date);
    return prefs.getString(key) ?? '';
  }
}
