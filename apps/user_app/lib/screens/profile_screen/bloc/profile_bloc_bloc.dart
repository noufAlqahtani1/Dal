import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBlocBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  //save it in storage
  Map<String, bool> categories = {
    'Cafe': true,
    'Breakfast': true,
    'Bakery': true,
    'Ice Creams': true,
    'Dinning': true,
    'Drinks': true
  };

  ProfileBlocBloc() : super(ProfileBlocInitial()) {
    on<ProfileBlocEvent>((event, emit) {});
    on<UpdateFilterEvent>((event, emit) {
      categories[event.category] = !categories[event.category]!;
      emit(UpdatedFilterState());
    });
  }
}
