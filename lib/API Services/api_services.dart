import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/model.dart';

class ApiService {
  Future<List<Category>?> fetchCategories() async {
    final response = await http.get(Uri.parse('https://ea14-2407-d000-1a-ce7-1065-1ed4-adf4-9798.ngrok-free.app/categories/CategoryAll'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((category) => Category.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Brands>?> fetchBrands() async {
    final response = await http.get(Uri.parse('https://ea14-2407-d000-1a-ce7-1065-1ed4-adf4-9798.ngrok-free.app/categories/CategoryAll'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((brand) => Brands.fromJson(brand)).toList();
    } else {
      throw Exception('Failed to load brands');
    }
  }
}
