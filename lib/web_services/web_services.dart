import 'package:http/http.dart' as http;
import 'package:my_website/web_services/url_constant.dart';

class WebServices{
  static Future<dynamic>postRequestBeforeAuth({required Map body, required String routeUrL})async{

    Uri uri=Uri.parse(UrlConstant.base_url+routeUrL);

    var response=await http.post(uri,body: body);
    print(response.statusCode);
  }
}