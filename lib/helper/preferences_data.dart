import 'package:shared_preferences/shared_preferences.dart';

class PreferencesData {
  Future setUserData(
    int siswaId,
    int kelasId,
    String siswaName,
    String kelasName,
  ) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("siswaId", siswaId);
    sp.setInt("kelasId", kelasId);
    sp.setString("siswaName", siswaName);
    sp.setString("kelasName", kelasName);
  }

  Future setUjianId(int ujianId) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("ujianId", ujianId);
  }
}
