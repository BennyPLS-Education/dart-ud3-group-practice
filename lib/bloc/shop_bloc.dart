import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/states/states.dart';

class ShopBloc extends Bloc<ShoppingCartEvents, ShoppingCartState> {
  ShopBloc() : super(ShoppingCartState.initial());

  @override
  Stream<ShoppingCartState> mapEventToState(ShoppingCartEvents event) async* {
    if (event is ShopEventAdd) {
      yield state.copyAdd(event.product);
    }
    if (event is ShopEventRemove) {
      yield state.copyRemove(event.product);
    }
  }
}
