import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/extensions/int_extensions.dart';
import '../../endpoints.dart';
import '../../models/remote/product_response.dart';

class ProductsService {
  Future<List<ProductResponse>> getProducts() async {
    final url = Uri.parse(Endpoints.products);
    final response = await http.get(url);
    if (response.statusCode.isSuccess) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ProductResponse.fromJson(e)).toList();
    }
    throw Exception('Failed to get products.');
  }
}
