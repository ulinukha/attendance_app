// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceDetailState {
  FormzStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceDetailStateCopyWith<AttendanceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDetailStateCopyWith<$Res> {
  factory $AttendanceDetailStateCopyWith(AttendanceDetailState value,
          $Res Function(AttendanceDetailState) then) =
      _$AttendanceDetailStateCopyWithImpl<$Res, AttendanceDetailState>;
  @useResult
  $Res call({FormzStatus status, Failure? failure});
}

/// @nodoc
class _$AttendanceDetailStateCopyWithImpl<$Res,
        $Val extends AttendanceDetailState>
    implements $AttendanceDetailStateCopyWith<$Res> {
  _$AttendanceDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceDetailStateImplCopyWith<$Res>
    implements $AttendanceDetailStateCopyWith<$Res> {
  factory _$$AttendanceDetailStateImplCopyWith(
          _$AttendanceDetailStateImpl value,
          $Res Function(_$AttendanceDetailStateImpl) then) =
      __$$AttendanceDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzStatus status, Failure? failure});
}

/// @nodoc
class __$$AttendanceDetailStateImplCopyWithImpl<$Res>
    extends _$AttendanceDetailStateCopyWithImpl<$Res,
        _$AttendanceDetailStateImpl>
    implements _$$AttendanceDetailStateImplCopyWith<$Res> {
  __$$AttendanceDetailStateImplCopyWithImpl(_$AttendanceDetailStateImpl _value,
      $Res Function(_$AttendanceDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_$AttendanceDetailStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$AttendanceDetailStateImpl extends _AttendanceDetailState {
  const _$AttendanceDetailStateImpl({required this.status, this.failure})
      : super._();

  @override
  final FormzStatus status;
  @override
  final Failure? failure;

  @override
  String toString() {
    return 'AttendanceDetailState(status: $status, failure: $failure)';
  }

  /// Create a copy of AttendanceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceDetailStateImplCopyWith<_$AttendanceDetailStateImpl>
      get copyWith => __$$AttendanceDetailStateImplCopyWithImpl<
          _$AttendanceDetailStateImpl>(this, _$identity);
}

abstract class _AttendanceDetailState extends AttendanceDetailState {
  const factory _AttendanceDetailState(
      {required final FormzStatus status,
      final Failure? failure}) = _$AttendanceDetailStateImpl;
  const _AttendanceDetailState._() : super._();

  @override
  FormzStatus get status;
  @override
  Failure? get failure;

  /// Create a copy of AttendanceDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceDetailStateImplCopyWith<_$AttendanceDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
