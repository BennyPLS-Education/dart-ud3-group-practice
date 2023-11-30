import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/states/states.dart';

class ShopBloc extends Bloc<ShoppingCartEvents, ShoppingCartState> {
  ShopBloc() : super(ShoppingCartState.initial());

  @override
  Stream<ShoppingCartState> mapEventToState(ShoppingCartEvents event) async* {
    if (event is ShopEventAdd) {
      yield _add(event);
    } else if (event is ShopEventRemove) {
      yield _remove(event);
    } else if (event is ShopEventClear) {
      yield ShoppingCartState.initial();
    }
  }

  ShoppingCartState _add(ShopEventAdd event) {
    return state.copyAdd(event.product);
  }

  ShoppingCartState _remove(ShopEventRemove event) {
    return state.copyRemove(event.product);
  }
}
