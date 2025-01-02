// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updateprofile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateprofileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProfileUpdate profileUpdate) updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProfileUpdate profileUpdate)? updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProfileUpdate profileUpdate)? updateprofile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateprofile value) updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateprofile value)? updateprofile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateprofile value)? updateprofile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateprofileEventCopyWith<$Res> {
  factory $UpdateprofileEventCopyWith(
          UpdateprofileEvent value, $Res Function(UpdateprofileEvent) then) =
      _$UpdateprofileEventCopyWithImpl<$Res, UpdateprofileEvent>;
}

/// @nodoc
class _$UpdateprofileEventCopyWithImpl<$Res, $Val extends UpdateprofileEvent>
    implements $UpdateprofileEventCopyWith<$Res> {
  _$UpdateprofileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateprofileEvent
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
    extends _$UpdateprofileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UpdateprofileEvent.started()';
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
    required TResult Function(ProfileUpdate profileUpdate) updateprofile,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProfileUpdate profileUpdate)? updateprofile,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProfileUpdate profileUpdate)? updateprofile,
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
    required TResult Function(_Updateprofile value) updateprofile,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateprofile value)? updateprofile,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateprofile value)? updateprofile,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UpdateprofileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UpdateprofileImplCopyWith<$Res> {
  factory _$$UpdateprofileImplCopyWith(
          _$UpdateprofileImpl value, $Res Function(_$UpdateprofileImpl) then) =
      __$$UpdateprofileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProfileUpdate profileUpdate});
}

/// @nodoc
class __$$UpdateprofileImplCopyWithImpl<$Res>
    extends _$UpdateprofileEventCopyWithImpl<$Res, _$UpdateprofileImpl>
    implements _$$UpdateprofileImplCopyWith<$Res> {
  __$$UpdateprofileImplCopyWithImpl(
      _$UpdateprofileImpl _value, $Res Function(_$UpdateprofileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileUpdate = null,
  }) {
    return _then(_$UpdateprofileImpl(
      profileUpdate: null == profileUpdate
          ? _value.profileUpdate
          : profileUpdate // ignore: cast_nullable_to_non_nullable
              as ProfileUpdate,
    ));
  }
}

/// @nodoc

class _$UpdateprofileImpl implements _Updateprofile {
  const _$UpdateprofileImpl({required this.profileUpdate});

  @override
  final ProfileUpdate profileUpdate;

  @override
  String toString() {
    return 'UpdateprofileEvent.updateprofile(profileUpdate: $profileUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateprofileImpl &&
            (identical(other.profileUpdate, profileUpdate) ||
                other.profileUpdate == profileUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileUpdate);

  /// Create a copy of UpdateprofileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateprofileImplCopyWith<_$UpdateprofileImpl> get copyWith =>
      __$$UpdateprofileImplCopyWithImpl<_$UpdateprofileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ProfileUpdate profileUpdate) updateprofile,
  }) {
    return updateprofile(profileUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ProfileUpdate profileUpdate)? updateprofile,
  }) {
    return updateprofile?.call(profileUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ProfileUpdate profileUpdate)? updateprofile,
    required TResult orElse(),
  }) {
    if (updateprofile != null) {
      return updateprofile(profileUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Updateprofile value) updateprofile,
  }) {
    return updateprofile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Updateprofile value)? updateprofile,
  }) {
    return updateprofile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Updateprofile value)? updateprofile,
    required TResult orElse(),
  }) {
    if (updateprofile != null) {
      return updateprofile(this);
    }
    return orElse();
  }
}

abstract class _Updateprofile implements UpdateprofileEvent {
  const factory _Updateprofile({required final ProfileUpdate profileUpdate}) =
      _$UpdateprofileImpl;

  ProfileUpdate get profileUpdate;

  /// Create a copy of UpdateprofileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateprofileImplCopyWith<_$UpdateprofileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateprofileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UpdateProfile result) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UpdateProfile result)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UpdateProfile result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateProfileInitial value) initial,
    required TResult Function(_UpdateProfileLoading value) loading,
    required TResult Function(_UpdateProfileSuccess value) success,
    required TResult Function(_UpdateProfileError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateProfileInitial value)? initial,
    TResult? Function(_UpdateProfileLoading value)? loading,
    TResult? Function(_UpdateProfileSuccess value)? success,
    TResult? Function(_UpdateProfileError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileInitial value)? initial,
    TResult Function(_UpdateProfileLoading value)? loading,
    TResult Function(_UpdateProfileSuccess value)? success,
    TResult Function(_UpdateProfileError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateprofileStateCopyWith<$Res> {
  factory $UpdateprofileStateCopyWith(
          UpdateprofileState value, $Res Function(UpdateprofileState) then) =
      _$UpdateprofileStateCopyWithImpl<$Res, UpdateprofileState>;
}

/// @nodoc
class _$UpdateprofileStateCopyWithImpl<$Res, $Val extends UpdateprofileState>
    implements $UpdateprofileStateCopyWith<$Res> {
  _$UpdateprofileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateProfileInitialImplCopyWith<$Res> {
  factory _$$UpdateProfileInitialImplCopyWith(_$UpdateProfileInitialImpl value,
          $Res Function(_$UpdateProfileInitialImpl) then) =
      __$$UpdateProfileInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateProfileInitialImplCopyWithImpl<$Res>
    extends _$UpdateprofileStateCopyWithImpl<$Res, _$UpdateProfileInitialImpl>
    implements _$$UpdateProfileInitialImplCopyWith<$Res> {
  __$$UpdateProfileInitialImplCopyWithImpl(_$UpdateProfileInitialImpl _value,
      $Res Function(_$UpdateProfileInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateProfileInitialImpl implements _UpdateProfileInitial {
  const _$UpdateProfileInitialImpl();

  @override
  String toString() {
    return 'UpdateprofileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UpdateProfile result) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UpdateProfile result)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UpdateProfile result)? success,
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
    required TResult Function(_UpdateProfileInitial value) initial,
    required TResult Function(_UpdateProfileLoading value) loading,
    required TResult Function(_UpdateProfileSuccess value) success,
    required TResult Function(_UpdateProfileError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateProfileInitial value)? initial,
    TResult? Function(_UpdateProfileLoading value)? loading,
    TResult? Function(_UpdateProfileSuccess value)? success,
    TResult? Function(_UpdateProfileError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileInitial value)? initial,
    TResult Function(_UpdateProfileLoading value)? loading,
    TResult Function(_UpdateProfileSuccess value)? success,
    TResult Function(_UpdateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileInitial implements UpdateprofileState {
  const factory _UpdateProfileInitial() = _$UpdateProfileInitialImpl;
}

/// @nodoc
abstract class _$$UpdateProfileLoadingImplCopyWith<$Res> {
  factory _$$UpdateProfileLoadingImplCopyWith(_$UpdateProfileLoadingImpl value,
          $Res Function(_$UpdateProfileLoadingImpl) then) =
      __$$UpdateProfileLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateProfileLoadingImplCopyWithImpl<$Res>
    extends _$UpdateprofileStateCopyWithImpl<$Res, _$UpdateProfileLoadingImpl>
    implements _$$UpdateProfileLoadingImplCopyWith<$Res> {
  __$$UpdateProfileLoadingImplCopyWithImpl(_$UpdateProfileLoadingImpl _value,
      $Res Function(_$UpdateProfileLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdateProfileLoadingImpl implements _UpdateProfileLoading {
  const _$UpdateProfileLoadingImpl();

  @override
  String toString() {
    return 'UpdateprofileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UpdateProfile result) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UpdateProfile result)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UpdateProfile result)? success,
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
    required TResult Function(_UpdateProfileInitial value) initial,
    required TResult Function(_UpdateProfileLoading value) loading,
    required TResult Function(_UpdateProfileSuccess value) success,
    required TResult Function(_UpdateProfileError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateProfileInitial value)? initial,
    TResult? Function(_UpdateProfileLoading value)? loading,
    TResult? Function(_UpdateProfileSuccess value)? success,
    TResult? Function(_UpdateProfileError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileInitial value)? initial,
    TResult Function(_UpdateProfileLoading value)? loading,
    TResult Function(_UpdateProfileSuccess value)? success,
    TResult Function(_UpdateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileLoading implements UpdateprofileState {
  const factory _UpdateProfileLoading() = _$UpdateProfileLoadingImpl;
}

/// @nodoc
abstract class _$$UpdateProfileSuccessImplCopyWith<$Res> {
  factory _$$UpdateProfileSuccessImplCopyWith(_$UpdateProfileSuccessImpl value,
          $Res Function(_$UpdateProfileSuccessImpl) then) =
      __$$UpdateProfileSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdateProfile result});
}

/// @nodoc
class __$$UpdateProfileSuccessImplCopyWithImpl<$Res>
    extends _$UpdateprofileStateCopyWithImpl<$Res, _$UpdateProfileSuccessImpl>
    implements _$$UpdateProfileSuccessImplCopyWith<$Res> {
  __$$UpdateProfileSuccessImplCopyWithImpl(_$UpdateProfileSuccessImpl _value,
      $Res Function(_$UpdateProfileSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$UpdateProfileSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as UpdateProfile,
    ));
  }
}

/// @nodoc

class _$UpdateProfileSuccessImpl implements _UpdateProfileSuccess {
  const _$UpdateProfileSuccessImpl(this.result);

  @override
  final UpdateProfile result;

  @override
  String toString() {
    return 'UpdateprofileState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileSuccessImplCopyWith<_$UpdateProfileSuccessImpl>
      get copyWith =>
          __$$UpdateProfileSuccessImplCopyWithImpl<_$UpdateProfileSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UpdateProfile result) success,
    required TResult Function(String error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UpdateProfile result)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UpdateProfile result)? success,
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
    required TResult Function(_UpdateProfileInitial value) initial,
    required TResult Function(_UpdateProfileLoading value) loading,
    required TResult Function(_UpdateProfileSuccess value) success,
    required TResult Function(_UpdateProfileError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateProfileInitial value)? initial,
    TResult? Function(_UpdateProfileLoading value)? loading,
    TResult? Function(_UpdateProfileSuccess value)? success,
    TResult? Function(_UpdateProfileError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileInitial value)? initial,
    TResult Function(_UpdateProfileLoading value)? loading,
    TResult Function(_UpdateProfileSuccess value)? success,
    TResult Function(_UpdateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileSuccess implements UpdateprofileState {
  const factory _UpdateProfileSuccess(final UpdateProfile result) =
      _$UpdateProfileSuccessImpl;

  UpdateProfile get result;

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileSuccessImplCopyWith<_$UpdateProfileSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileErrorImplCopyWith<$Res> {
  factory _$$UpdateProfileErrorImplCopyWith(_$UpdateProfileErrorImpl value,
          $Res Function(_$UpdateProfileErrorImpl) then) =
      __$$UpdateProfileErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$UpdateProfileErrorImplCopyWithImpl<$Res>
    extends _$UpdateprofileStateCopyWithImpl<$Res, _$UpdateProfileErrorImpl>
    implements _$$UpdateProfileErrorImplCopyWith<$Res> {
  __$$UpdateProfileErrorImplCopyWithImpl(_$UpdateProfileErrorImpl _value,
      $Res Function(_$UpdateProfileErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$UpdateProfileErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateProfileErrorImpl implements _UpdateProfileError {
  const _$UpdateProfileErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'UpdateprofileState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileErrorImplCopyWith<_$UpdateProfileErrorImpl> get copyWith =>
      __$$UpdateProfileErrorImplCopyWithImpl<_$UpdateProfileErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UpdateProfile result) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UpdateProfile result)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UpdateProfile result)? success,
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
    required TResult Function(_UpdateProfileInitial value) initial,
    required TResult Function(_UpdateProfileLoading value) loading,
    required TResult Function(_UpdateProfileSuccess value) success,
    required TResult Function(_UpdateProfileError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateProfileInitial value)? initial,
    TResult? Function(_UpdateProfileLoading value)? loading,
    TResult? Function(_UpdateProfileSuccess value)? success,
    TResult? Function(_UpdateProfileError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateProfileInitial value)? initial,
    TResult Function(_UpdateProfileLoading value)? loading,
    TResult Function(_UpdateProfileSuccess value)? success,
    TResult Function(_UpdateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileError implements UpdateprofileState {
  const factory _UpdateProfileError(final String error) =
      _$UpdateProfileErrorImpl;

  String get error;

  /// Create a copy of UpdateprofileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileErrorImplCopyWith<_$UpdateProfileErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
