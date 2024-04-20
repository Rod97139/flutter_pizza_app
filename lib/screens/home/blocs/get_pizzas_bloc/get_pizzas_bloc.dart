import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizzas_event.dart';
part 'get_pizzas_state.dart';

class GetPizzasBloc extends Bloc<GetPizzasEvent, GetPizzasState> {
  final PizzaRepo _pizzaRepo;

  GetPizzasBloc(this._pizzaRepo) : super(GetPizzasInitial()) {
    on<GetPizzas>((event, emit) async {
      emit(GetPizzasLoading());
      try {
        emit(GetPizzasSuccess(await _pizzaRepo.getPizzas()));
      } catch (e) {
        emit(GetPizzasFailure());
      }
    });
  }
}
