// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_interview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateInterviewModel {

 int get sessionId; String get experienceLevel; String get status; String get initialMessage; String get startedAt;
/// Create a copy of CreateInterviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInterviewModelCopyWith<CreateInterviewModel> get copyWith => _$CreateInterviewModelCopyWithImpl<CreateInterviewModel>(this as CreateInterviewModel, _$identity);

  /// Serializes this CreateInterviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInterviewModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.initialMessage, initialMessage) || other.initialMessage == initialMessage)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,experienceLevel,status,initialMessage,startedAt);

@override
String toString() {
  return 'CreateInterviewModel(sessionId: $sessionId, experienceLevel: $experienceLevel, status: $status, initialMessage: $initialMessage, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $CreateInterviewModelCopyWith<$Res>  {
  factory $CreateInterviewModelCopyWith(CreateInterviewModel value, $Res Function(CreateInterviewModel) _then) = _$CreateInterviewModelCopyWithImpl;
@useResult
$Res call({
 int sessionId, String experienceLevel, String status, String initialMessage, String startedAt
});




}
/// @nodoc
class _$CreateInterviewModelCopyWithImpl<$Res>
    implements $CreateInterviewModelCopyWith<$Res> {
  _$CreateInterviewModelCopyWithImpl(this._self, this._then);

  final CreateInterviewModel _self;
  final $Res Function(CreateInterviewModel) _then;

/// Create a copy of CreateInterviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? experienceLevel = null,Object? status = null,Object? initialMessage = null,Object? startedAt = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,initialMessage: null == initialMessage ? _self.initialMessage : initialMessage // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInterviewModel].
extension CreateInterviewModelPatterns on CreateInterviewModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInterviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInterviewModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInterviewModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateInterviewModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInterviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInterviewModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessionId,  String experienceLevel,  String status,  String initialMessage,  String startedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInterviewModel() when $default != null:
return $default(_that.sessionId,_that.experienceLevel,_that.status,_that.initialMessage,_that.startedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessionId,  String experienceLevel,  String status,  String initialMessage,  String startedAt)  $default,) {final _that = this;
switch (_that) {
case _CreateInterviewModel():
return $default(_that.sessionId,_that.experienceLevel,_that.status,_that.initialMessage,_that.startedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessionId,  String experienceLevel,  String status,  String initialMessage,  String startedAt)?  $default,) {final _that = this;
switch (_that) {
case _CreateInterviewModel() when $default != null:
return $default(_that.sessionId,_that.experienceLevel,_that.status,_that.initialMessage,_that.startedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateInterviewModel implements CreateInterviewModel {
  const _CreateInterviewModel({this.sessionId = 0, this.experienceLevel = "", this.status = "", this.initialMessage = "", this.startedAt = ""});
  factory _CreateInterviewModel.fromJson(Map<String, dynamic> json) => _$CreateInterviewModelFromJson(json);

@override@JsonKey() final  int sessionId;
@override@JsonKey() final  String experienceLevel;
@override@JsonKey() final  String status;
@override@JsonKey() final  String initialMessage;
@override@JsonKey() final  String startedAt;

/// Create a copy of CreateInterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInterviewModelCopyWith<_CreateInterviewModel> get copyWith => __$CreateInterviewModelCopyWithImpl<_CreateInterviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateInterviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInterviewModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.initialMessage, initialMessage) || other.initialMessage == initialMessage)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,experienceLevel,status,initialMessage,startedAt);

@override
String toString() {
  return 'CreateInterviewModel(sessionId: $sessionId, experienceLevel: $experienceLevel, status: $status, initialMessage: $initialMessage, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class _$CreateInterviewModelCopyWith<$Res> implements $CreateInterviewModelCopyWith<$Res> {
  factory _$CreateInterviewModelCopyWith(_CreateInterviewModel value, $Res Function(_CreateInterviewModel) _then) = __$CreateInterviewModelCopyWithImpl;
@override @useResult
$Res call({
 int sessionId, String experienceLevel, String status, String initialMessage, String startedAt
});




}
/// @nodoc
class __$CreateInterviewModelCopyWithImpl<$Res>
    implements _$CreateInterviewModelCopyWith<$Res> {
  __$CreateInterviewModelCopyWithImpl(this._self, this._then);

  final _CreateInterviewModel _self;
  final $Res Function(_CreateInterviewModel) _then;

/// Create a copy of CreateInterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? experienceLevel = null,Object? status = null,Object? initialMessage = null,Object? startedAt = null,}) {
  return _then(_CreateInterviewModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,initialMessage: null == initialMessage ? _self.initialMessage : initialMessage // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
