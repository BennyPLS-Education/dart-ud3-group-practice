import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/events/api_products_events.dart';
import 'package:group_practice/models/product.dart';
import 'package:group_practice/states/api_products_state.dart';

class ApiProductsBloc extends Bloc<ApiProductsEvents, ApiProductsState> {
  ApiProductsBloc() : super(ApiProductsState.initial());

  @override
  Stream<ApiProductsState> mapEventToState(ApiProductsEvents event) async* {
    if (event is ApiProductsLoaded) {
      var products = [Product(price: 10, image: 'image')];
      yield ApiProductsState(products);
    }
  }
}
