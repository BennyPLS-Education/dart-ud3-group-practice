import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/events/api_products_events.dart';
import 'package:group_practice/models/product.dart';
import 'package:group_practice/models/product_response.dart';
import 'package:group_practice/states/api_products_state.dart';
import 'package:http/http.dart' as http;

class ApiProductsBloc extends Bloc<ApiProductsEvents, ApiProductsState> {
  ApiProductsBloc() : super(ApiProductsState.initial());

  @override
  Stream<ApiProductsState> mapEventToState(ApiProductsEvents event) async* {
    if (event is ApiProductsLoaded) {
      var products = await fetchData();
      // var products = [
      //   Product(price: 10.0, image: 'https://picsum.photos/200'),
      //   Product(price: 15.0, image: 'https://picsum.photos/100')
      // ];
      yield ApiProductsState(products);
    }
  }

  Future<List<Product>> fetchData() async {
    var url = Uri.parse(
        'https://api-tenda-7058f-default-rtdb.europe-west1.firebasedatabase.app/.json');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;
      var list = ProductsResponse.fromRawJson(data);
      return list.products;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
