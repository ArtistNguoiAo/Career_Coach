// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'award_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AwardModel {

 int get id; int get userResumeId; int get displayOrder; String get name; String get awardedAt;
/// Create a copy of AwardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AwardModelCopyWith<AwardModel> get copyWith => _$AwardModelCopyWithImpl<AwardModel>(this as AwardModel, _$identity);

  /// Serializes this AwardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.name, name) || other.name == name)&&(identical(other.awardedAt, awardedAt) || other.awardedAt == awardedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,displayOrder,name,awardedAt);

@override
String toString() {
  return 'AwardModel(id: $id, userResumeId: $userResumeId, displayOrder: $displayOrder, name: $name, awardedAt: $awardedAt)';
}


}

/// @nodoc
abstract mixin class $AwardModelCopyWith<$Res>  {
  factory $AwardModelCopyWith(AwardModel value, $Res Function(AwardModel) _then) = _$AwardModelCopyWithImpl;
@useResult
$Res call({
 int id, int userResumeId, int displayOrder, String name, String awardedAt
});




}
/// @nodoc
class _$AwardModelCopyWithImpl<$Res>
    implements $AwardModelCopyWith<$Res> {
  _$AwardModelCopyWithImpl(this._self, this._then);

  final AwardModel _self;
  final $Res Function(AwardModel) _then;

/// Create a copy of AwardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userResumeId = null,Object? displayOrder = null,Object? name = null,Object? awardedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,awardedAt: null == awardedAt ? _self.awardedAt : awardedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AwardModel].
extension AwardModelPatterns on AwardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AwardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AwardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AwardModel value)  $default,){
final _that = this;
switch (_that) {
case _AwardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AwardModel value)?  $default,){
final _that = this;
switch (_that) {
case _AwardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userResumeId,  int displayOrder,  String name,  String awardedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AwardModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.name,_that.awardedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userResumeId,  int displayOrder,  String name,  String awardedAt)  $default,) {final _that = this;
switch (_that) {
case _AwardModel():
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.name,_that.awardedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userResumeId,  int displayOrder,  String name,  String awardedAt)?  $default,) {final _that = this;
switch (_that) {
case _AwardModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.name,_that.awardedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AwardModel implements AwardModel {
  const _AwardModel({this.id = 0, this.userResumeId = 0, this.displayOrder = 0, this.name = '', this.awardedAt = ''});
  factory _AwardModel.fromJson(Map<String, dynamic> json) => _$AwardModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  int displayOrder;
@override@JsonKey() final  String name;
@override@JsonKey() final  String awardedAt;

/// Create a copy of AwardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AwardModelCopyWith<_AwardModel> get copyWith => __$AwardModelCopyWithImpl<_AwardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AwardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AwardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.name, name) || other.name == name)&&(identical(other.awardedAt, awardedAt) || other.awardedAt == awardedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,displayOrder,name,awardedAt);

@override
String toString() {
  return 'AwardModel(id: $id, userResumeId: $userResumeId, displayOrder: $displayOrder, name: $name, awardedAt: $awardedAt)';
}


}

/// @nodoc
abstract mixin class _$AwardModelCopyWith<$Res> implements $AwardModelCopyWith<$Res> {
  factory _$AwardModelCopyWith(_AwardModel value, $Res Function(_AwardModel) _then) = __$AwardModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userResumeId, int displayOrder, String name, String awardedAt
});




}
/// @nodoc
class __$AwardModelCopyWithImpl<$Res>
    implements _$AwardModelCopyWith<$Res> {
  __$AwardModelCopyWithImpl(this._self, this._then);

  final _AwardModel _self;
  final $Res Function(_AwardModel) _then;

/// Create a copy of AwardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userResumeId = null,Object? displayOrder = null,Object? name = null,Object? awardedAt = null,}) {
  return _then(_AwardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,awardedAt: null == awardedAt ? _self.awardedAt : awardedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
