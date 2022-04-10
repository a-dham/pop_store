import 'package:http/http.dart' as http;
import 'package:pop_store/src/model/get_all_products_model.dart';
import 'package:pop_store/src/utils/my_string.dart';
import 'dart:convert' as http;

class CategoriesServices {
  List<String> categoriesModelFromJson(String str) =>
      List<String>.from(http.json.decode(str).map((x) => x));

  String categoriesModelToJson(List<String> data) =>
      http.json.encode(List<dynamic>.from(data.map((x) => x)));

  Future<List<String>> getCategories() async {
    http.Response response = await http.get(
      Uri.parse('$baseUrl/products/categories'),
    );
    if (response.statusCode == 200) {
      return categoriesModelFromJson(response.body);
    } else {
      return throw Exception('there are an error ${response.statusCode}');
    }
  }

  Future<List<AllProductsModel>> getCategoryItems(String categoryName) async {
    http.Response response = await http.get(
      Uri.parse('$baseUrl/products/category/$categoryName'),
    );
    if (response.statusCode == 200) {
      return allProductsModelFromJson(response.body);
    } else {
      return throw Exception('there are an error ${response.statusCode}');
    }
  }
}
