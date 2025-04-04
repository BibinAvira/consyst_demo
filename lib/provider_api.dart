import 'package:flashcurrent/Constants.dart';
import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<Map<String, dynamic>> Get_TopStorySectionData() async {
        httpClient.timeout = Duration(seconds: 15);
    try {
      var content = await get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=${Constants.newsapi_apikey}");
      if (content.statusCode == 200) {
        return {"code": 200, "message": content.body};
      } else {
        return {"code": 400, "message": "data not found"};
      }
    } catch (e) {
      return {"code": 400, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> Get_PopularNewsListData() async {
    httpClient.timeout = Duration(seconds: 15);
    try {
      var content = await get(
          "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=${Constants.newsapi_apikey}");
      if (content.statusCode == 200) {
        return {"code": 200, "message": content.body};
      } else {
        return {"code": 400, "message": "data not found"};
      }
    } catch (e) {
      return {"code": 400, "message": e.toString()};
    }
  }
  Future<Map<String, dynamic>> Get_CategoryWiseNews({required String categoryname}) async {
    httpClient.timeout = Duration(seconds: 15);
    try {
      var content = await get(
          "https://newsapi.org/v2/top-headlines?category=$categoryname&apiKey=${Constants.newsapi_apikey}");
      if (content.statusCode == 200) {
        return {"code": 200, "message": content.body};
      } else {
        return {"code": 400, "message": "data not found"};
      }
    } catch (e) {
      return {"code": 400, "message": e.toString()};
    }
  }
}
