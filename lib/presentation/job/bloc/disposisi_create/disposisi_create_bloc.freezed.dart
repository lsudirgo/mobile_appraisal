// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disposisi_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DisposisiCreateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DisposisiRequest disposisiCreateRequest)
        createDisposisi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartedDisposisiCreate value) started,
    required TResult Function(_CreateDisposisi value) createDisposisi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartedDisposisiCreate value)? started,
    TResult? Function(_CreateDisposisi value)? createDisposisi,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartedDisposisiCreate value)? started,
    TResult Function(_CreateDisposisi value)? createDisposisi,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisposisiCreateEventCopyWith<$Res> {
  factory $DisposisiCreateEventCopyWith(DisposisiCreateEvent value,
          $Res Function(DisposisiCreateEvent) then) =
      _$DisposisiCreateEventCopyWithImpl<$Res, DisposisiCreateEvent>;
}

/// @nodoc
class _$DisposisiCreateEventCopyWithImpl<$Res,
        $Val extends DisposisiCreateEvent>
    implements $DisposisiCreateEventCopyWith<$Res> {
  _$DisposisiCreateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisposisiCreateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedDisposisiCreateImplCopyWith<$Res> {
  factory _$$StartedDisposisiCreateImplCopyWith(
          _$StartedDisposisiCreateImpl value,
          $Res Function(_$StartedDisposisiCreateImpl) then) =
      __$$StartedDisposisiCreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedDisposisiCreateImplCopyWithImpl<$Res>
    extends _$DisposisiCreateEventCopyWithImpl<$Res,
        _$StartedDisposisiCreateImpl>
    implements _$$StartedDisposisiCreateImplCopyWith<$Res> {
  __$$StartedDisposisiCreateImplCopyWithImpl(
      _$StartedDisposisiCreateImpl _value,
      $Res Function(_$StartedDisposisiCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedDisposisiCreateImpl implements _StartedDisposisiCreate {
  const _$StartedDisposisiCreateImpl();

  @override
  String toString() {
    return 'DisposisiCreateEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedDisposisiCreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DisposisiRequest disposisiCreateRequest)
        createDisposisi,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
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
    required TResult Function(_StartedDisposisiCreate value) started,
    required TResult Function(_CreateDisposisi value) createDisposisi,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartedDisposisiCreate value)? started,
    TResult? Function(_CreateDisposisi value)? createDisposisi,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartedDisposisiCreate value)? started,
    TResult Function(_CreateDisposisi value)? createDisposisi,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _StartedDisposisiCreate implements DisposisiCreateEvent {
  const factory _StartedDisposisiCreate() = _$StartedDisposisiCreateImpl;
}

/// @nodoc
abstract class _$$CreateDisposisiImplCopyWith<$Res> {
  factory _$$CreateDisposisiImplCopyWith(_$CreateDisposisiImpl value,
          $Res Function(_$CreateDisposisiImpl) then) =
      __$$CreateDisposisiImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DisposisiRequest disposisiCreateRequest});
}

/// @nodoc
class __$$CreateDisposisiImplCopyWithImpl<$Res>
    extends _$DisposisiCreateEventCopyWithImpl<$Res, _$CreateDisposisiImpl>
    implements _$$CreateDisposisiImplCopyWith<$Res> {
  __$$CreateDisposisiImplCopyWithImpl(
      _$CreateDisposisiImpl _value, $Res Function(_$CreateDisposisiImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disposisiCreateRequest = null,
  }) {
    return _then(_$CreateDisposisiImpl(
      disposisiCreateRequest: null == disposisiCreateRequest
          ? _value.disposisiCreateRequest
          : disposisiCreateRequest // ignore: cast_nullable_to_non_nullable
              as DisposisiRequest,
    ));
  }
}

/// @nodoc

class _$CreateDisposisiImpl implements _CreateDisposisi {
  const _$CreateDisposisiImpl({required this.disposisiCreateRequest});

  @override
  final DisposisiRequest disposisiCreateRequest;

  @override
  String toString() {
    return 'DisposisiCreateEvent.createDisposisi(disposisiCreateRequest: $disposisiCreateRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDisposisiImpl &&
            (identical(other.disposisiCreateRequest, disposisiCreateRequest) ||
                other.disposisiCreateRequest == disposisiCreateRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, disposisiCreateRequest);

  /// Create a copy of DisposisiCreateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDisposisiImplCopyWith<_$CreateDisposisiImpl> get copyWith =>
      __$$CreateDisposisiImplCopyWithImpl<_$CreateDisposisiImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DisposisiRequest disposisiCreateRequest)
        createDisposisi,
  }) {
    return createDisposisi(disposisiCreateRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
  }) {
    return createDisposisi?.call(disposisiCreateRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DisposisiRequest disposisiCreateRequest)? createDisposisi,
    required TResult orElse(),
  }) {
    if (createDisposisi != null) {
      return createDisposisi(disposisiCreateRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartedDisposisiCreate value) started,
    required TResult Function(_CreateDisposisi value) createDisposisi,
  }) {
    return createDisposisi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartedDisposisiCreate value)? started,
    TResult? Function(_CreateDisposisi value)? createDisposisi,
  }) {
    return createDisposisi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartedDisposisiCreate value)? started,
    TResult Function(_CreateDisposisi value)? createDisposisi,
    required TResult orElse(),
  }) {
    if (createDisposisi != null) {
      return createDisposisi(this);
    }
    return orElse();
  }
}

abstract class _CreateDisposisi implements DisposisiCreateEvent {
  const factory _CreateDisposisi(
          {required final DisposisiRequest disposisiCreateRequest}) =
      _$CreateDisposisiImpl;

  DisposisiRequest get disposisiCreateRequest;

  /// Create a copy of DisposisiCreateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDisposisiImplCopyWith<_$CreateDisposisiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DisposisiCreateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Disposisi result) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Disposisi result)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Disposisi result)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDisposisiCreate value) initial,
    required TResult Function(_LoadingDisposisiCreate value) loading,
    required TResult Function(_SuccessDisposisiCreate value) success,
    required TResult Function(_ErrorDisposisiCreate value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDisposisiCreate value)? initial,
    TResult? Function(_LoadingDisposisiCreate value)? loading,
    TResult? Function(_SuccessDisposisiCreate value)? success,
    TResult? Function(_ErrorDisposisiCreate value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDisposisiCreate value)? initial,
    TResult Function(_LoadingDisposisiCreate value)? loading,
    TResult Function(_SuccessDisposisiCreate value)? success,
    TResult Function(_ErrorDisposisiCreate value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisposisiCreateStateCopyWith<$Res> {
  factory $DisposisiCreateStateCopyWith(DisposisiCreateState value,
          $Res Function(DisposisiCreateState) then) =
      _$DisposisiCreateStateCopyWithImpl<$Res, DisposisiCreateState>;
}

/// @nodoc
class _$DisposisiCreateStateCopyWithImpl<$Res,
        $Val extends DisposisiCreateState>
    implements $DisposisiCreateStateCopyWith<$Res> {
  _$DisposisiCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialDisposisiCreateImplCopyWith<$Res> {
  factory _$$InitialDisposisiCreateImplCopyWith(
          _$InitialDisposisiCreateImpl value,
          $Res Function(_$InitialDisposisiCreateImpl) then) =
      __$$InitialDisposisiCreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialDisposisiCreateImplCopyWithImpl<$Res>
    extends _$DisposisiCreateStateCopyWithImpl<$Res,
        _$InitialDisposisiCreateImpl>
    implements _$$InitialDisposisiCreateImplCopyWith<$Res> {
  __$$InitialDisposisiCreateImplCopyWithImpl(
      _$InitialDisposisiCreateImpl _value,
      $Res Function(_$InitialDisposisiCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialDisposisiCreateImpl implements _InitialDisposisiCreate {
  const _$InitialDisposisiCreateImpl();

  @override
  String toString() {
    return 'DisposisiCreateState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialDisposisiCreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Disposisi result) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Disposisi result)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Disposisi result)? success,
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
    required TResult Function(_InitialDisposisiCreate value) initial,
    required TResult Function(_LoadingDisposisiCreate value) loading,
    required TResult Function(_SuccessDisposisiCreate value) success,
    required TResult Function(_ErrorDisposisiCreate value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDisposisiCreate value)? initial,
    TResult? Function(_LoadingDisposisiCreate value)? loading,
    TResult? Function(_SuccessDisposisiCreate value)? success,
    TResult? Function(_ErrorDisposisiCreate value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDisposisiCreate value)? initial,
    TResult Function(_LoadingDisposisiCreate value)? loading,
    TResult Function(_SuccessDisposisiCreate value)? success,
    TResult Function(_ErrorDisposisiCreate value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialDisposisiCreate implements DisposisiCreateState {
  const factory _InitialDisposisiCreate() = _$InitialDisposisiCreateImpl;
}

/// @nodoc
abstract class _$$LoadingDisposisiCreateImplCopyWith<$Res> {
  factory _$$LoadingDisposisiCreateImplCopyWith(
          _$LoadingDisposisiCreateImpl value,
          $Res Function(_$LoadingDisposisiCreateImpl) then) =
      __$$LoadingDisposisiCreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingDisposisiCreateImplCopyWithImpl<$Res>
    extends _$DisposisiCreateStateCopyWithImpl<$Res,
        _$LoadingDisposisiCreateImpl>
    implements _$$LoadingDisposisiCreateImplCopyWith<$Res> {
  __$$LoadingDisposisiCreateImplCopyWithImpl(
      _$LoadingDisposisiCreateImpl _value,
      $Res Function(_$LoadingDisposisiCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingDisposisiCreateImpl implements _LoadingDisposisiCreate {
  const _$LoadingDisposisiCreateImpl();

  @override
  String toString() {
    return 'DisposisiCreateState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingDisposisiCreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Disposisi result) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Disposisi result)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Disposisi result)? success,
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
    required TResult Function(_InitialDisposisiCreate value) initial,
    required TResult Function(_LoadingDisposisiCreate value) loading,
    required TResult Function(_SuccessDisposisiCreate value) success,
    required TResult Function(_ErrorDisposisiCreate value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDisposisiCreate value)? initial,
    TResult? Function(_LoadingDisposisiCreate value)? loading,
    TResult? Function(_SuccessDisposisiCreate value)? success,
    TResult? Function(_ErrorDisposisiCreate value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDisposisiCreate value)? initial,
    TResult Function(_LoadingDisposisiCreate value)? loading,
    TResult Function(_SuccessDisposisiCreate value)? success,
    TResult Function(_ErrorDisposisiCreate value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingDisposisiCreate implements DisposisiCreateState {
  const factory _LoadingDisposisiCreate() = _$LoadingDisposisiCreateImpl;
}

/// @nodoc
abstract class _$$SuccessDisposisiCreateImplCopyWith<$Res> {
  factory _$$SuccessDisposisiCreateImplCopyWith(
          _$SuccessDisposisiCreateImpl value,
          $Res Function(_$SuccessDisposisiCreateImpl) then) =
      __$$SuccessDisposisiCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Disposisi result});
}

/// @nodoc
class __$$SuccessDisposisiCreateImplCopyWithImpl<$Res>
    extends _$DisposisiCreateStateCopyWithImpl<$Res,
        _$SuccessDisposisiCreateImpl>
    implements _$$SuccessDisposisiCreateImplCopyWith<$Res> {
  __$$SuccessDisposisiCreateImplCopyWithImpl(
      _$SuccessDisposisiCreateImpl _value,
      $Res Function(_$SuccessDisposisiCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$SuccessDisposisiCreateImpl(
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Disposisi,
    ));
  }
}

/// @nodoc

class _$SuccessDisposisiCreateImpl implements _SuccessDisposisiCreate {
  const _$SuccessDisposisiCreateImpl(this.result);

  @override
  final Disposisi result;

  @override
  String toString() {
    return 'DisposisiCreateState.success(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessDisposisiCreateImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessDisposisiCreateImplCopyWith<_$SuccessDisposisiCreateImpl>
      get copyWith => __$$SuccessDisposisiCreateImplCopyWithImpl<
          _$SuccessDisposisiCreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Disposisi result) success,
    required TResult Function(String error) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Disposisi result)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Disposisi result)? success,
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
    required TResult Function(_InitialDisposisiCreate value) initial,
    required TResult Function(_LoadingDisposisiCreate value) loading,
    required TResult Function(_SuccessDisposisiCreate value) success,
    required TResult Function(_ErrorDisposisiCreate value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDisposisiCreate value)? initial,
    TResult? Function(_LoadingDisposisiCreate value)? loading,
    TResult? Function(_SuccessDisposisiCreate value)? success,
    TResult? Function(_ErrorDisposisiCreate value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDisposisiCreate value)? initial,
    TResult Function(_LoadingDisposisiCreate value)? loading,
    TResult Function(_SuccessDisposisiCreate value)? success,
    TResult Function(_ErrorDisposisiCreate value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessDisposisiCreate implements DisposisiCreateState {
  const factory _SuccessDisposisiCreate(final Disposisi result) =
      _$SuccessDisposisiCreateImpl;

  Disposisi get result;

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessDisposisiCreateImplCopyWith<_$SuccessDisposisiCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorDisposisiCreateImplCopyWith<$Res> {
  factory _$$ErrorDisposisiCreateImplCopyWith(_$ErrorDisposisiCreateImpl value,
          $Res Function(_$ErrorDisposisiCreateImpl) then) =
      __$$ErrorDisposisiCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorDisposisiCreateImplCopyWithImpl<$Res>
    extends _$DisposisiCreateStateCopyWithImpl<$Res, _$ErrorDisposisiCreateImpl>
    implements _$$ErrorDisposisiCreateImplCopyWith<$Res> {
  __$$ErrorDisposisiCreateImplCopyWithImpl(_$ErrorDisposisiCreateImpl _value,
      $Res Function(_$ErrorDisposisiCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorDisposisiCreateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorDisposisiCreateImpl implements _ErrorDisposisiCreate {
  const _$ErrorDisposisiCreateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'DisposisiCreateState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDisposisiCreateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDisposisiCreateImplCopyWith<_$ErrorDisposisiCreateImpl>
      get copyWith =>
          __$$ErrorDisposisiCreateImplCopyWithImpl<_$ErrorDisposisiCreateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Disposisi result) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Disposisi result)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Disposisi result)? success,
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
    required TResult Function(_InitialDisposisiCreate value) initial,
    required TResult Function(_LoadingDisposisiCreate value) loading,
    required TResult Function(_SuccessDisposisiCreate value) success,
    required TResult Function(_ErrorDisposisiCreate value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDisposisiCreate value)? initial,
    TResult? Function(_LoadingDisposisiCreate value)? loading,
    TResult? Function(_SuccessDisposisiCreate value)? success,
    TResult? Function(_ErrorDisposisiCreate value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDisposisiCreate value)? initial,
    TResult Function(_LoadingDisposisiCreate value)? loading,
    TResult Function(_SuccessDisposisiCreate value)? success,
    TResult Function(_ErrorDisposisiCreate value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorDisposisiCreate implements DisposisiCreateState {
  const factory _ErrorDisposisiCreate(final String error) =
      _$ErrorDisposisiCreateImpl;

  String get error;

  /// Create a copy of DisposisiCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorDisposisiCreateImplCopyWith<_$ErrorDisposisiCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
