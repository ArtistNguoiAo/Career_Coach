// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkExperienceModel {

 int get id; int get userResumeId; int get displayOrder; String get company; String get position; String get startTime; String get endTime; String get description;
/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkExperienceModelCopyWith<WorkExperienceModel> get copyWith => _$WorkExperienceModelCopyWithImpl<WorkExperienceModel>(this as WorkExperienceModel, _$identity);

  /// Serializes this WorkExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.company, company) || other.company == company)&&(identical(other.position, position) || other.position == position)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,displayOrder,company,position,startTime,endTime,description);

@override
String toString() {
  return 'WorkExperienceModel(id: $id, userResumeId: $userResumeId, displayOrder: $displayOrder, company: $company, position: $position, startTime: $startTime, endTime: $endTime, description: $description)';
}


}

/// @nodoc
abstract mixin class $WorkExperienceModelCopyWith<$Res>  {
  factory $WorkExperienceModelCopyWith(WorkExperienceModel value, $Res Function(WorkExperienceModel) _then) = _$WorkExperienceModelCopyWithImpl;
@useResult
$Res call({
 int id, int userResumeId, int displayOrder, String company, String position, String startTime, String endTime, String description
});




}
/// @nodoc
class _$WorkExperienceModelCopyWithImpl<$Res>
    implements $WorkExperienceModelCopyWith<$Res> {
  _$WorkExperienceModelCopyWithImpl(this._self, this._then);

  final WorkExperienceModel _self;
  final $Res Function(WorkExperienceModel) _then;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userResumeId = null,Object? displayOrder = null,Object? company = null,Object? position = null,Object? startTime = null,Object? endTime = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkExperienceModel].
extension WorkExperienceModelPatterns on WorkExperienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkExperienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkExperienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkExperienceModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkExperienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkExperienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkExperienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userResumeId,  int displayOrder,  String company,  String position,  String startTime,  String endTime,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkExperienceModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.company,_that.position,_that.startTime,_that.endTime,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userResumeId,  int displayOrder,  String company,  String position,  String startTime,  String endTime,  String description)  $default,) {final _that = this;
switch (_that) {
case _WorkExperienceModel():
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.company,_that.position,_that.startTime,_that.endTime,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userResumeId,  int displayOrder,  String company,  String position,  String startTime,  String endTime,  String description)?  $default,) {final _that = this;
switch (_that) {
case _WorkExperienceModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.displayOrder,_that.company,_that.position,_that.startTime,_that.endTime,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkExperienceModel implements WorkExperienceModel {
  const _WorkExperienceModel({this.id = 0, this.userResumeId = 0, this.displayOrder = 0, this.company = '', this.position = '', this.startTime = '', this.endTime = '', this.description = ''});
  factory _WorkExperienceModel.fromJson(Map<String, dynamic> json) => _$WorkExperienceModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  int displayOrder;
@override@JsonKey() final  String company;
@override@JsonKey() final  String position;
@override@JsonKey() final  String startTime;
@override@JsonKey() final  String endTime;
@override@JsonKey() final  String description;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkExperienceModelCopyWith<_WorkExperienceModel> get copyWith => __$WorkExperienceModelCopyWithImpl<_WorkExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.displayOrder, displayOrder) || other.displayOrder == displayOrder)&&(identical(other.company, company) || other.company == company)&&(identical(other.position, position) || other.position == position)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,displayOrder,company,position,startTime,endTime,description);

@override
String toString() {
  return 'WorkExperienceModel(id: $id, userResumeId: $userResumeId, displayOrder: $displayOrder, company: $company, position: $position, startTime: $startTime, endTime: $endTime, description: $description)';
}


}

/// @nodoc
abstract mixin class _$WorkExperienceModelCopyWith<$Res> implements $WorkExperienceModelCopyWith<$Res> {
  factory _$WorkExperienceModelCopyWith(_WorkExperienceModel value, $Res Function(_WorkExperienceModel) _then) = __$WorkExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userResumeId, int displayOrder, String company, String position, String startTime, String endTime, String description
});




}
/// @nodoc
class __$WorkExperienceModelCopyWithImpl<$Res>
    implements _$WorkExperienceModelCopyWith<$Res> {
  __$WorkExperienceModelCopyWithImpl(this._self, this._then);

  final _WorkExperienceModel _self;
  final $Res Function(_WorkExperienceModel) _then;

/// Create a copy of WorkExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userResumeId = null,Object? displayOrder = null,Object? company = null,Object? position = null,Object? startTime = null,Object? endTime = null,Object? description = null,}) {
  return _then(_WorkExperienceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,displayOrder: null == displayOrder ? _self.displayOrder : displayOrder // ignore: cast_nullable_to_non_nullable
as int,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
