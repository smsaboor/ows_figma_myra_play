import 'package:flutter_bloc/flutter_bloc.dart';

class UserActivityCubit extends Cubit<int> {
  UserActivityCubit() : super(0);
  void updateIndex(int active) => emit(active);
}
