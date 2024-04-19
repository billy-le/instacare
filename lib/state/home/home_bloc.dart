import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instacare/repositories/doctor_repository.dart';
import 'package:models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;

  HomeBloc({
    required DoctorRepository doctorRepository,
  })  : _doctorRepository = doctorRepository,
        super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHomeEvent);
  }

  Future<void> _onLoadHomeEvent(
      LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final [
        categories as List<DoctorCategory>,
        doctors as List<Doctor>,
      ] = await Future.wait([
        _doctorRepository.fetchDoctorCategories(),
        _doctorRepository.fetchDoctors()
      ]);

      emit(state.copyWith(
        status: HomeStatus.loaded,
        doctorCategories: categories,
        nearbyDoctors: doctors,
      ));
    } catch (err) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
