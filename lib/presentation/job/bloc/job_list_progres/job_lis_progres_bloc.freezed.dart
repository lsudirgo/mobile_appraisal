// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_lis_progres_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JobLisProgresEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobListRequest joblistrequest) getJobList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobListRequest joblistrequest)? getJobList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobListRequest joblistrequest)? getJobList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JobListProgress value) getJobList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JobListProgress value)? getJobList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JobListProgress value)? getJobList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobLisProgresEventCopyWith<$Res> {
  factory $JobLisProgresEventCopyWith(
          JobLisProgresEvent value, $Res Function(JobLisProgresEvent) then) =
      _$JobLisProgresEventCopyWithImpl<$Res, JobLisProgresEvent>;
}

/// @nodoc
class _$JobLisProgresEventCopyWithImpl<$Res, $Val extends JobLisProgresEvent>
    implements $JobLisProgresEventCopyWith<$Res> {
  _$JobLisProgresEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobLisProgresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$JobLisProgresEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'JobLisProgresEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobListRequest joblistrequest) getJobList,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobListRequest joblistrequest)? getJobList,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobListRequest joblistrequest)? getJobList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JobListProgress value) getJobList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JobListProgress value)? getJobList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JobListProgress value)? getJobList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements JobLisProgresEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$JobListProgressImplCopyWith<$Res> {
  factory _$$JobListProgressImplCopyWith(_$JobListProgressImpl value,
          $Res Function(_$JobListProgressImpl) then) =
      __$$JobListProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JobListRequest joblistrequest});
}

/// @nodoc
class __$$JobListProgressImplCopyWithImpl<$Res>
    extends _$JobLisProgresEventCopyWithImpl<$Res, _$JobListProgressImpl>
    implements _$$JobListProgressImplCopyWith<$Res> {
  __$$JobListProgressImplCopyWithImpl(
      _$JobListProgressImpl _value, $Res Function(_$JobListProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joblistrequest = null,
  }) {
    return _then(_$JobListProgressImpl(
      joblistrequest: null == joblistrequest
          ? _value.joblistrequest
          : joblistrequest // ignore: cast_nullable_to_non_nullable
              as JobListRequest,
    ));
  }
}

/// @nodoc

class _$JobListProgressImpl implements _JobListProgress {
  const _$JobListProgressImpl({required this.joblistrequest});

  @override
  final JobListRequest joblistrequest;

  @override
  String toString() {
    return 'JobLisProgresEvent.getJobList(joblistrequest: $joblistrequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobListProgressImpl &&
            (identical(other.joblistrequest, joblistrequest) ||
                other.joblistrequest == joblistrequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, joblistrequest);

  /// Create a copy of JobLisProgresEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobListProgressImplCopyWith<_$JobListProgressImpl> get copyWith =>
      __$$JobListProgressImplCopyWithImpl<_$JobListProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JobListRequest joblistrequest) getJobList,
  }) {
    return getJobList(joblistrequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JobListRequest joblistrequest)? getJobList,
  }) {
    return getJobList?.call(joblistrequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JobListRequest joblistrequest)? getJobList,
    required TResult orElse(),
  }) {
    if (getJobList != null) {
      return getJobList(joblistrequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JobListProgress value) getJobList,
  }) {
    return getJobList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JobListProgress value)? getJobList,
  }) {
    return getJobList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JobListProgress value)? getJobList,
    required TResult orElse(),
  }) {
    if (getJobList != null) {
      return getJobList(this);
    }
    return orElse();
  }
}

abstract class _JobListProgress implements JobLisProgresEvent {
  const factory _JobListProgress(
      {required final JobListRequest joblistrequest}) = _$JobListProgressImpl;

  JobListRequest get joblistrequest;

  /// Create a copy of JobLisProgresEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobListProgressImplCopyWith<_$JobListProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JobLisProgresState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobListRespnseModel result) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobListRespnseModel result)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobListRespnseModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobListProgressInitial value) initial,
    required TResult Function(_JobListProgressLoading value) loading,
    required TResult Function(_JobListProgressSuccess value) success,
    required TResult Function(_JobListProgressError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobListProgressInitial value)? initial,
    TResult? Function(_JobListProgressLoading value)? loading,
    TResult? Function(_JobListProgressSuccess value)? success,
    TResult? Function(_JobListProgressError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobListProgressInitial value)? initial,
    TResult Function(_JobListProgressLoading value)? loading,
    TResult Function(_JobListProgressSuccess value)? success,
    TResult Function(_JobListProgressError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobLisProgresStateCopyWith<$Res> {
  factory $JobLisProgresStateCopyWith(
          JobLisProgresState value, $Res Function(JobLisProgresState) then) =
      _$JobLisProgresStateCopyWithImpl<$Res, JobLisProgresState>;
}

/// @nodoc
class _$JobLisProgresStateCopyWithImpl<$Res, $Val extends JobLisProgresState>
    implements $JobLisProgresStateCopyWith<$Res> {
  _$JobLisProgresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JobListProgressInitialImplCopyWith<$Res> {
  factory _$$JobListProgressInitialImplCopyWith(
          _$JobListProgressInitialImpl value,
          $Res Function(_$JobListProgressInitialImpl) then) =
      __$$JobListProgressInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JobListProgressInitialImplCopyWithImpl<$Res>
    extends _$JobLisProgresStateCopyWithImpl<$Res, _$JobListProgressInitialImpl>
    implements _$$JobListProgressInitialImplCopyWith<$Res> {
  __$$JobListProgressInitialImplCopyWithImpl(
      _$JobListProgressInitialImpl _value,
      $Res Function(_$JobListProgressInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JobListProgressInitialImpl implements _JobListProgressInitial {
  const _$JobListProgressInitialImpl();

  @override
  String toString() {
    return 'JobLisProgresState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobListProgressInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobListRespnseModel result) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobListRespnseModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobListRespnseModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobListProgressInitial value) initial,
    required TResult Function(_JobListProgressLoading value) loading,
    required TResult Function(_JobListProgressSuccess value) success,
    required TResult Function(_JobListProgressError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobListProgressInitial value)? initial,
    TResult? Function(_JobListProgressLoading value)? loading,
    TResult? Function(_JobListProgressSuccess value)? success,
    TResult? Function(_JobListProgressError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobListProgressInitial value)? initial,
    TResult Function(_JobListProgressLoading value)? loading,
    TResult Function(_JobListProgressSuccess value)? success,
    TResult Function(_JobListProgressError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _JobListProgressInitial implements JobLisProgresState {
  const factory _JobListProgressInitial() = _$JobListProgressInitialImpl;
}

/// @nodoc
abstract class _$$JobListProgressLoadingImplCopyWith<$Res> {
  factory _$$JobListProgressLoadingImplCopyWith(
          _$JobListProgressLoadingImpl value,
          $Res Function(_$JobListProgressLoadingImpl) then) =
      __$$JobListProgressLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JobListProgressLoadingImplCopyWithImpl<$Res>
    extends _$JobLisProgresStateCopyWithImpl<$Res, _$JobListProgressLoadingImpl>
    implements _$$JobListProgressLoadingImplCopyWith<$Res> {
  __$$JobListProgressLoadingImplCopyWithImpl(
      _$JobListProgressLoadingImpl _value,
      $Res Function(_$JobListProgressLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JobListProgressLoadingImpl implements _JobListProgressLoading {
  const _$JobListProgressLoadingImpl();

  @override
  String toString() {
    return 'JobLisProgresState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobListProgressLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobListRespnseModel result) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobListRespnseModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobListRespnseModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobListProgressInitial value) initial,
    required TResult Function(_JobListProgressLoading value) loading,
    required TResult Function(_JobListProgressSuccess value) success,
    required TResult Function(_JobListProgressError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobListProgressInitial value)? initial,
    TResult? Function(_JobListProgressLoading value)? loading,
    TResult? Function(_JobListProgressSuccess value)? success,
    TResult? Function(_JobListProgressError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobListProgressInitial value)? initial,
    TResult Function(_JobListProgressLoading value)? loading,
    TResult Function(_JobListProgressSuccess value)? success,
    TResult Function(_JobListProgressError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _JobListProgressLoading implements JobLisProgresState {
  const factory _JobListProgressLoading() = _$JobListProgressLoadingImpl;
}

/// @nodoc
abstract class _$$JobListProgressSuccessImplCopyWith<$Res> {
  factory _$$JobListProgressSuccessImplCopyWith(
          _$JobListProgressSuccessImpl value,
          $Res Function(_$JobListProgressSuccessImpl) then) =
      __$$JobListProgressSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JobListRespnseModel result});
}

/// @nodoc
class __$$JobListProgressSuccessImplCopyWithImpl<$Res>
    extends _$JobLisProgresStateCopyWithImpl<$Res, _$JobListProgressSuccessImpl>
    implements _$$JobListProgressSuccessImplCopyWith<$Res> {
  __$$JobListProgressSuccessImplCopyWithImpl(
      _$JobListProgressSuccessImpl _value,
      $Res Function(_$JobListProgressSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$JobListProgressSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as JobListRespnseModel,
    ));
  }
}

/// @nodoc

class _$JobListProgressSuccessImpl implements _JobListProgressSuccess {
  const _$JobListProgressSuccessImpl(this.result);

  @override
  final JobListRespnseModel result;

  @override
  String toString() {
    return 'JobLisProgresState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobListProgressSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobListProgressSuccessImplCopyWith<_$JobListProgressSuccessImpl>
      get copyWith => __$$JobListProgressSuccessImplCopyWithImpl<
          _$JobListProgressSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobListRespnseModel result) success,
    required TResult Function(String error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobListRespnseModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobListRespnseModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobListProgressInitial value) initial,
    required TResult Function(_JobListProgressLoading value) loading,
    required TResult Function(_JobListProgressSuccess value) success,
    required TResult Function(_JobListProgressError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobListProgressInitial value)? initial,
    TResult? Function(_JobListProgressLoading value)? loading,
    TResult? Function(_JobListProgressSuccess value)? success,
    TResult? Function(_JobListProgressError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobListProgressInitial value)? initial,
    TResult Function(_JobListProgressLoading value)? loading,
    TResult Function(_JobListProgressSuccess value)? success,
    TResult Function(_JobListProgressError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _JobListProgressSuccess implements JobLisProgresState {
  const factory _JobListProgressSuccess(final JobListRespnseModel result) =
      _$JobListProgressSuccessImpl;

  JobListRespnseModel get result;

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobListProgressSuccessImplCopyWith<_$JobListProgressSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JobListProgressErrorImplCopyWith<$Res> {
  factory _$$JobListProgressErrorImplCopyWith(_$JobListProgressErrorImpl value,
          $Res Function(_$JobListProgressErrorImpl) then) =
      __$$JobListProgressErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$JobListProgressErrorImplCopyWithImpl<$Res>
    extends _$JobLisProgresStateCopyWithImpl<$Res, _$JobListProgressErrorImpl>
    implements _$$JobListProgressErrorImplCopyWith<$Res> {
  __$$JobListProgressErrorImplCopyWithImpl(_$JobListProgressErrorImpl _value,
      $Res Function(_$JobListProgressErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$JobListProgressErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JobListProgressErrorImpl implements _JobListProgressError {
  const _$JobListProgressErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'JobLisProgresState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobListProgressErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobListProgressErrorImplCopyWith<_$JobListProgressErrorImpl>
      get copyWith =>
          __$$JobListProgressErrorImplCopyWithImpl<_$JobListProgressErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JobListRespnseModel result) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(JobListRespnseModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JobListRespnseModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JobListProgressInitial value) initial,
    required TResult Function(_JobListProgressLoading value) loading,
    required TResult Function(_JobListProgressSuccess value) success,
    required TResult Function(_JobListProgressError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_JobListProgressInitial value)? initial,
    TResult? Function(_JobListProgressLoading value)? loading,
    TResult? Function(_JobListProgressSuccess value)? success,
    TResult? Function(_JobListProgressError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JobListProgressInitial value)? initial,
    TResult Function(_JobListProgressLoading value)? loading,
    TResult Function(_JobListProgressSuccess value)? success,
    TResult Function(_JobListProgressError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _JobListProgressError implements JobLisProgresState {
  const factory _JobListProgressError(final String error) =
      _$JobListProgressErrorImpl;

  String get error;

  /// Create a copy of JobLisProgresState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobListProgressErrorImplCopyWith<_$JobListProgressErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
