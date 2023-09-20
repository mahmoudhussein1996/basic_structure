import 'package:bareq/Utilities/toast_helper.dart';
import '../Models/level_model.dart';
import 'api.dart';

class LevelApi
{
  static Future<List<Level>> getLevelForUser(int userId)
  async
  {
    var response = await API.getRequest(
      url: API.levelByUserId(userId),
      headers: {
        "Accept":"application/json"
      },
    );
    if(response["data"] != null)
    {
      var result = response["data"];
      List<Level> levels = List<Level>.from(result!.map((x) => Level.fromJson(x)));
      return levels;
    }
    else
    {
      ToastHelper.showError(message: "error in getting levels");
      return [];
    }
  }

}