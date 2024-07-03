// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registeruser_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisteruserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String userid, String newpassword, String confirmpassword)
        registeruser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String userid, String newpassword, String confirmpassword)?
        registeruser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userid, String newpassword, String confirmpassword)?
        registeruser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Registeruser value) registeruser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Registeruser value)? registeruser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Registeruser value)? registeruser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteruserEventCopyWith<$Res> {
  factory $RegisteruserEventCopyWith(
          RegisteruserEvent value, $Res Function(RegisteruserEvent) then) =
      _$RegisteruserEventCopyWithImpl<$Res, RegisteruserEvent>;
}

/// @nodoc
class _$RegisteruserEventCopyWithImpl<$Res, $Val extends RegisteruserEvent>
    implements $RegisteruserEventCopyWith<$Res> {
  _$RegisteruserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RegisteruserEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RegisteruserEvent.started()';
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
    required TResult Function(
            String userid, String newpassword, String confirmpassword)
        registeruser,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String userid, String newpassword, String confirmpassword)?
        registeruser,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userid, String newpassword, String confirmpassword)?
        registeruser,
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
    required TResult Function(_Registeruser value) registeruser,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Registeruser value)? registeruser,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Registeruser value)? registeruser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RegisteruserEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RegisteruserImplCopyWith<$Res> {
  factory _$$RegisteruserImplCopyWith(
          _$RegisteruserImpl value, $Res Function(_$RegisteruserImpl) then) =
      __$$RegisteruserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userid, String newpassword, String confirmpassword});
}

/// @nodoc
class __$$RegisteruserImplCopyWithImpl<$Res>
    extends _$RegisteruserEventCopyWithImpl<$Res, _$RegisteruserImpl>
    implements _$$RegisteruserImplCopyWith<$Res> {
  __$$RegisteruserImplCopyWithImpl(
      _$RegisteruserImpl _value, $Res Function(_$RegisteruserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = null,
    Object? newpassword = null,
    Object? confirmpassword = null,
  }) {
    return _then(_$RegisteruserImpl(
      null == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as String,
      null == newpassword
          ? _value.newpassword
          : newpassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmpassword
          ? _value.confirmpassword
          : confirmpassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisteruserImpl implements _Registeruser {
  const _$RegisteruserImpl(this.userid, this.newpassword, this.confirmpassword);

  @override
  final String userid;
  @override
  final String newpassword;
  @override
  final String confirmpassword;

  @override
  String toString() {
    return 'RegisteruserEvent.registeruser(userid: $userid, newpassword: $newpassword, confirmpassword: $confirmpassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisteruserImpl &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.newpassword, newpassword) ||
                other.newpassword == newpassword) &&
            (identical(other.confirmpassword, confirmpassword) ||
                other.confirmpassword == confirmpassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userid, newpassword, confirmpassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisteruserImplCopyWith<_$RegisteruserImpl> get copyWith =>
      __$$RegisteruserImplCopyWithImpl<_$RegisteruserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String userid, String newpassword, String confirmpassword)
        registeruser,
  }) {
    return registeruser(userid, newpassword, confirmpassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String userid, String newpassword, String confirmpassword)?
        registeruser,
  }) {
    return registeruser?.call(userid, newpassword, confirmpassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userid, String newpassword, String confirmpassword)?
        registeruser,
    required TResult orElse(),
  }) {
    if (registeruser != null) {
      return registeruser(userid, newpassword, confirmpassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Registeruser value) registeruser,
  }) {
    return registeruser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Registeruser value)? registeruser,
  }) {
    return registeruser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Registeruser value)? registeruser,
    required TResult orElse(),
  }) {
    if (registeruser != null) {
      return registeruser(this);
    }
    return orElse();
  }
}

abstract class _Registeruser implements RegisteruserEvent {
  const factory _Registeruser(final String userid, final String newpassword,
      final String confirmpassword) = _$RegisteruserImpl;

  String get userid;
  String get newpassword;
  String get confirmpassword;
  @JsonKey(ignore: true)
  _$$RegisteruserImplCopyWith<_$RegisteruserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisteruserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisteruserModel result) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisteruserModel result)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisteruserModel result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisteruserStateCopyWith<$Res> {
  factory $RegisteruserStateCopyWith(
          RegisteruserState value, $Res Function(RegisteruserState) then) =
      _$RegisteruserStateCopyWithImpl<$Res, RegisteruserState>;
}

/// @nodoc
class _$RegisteruserStateCopyWithImpl<$Res, $Val extends RegisteruserState>
    implements $RegisteruserStateCopyWith<$Res> {
  _$RegisteruserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterInitialImplCopyWith<$Res> {
  factory _$$RegisterInitialImplCopyWith(_$RegisterInitialImpl value,
          $Res Function(_$RegisterInitialImpl) then) =
      __$$RegisterInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitialImplCopyWithImpl<$Res>
    extends _$RegisteruserStateCopyWithImpl<$Res, _$RegisterInitialImpl>
    implements _$$RegisterInitialImplCopyWith<$Res> {
  __$$RegisterInitialImplCopyWithImpl(
      _$RegisterInitialImpl _value, $Res Function(_$RegisterInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInitialImpl implements _RegisterInitial {
  const _$RegisterInitialImpl();

  @override
  String toString() {
    return 'RegisteruserState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisteruserModel result) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisteruserModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisteruserModel result)? success,
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
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RegisterInitial implements RegisteruserState {
  const factory _RegisterInitial() = _$RegisterInitialImpl;
}

/// @nodoc
abstract class _$$RegisterLoadingImplCopyWith<$Res> {
  factory _$$RegisterLoadingImplCopyWith(_$RegisterLoadingImpl value,
          $Res Function(_$RegisterLoadingImpl) then) =
      __$$RegisterLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingImplCopyWithImpl<$Res>
    extends _$RegisteruserStateCopyWithImpl<$Res, _$RegisterLoadingImpl>
    implements _$$RegisterLoadingImplCopyWith<$Res> {
  __$$RegisterLoadingImplCopyWithImpl(
      _$RegisterLoadingImpl _value, $Res Function(_$RegisterLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoadingImpl implements _RegisterLoading {
  const _$RegisterLoadingImpl();

  @override
  String toString() {
    return 'RegisteruserState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisteruserModel result) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisteruserModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisteruserModel result)? success,
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
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _RegisterLoading implements RegisteruserState {
  const factory _RegisterLoading() = _$RegisterLoadingImpl;
}

/// @nodoc
abstract class _$$RegisterSuccessImplCopyWith<$Res> {
  factory _$$RegisterSuccessImplCopyWith(_$RegisterSuccessImpl value,
          $Res Function(_$RegisterSuccessImpl) then) =
      __$$RegisterSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisteruserModel result});
}

/// @nodoc
class __$$RegisterSuccessImplCopyWithImpl<$Res>
    extends _$RegisteruserStateCopyWithImpl<$Res, _$RegisterSuccessImpl>
    implements _$$RegisterSuccessImplCopyWith<$Res> {
  __$$RegisterSuccessImplCopyWithImpl(
      _$RegisterSuccessImpl _value, $Res Function(_$RegisterSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$RegisterSuccessImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as RegisteruserModel,
    ));
  }
}

/// @nodoc

class _$RegisterSuccessImpl implements _RegisterSuccess {
  const _$RegisterSuccessImpl(this.result);

  @override
  final RegisteruserModel result;

  @override
  String toString() {
    return 'RegisteruserState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterSuccessImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterSuccessImplCopyWith<_$RegisterSuccessImpl> get copyWith =>
      __$$RegisterSuccessImplCopyWithImpl<_$RegisterSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisteruserModel result) success,
    required TResult Function(String error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisteruserModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisteruserModel result)? success,
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
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _RegisterSuccess implements RegisteruserState {
  const factory _RegisterSuccess(final RegisteruserModel result) =
      _$RegisterSuccessImpl;

  RegisteruserModel get result;
  @JsonKey(ignore: true)
  _$$RegisterSuccessImplCopyWith<_$RegisterSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterErrorImplCopyWith<$Res> {
  factory _$$RegisterErrorImplCopyWith(
          _$RegisterErrorImpl value, $Res Function(_$RegisterErrorImpl) then) =
      __$$RegisterErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RegisterErrorImplCopyWithImpl<$Res>
    extends _$RegisteruserStateCopyWithImpl<$Res, _$RegisterErrorImpl>
    implements _$$RegisterErrorImplCopyWith<$Res> {
  __$$RegisterErrorImplCopyWithImpl(
      _$RegisterErrorImpl _value, $Res Function(_$RegisterErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RegisterErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorImpl implements _RegisterError {
  const _$RegisterErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RegisteruserState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorImplCopyWith<_$RegisterErrorImpl> get copyWith =>
      __$$RegisterErrorImplCopyWithImpl<_$RegisterErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisteruserModel result) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisteruserModel result)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisteruserModel result)? success,
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
    required TResult Function(_RegisterInitial value) initial,
    required TResult Function(_RegisterLoading value) loading,
    required TResult Function(_RegisterSuccess value) success,
    required TResult Function(_RegisterError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterInitial value)? initial,
    TResult? Function(_RegisterLoading value)? loading,
    TResult? Function(_RegisterSuccess value)? success,
    TResult? Function(_RegisterError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterInitial value)? initial,
    TResult Function(_RegisterLoading value)? loading,
    TResult Function(_RegisterSuccess value)? success,
    TResult Function(_RegisterError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _RegisterError implements RegisteruserState {
  const factory _RegisterError(final String error) = _$RegisterErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$RegisterErrorImplCopyWith<_$RegisterErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
