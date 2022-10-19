import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryInitial());
}
