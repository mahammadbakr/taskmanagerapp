import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:taskmanagerapp/injectable_config.dart';


part 'main_event.dart';
part 'main_state.dart';

MainBloc get mainBloc => getIt<MainBloc>();

@LazySingleton()
class MainBloc extends Bloc<MainEvent, MainState> {
  // landing page bottom navigation index
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;


  MainBloc() : super(MainInitial()) {
    on<MainBottomNavigationUpdateEvent>((event, emit) {
      emit(MainInitial());
      _currentIndex = event.index;
      emit(MainBottomNavigationUpdateState());
    });
  }
}
