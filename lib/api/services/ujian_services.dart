import 'package:dio/dio.dart';
import 'package:mobile_app/api/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UjianServices {
  // ignore: unnecessary_new
  static BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
  );

  static Dio dio = Dio(options);
  static Response? response;

  static Future getListUjian(int kelasId) async {
    return await dio.get(
      "/getUjianSiswa",
      queryParameters: {"id": kelasId},
    );
  }

  static Future getSoalByUjian(int ujianId) async {
    return await dio.get(
      "/getSoalByUjian/$ujianId",
    );
  }

  static Future getSoalById(int soalId) async {
    return await dio.get(
      "/getSoalById/$soalId",
    );
  }

  static Future cekJawaban({
    int? soalId,
    int? ujianId,
  }) async {
    try {
      SharedPreferences sp = await SharedPreferences.getInstance();
      int siswaId = sp.getInt("siswaId")!;
      // print("siswaId : ${siswaId.toString()}");
      // print("soalId : ${soalId.toString()}");
      // print("ujian_id : ${ujianId.toString()}");
      Map<String, dynamic> dataCekSoal = {
        "user_id": siswaId,
        "ujian_id": ujianId,
        "soal_id": soalId,
      };
      response = await dio.get(
        '/cekJawaban',
        queryParameters: dataCekSoal,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      return response;
    } on DioError catch (ex) {
      // ignore: avoid_print
      print(ex.error.toString());
      if (ex.type == DioErrorType.response) {
        // ignore: avoid_print
        print("login form Error");
        if (ex.response?.statusCode == 404) {
          // ignore: avoid_print
          print("warning api");
        }
      } else if (ex.type == DioErrorType.response) {
        // ignore: avoid_print
        print("error default");
        throw Exception(ex.error.message);
      } else {
        // ignore: avoid_print
        print("timeout");
      }
    }
  }

  static Future addJawaban(
    int soalId,
    int ujianId,
    String jawaban,
    String opsi,
  ) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int siswaId = sp.getInt("siswaId")!;
    Map<String, dynamic> dataJawaban = {
      "soal_id": soalId,
      "ujian_id": ujianId,
      "siswa_id": siswaId,
      "isi_jawaban": jawaban,
      "opsi_jawaban": opsi,
    };
    return await dio.post(
      "/jawaban",
      data: dataJawaban,
    );
  }

  static Future updateJawaban(
    int idJawaban,
    int soalId,
    int ujianId,
    String jawaban,
    String opsi,
  ) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int siswaId = sp.getInt("siswaId")!;
    Map<String, dynamic> dataJawaban = {
      "soal_id": soalId,
      "ujian_id": ujianId,
      "siswa_id": siswaId,
      "isi_jawaban": jawaban,
      "opsi_jawaban": opsi,
    };
    return await dio.put(
      "/jawaban/$idJawaban",
      data: dataJawaban,
    );
  }

  static Future addNilai(int ujianId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int siswaId = sp.getInt("siswaId")!;
    Map<String, dynamic> dataNilai = {
      "ujian_id": ujianId,
      "siswa_id": siswaId,
    };
    return await dio.get("/addNilai", queryParameters: dataNilai);
  }
}
