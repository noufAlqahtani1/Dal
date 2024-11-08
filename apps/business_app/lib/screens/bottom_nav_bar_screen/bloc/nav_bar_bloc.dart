import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(NavBarInitial()) {
    on<NavBarEvent>((event, emit) {
    });

    on<BottomNavBarEvent>((event, emit) {
      emit(BottomNavBarState(index: event.index));
    });
  }
}
