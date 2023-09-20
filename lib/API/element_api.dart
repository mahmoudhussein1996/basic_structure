import 'dart:convert';

import 'package:bareq/Utilities/toast_helper.dart';
import 'package:http/http.dart' as http;
import '../Models/elemnt_model.dart';
import 'api.dart';

class ElementApi
{
  static Future<List<ElementModel>> getElementForLesson(int lessonId,int userId)
  async
  {
    var response = await API.getRequest(
      url: API.elementByLessonId(lessonId,userId),
      headers: {
        "Accept":"application/json"
      },
    );
    if(response["code"] == 200)
    {
      var result = response["data"];
      List<ElementModel> elements = List<ElementModel>.from(result!.map((x) => ElementModel.fromJson(x)));
      return elements;
    }
    else
    {
      ToastHelper.showError(message: response["error"]);
      return [];
    }
  }

  static Future<Map<String, dynamic>> getVideoData(String videoId)
  async {
    var response = await http.get(
        Uri.parse("https://dev.vdocipher.com/api/videos/$videoId/otp"),
        headers: {
          "Accept":"application/json",
          "Authorization":"Apisecret I922y1E3RE6wTWymuDJJzNtsnEcfOUYOq5W1GPO2wKoOPf7HZcXCgz4UkjFOB6c9"
        }
    );
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    //   url:"https://dev.vdocipher.com/api/videos/bb10aa9689434af9a918891186465099/otp",
    //   headers: {
    //     "Accept":"application/json",
    //     "Authorization":"Apisecret I922y1E3RE6wTWymuDJJzNtsnEcfOUYOq5W1GPO2wKoOPf7HZcXCgz4UkjFOB6c9"
    //   },
    // );

    if(jsonResponse["otp"] != null)
      {
        return jsonResponse;
      }
    else{
      return {};
    }
  }

}