import '../Models/unit_model.dart';
import '../Utilities/toast_helper.dart';
import 'api.dart';

class UnitApi
{
  static Future<List<Unit>> getUnitsInLevel(int levelId)
  async
  {
    var response = await API.getRequest(
      url: API.unitByLevelId(levelId),
      headers: {
        "Accept":"application/json"
      },
    );
    if(response["code"] == 200)
    {
      var result = response["data"];
      List<Unit> units = List<Unit>.from(result!.map((x) => Unit.fromJson(x)));
      return units;
    }
    else
    {
      ToastHelper.showError(message: response["error"]);
      return [];
    }
  }
}