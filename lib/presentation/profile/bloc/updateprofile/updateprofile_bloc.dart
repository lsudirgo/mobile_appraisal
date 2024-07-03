import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_appraisal/data/datasources/profile/profile_update_datasource.dart';
import 'package:mobile_appraisal/data/models/request/profile/profile_update_request_model.dart';
import 'package:mobile_appraisal/data/models/response/profile/profile_update_response_model.dart';

part 'updateprofile_event.dart';
part 'updateprofile_state.dart';
part 'updateprofile_bloc.freezed.dart';

class UpdateprofileBloc extends Bloc<UpdateprofileEvent, UpdateprofileState> {
  final ProfileUpdateRemoteDatasource profileUpdateRemoteDatasource;

  UpdateprofileBloc(this.profileUpdateRemoteDatasource)
      : super(const _UpdateProfileInitial()) {
    on<_Updateprofile>((event, emit) async {
      emit(const _UpdateProfileLoading());
      final result = await profileUpdateRemoteDatasource
          .postUpdateProfile(event.profileUpdate);
      result.fold(
        (l) => emit(_UpdateProfileError(l)),
        (r) => emit(_UpdateProfileSuccess(r)),
      );
    });
  }
}
