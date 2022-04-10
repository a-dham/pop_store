import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:http/http.dart' as http;
import 'package:pop_store/src/utils/my_string.dart';

class AllProductsServices {
  Future<List<AllProductsModel>> getAllProducts() async {
    http.Response response = await http.get(
      Uri.parse('$baseUrl/products'),
    );
    if (response.statusCode == 200) {
      return allProductsModelFromJson(response.body);
    } else {
      return throw Exception('Fail to Load products ${response.statusCode}');
    }
  }
}
