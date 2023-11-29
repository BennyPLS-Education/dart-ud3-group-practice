import 'package:group_practice/states/api_products_state.dart';

abstract class ApiProductsEvents {
  ApiProductsEvents();
}

class ApiProductsLoaded extends ApiProductsEvents {
  late final ApiProductsState state;

  ApiProductsLoaded(this.state);
}