// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beranda_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BerandaState {
  FormzStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  List<Attendance> get attendances => throw _privateConstructorUsedError;
  Completer<GoogleMapController> get mapsController =>
      throw _privateConstructorUsedError;

  /// Create a copy of BerandaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BerandaStateCopyWith<BerandaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BerandaStateCopyWith<$Res> {
  factory $BerandaStateCopyWith(
          BerandaState value, $Res Function(BerandaState) then) =
      _$BerandaStateCopyWithImpl<$Res, BerandaState>;
  @useResult
  $Res call(
      {FormzStatus status,
      Failure? failure,
      bool isAdmin,
      Company company,
      List<Attendance> attendances,
      Completer<GoogleMapController> mapsController});
}

/// @nodoc
class _$BerandaStateCopyWithImpl<$Res, $Val extends BerandaState>
    implements $BerandaStateCopyWith<$Res> {
  _$BerandaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BerandaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? isAdmin = null,
    Object? company = null,
    Object? attendances = null,
    Object? mapsController = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      attendances: null == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
      mapsController: null == mapsController
          ? _value.mapsController
          : mapsController // ignore: cast_nullable_to_non_nullable
              as Completer<GoogleMapController>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BerandaStateImplCopyWith<$Res>
    implements $BerandaStateCopyWith<$Res> {
  factory _$$BerandaStateImplCopyWith(
          _$BerandaStateImpl value, $Res Function(_$BerandaStateImpl) then) =
      __$$BerandaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      Failure? failure,
      bool isAdmin,
      Company company,
      List<Attendance> attendances,
      Completer<GoogleMapController> mapsController});
}

/// @nodoc
class __$$BerandaStateImplCopyWithImpl<$Res>
    extends _$BerandaStateCopyWithImpl<$Res, _$BerandaStateImpl>
    implements _$$BerandaStateImplCopyWith<$Res> {
  __$$BerandaStateImplCopyWithImpl(
      _$BerandaStateImpl _value, $Res Function(_$BerandaStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BerandaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? isAdmin = null,
    Object? company = null,
    Object? attendances = null,
    Object? mapsController = null,
  }) {
    return _then(_$BerandaStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      attendances: null == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
      mapsController: null == mapsController
          ? _value.mapsController
          : mapsController // ignore: cast_nullable_to_non_nullable
              as Completer<GoogleMapController>,
    ));
  }
}

/// @nodoc

class _$BerandaStateImpl extends _BerandaState {
  const _$BerandaStateImpl(
      {required this.status,
      this.failure,
      required this.isAdmin,
      required this.company,
      required final List<Attendance> attendances,
      required this.mapsController})
      : _attendances = attendances,
        super._();

  @override
  final FormzStatus status;
  @override
  final Failure? failure;
  @override
  final bool isAdmin;
  @override
  final Company company;
  final List<Attendance> _attendances;
  @override
  List<Attendance> get attendances {
    if (_attendances is EqualUnmodifiableListView) return _attendances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendances);
  }

  @override
  final Completer<GoogleMapController> mapsController;

  @override
  String toString() {
    return 'BerandaState(status: $status, failure: $failure, isAdmin: $isAdmin, company: $company, attendances: $attendances, mapsController: $mapsController)';
  }

  /// Create a copy of BerandaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BerandaStateImplCopyWith<_$BerandaStateImpl> get copyWith =>
      __$$BerandaStateImplCopyWithImpl<_$BerandaStateImpl>(this, _$identity);
}

abstract class _BerandaState extends BerandaState {
  const factory _BerandaState(
          {required final FormzStatus status,
          final Failure? failure,
          required final bool isAdmin,
          required final Company company,
          required final List<Attendance> attendances,
          required final Completer<GoogleMapController> mapsController}) =
      _$BerandaStateImpl;
  const _BerandaState._() : super._();

  @override
  FormzStatus get status;
  @override
  Failure? get failure;
  @override
  bool get isAdmin;
  @override
  Company get company;
  @override
  List<Attendance> get attendances;
  @override
  Completer<GoogleMapController> get mapsController;

  /// Create a copy of BerandaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BerandaStateImplCopyWith<_$BerandaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
