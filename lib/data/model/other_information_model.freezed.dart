// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtherInformationModel {

 int get id; int get userResumeId; String get content;
/// Create a copy of OtherInformationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherInformationModelCopyWith<OtherInformationModel> get copyWith => _$OtherInformationModelCopyWithImpl<OtherInformationModel>(this as OtherInformationModel, _$identity);

  /// Serializes this OtherInformationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherInformationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,content);

@override
String toString() {
  return 'OtherInformationModel(id: $id, userResumeId: $userResumeId, content: $content)';
}


}

/// @nodoc
abstract mixin class $OtherInformationModelCopyWith<$Res>  {
  factory $OtherInformationModelCopyWith(OtherInformationModel value, $Res Function(OtherInformationModel) _then) = _$OtherInformationModelCopyWithImpl;
@useResult
$Res call({
 int id, int userResumeId, String content
});




}
/// @nodoc
class _$OtherInformationModelCopyWithImpl<$Res>
    implements $OtherInformationModelCopyWith<$Res> {
  _$OtherInformationModelCopyWithImpl(this._self, this._then);

  final OtherInformationModel _self;
  final $Res Function(OtherInformationModel) _then;

/// Create a copy of OtherInformationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userResumeId = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherInformationModel].
extension OtherInformationModelPatterns on OtherInformationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtherInformationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtherInformationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtherInformationModel value)  $default,){
final _that = this;
switch (_that) {
case _OtherInformationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtherInformationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtherInformationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtherInformationModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String content)  $default,) {final _that = this;
switch (_that) {
case _OtherInformationModel():
return $default(_that.id,_that.userResumeId,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userResumeId,  String content)?  $default,) {final _that = this;
switch (_that) {
case _OtherInformationModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtherInformationModel implements OtherInformationModel {
  const _OtherInformationModel({this.id = 0, this.userResumeId = 0, this.content = ''});
  factory _OtherInformationModel.fromJson(Map<String, dynamic> json) => _$OtherInformationModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  String content;

/// Create a copy of OtherInformationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtherInformationModelCopyWith<_OtherInformationModel> get copyWith => __$OtherInformationModelCopyWithImpl<_OtherInformationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherInformationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtherInformationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,content);

@override
String toString() {
  return 'OtherInformationModel(id: $id, userResumeId: $userResumeId, content: $content)';
}


}

/// @nodoc
abstract mixin class _$OtherInformationModelCopyWith<$Res> implements $OtherInformationModelCopyWith<$Res> {
  factory _$OtherInformationModelCopyWith(_OtherInformationModel value, $Res Function(_OtherInformationModel) _then) = __$OtherInformationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userResumeId, String content
});




}
/// @nodoc
class __$OtherInformationModelCopyWithImpl<$Res>
    implements _$OtherInformationModelCopyWith<$Res> {
  __$OtherInformationModelCopyWithImpl(this._self, this._then);

  final _OtherInformationModel _self;
  final $Res Function(_OtherInformationModel) _then;

/// Create a copy of OtherInformationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userResumeId = null,Object? content = null,}) {
  return _then(_OtherInformationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
