import 'dart:convert';

import 'package:sandbox/api/models/photos_model.dart';
import 'package:sandbox/constants/constants.dart';
import 'package:http/http.dart' as http;

class PhotosApi {
  Future<List<PhotosModel>> getPhotos(int page) async {
    var params = {
      'per_page': '10',
      'page': page.toString(),
      'client_id':
          'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9',
    };

    var uri = Uri.https(Constants.BASE_URL, Constants.PHOTOS, params);

    var request = await http.get(uri);

    final json = jsonDecode(request.body) as List<dynamic>;

    return json
        .map((e) => PhotosModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
