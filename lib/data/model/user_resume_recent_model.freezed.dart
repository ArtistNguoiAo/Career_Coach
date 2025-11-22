// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_resume_recent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResumeRecentModel {

 int get id; String get title; String get createdAt;
/// Create a copy of UserResumeRecentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResumeRecentModelCopyWith<UserResumeRecentModel> get copyWith => _$UserResumeRecentModelCopyWithImpl<UserResumeRecentModel>(this as UserResumeRecentModel, _$identity);

  /// Serializes this UserResumeRecentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResumeRecentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'UserResumeRecentModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserResumeRecentModelCopyWith<$Res>  {
  factory $UserResumeRecentModelCopyWith(UserResumeRecentModel value, $Res Function(UserResumeRecentModel) _then) = _$UserResumeRecentModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String createdAt
});




}
/// @nodoc
class _$UserResumeRecentModelCopyWithImpl<$Res>
    implements $UserResumeRecentModelCopyWith<$Res> {
  _$UserResumeRecentModelCopyWithImpl(this._self, this._then);

  final UserResumeRecentModel _self;
  final $Res Function(UserResumeRecentModel) _then;

/// Create a copy of UserResumeRecentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResumeRecentModel].
extension UserResumeRecentModelPatterns on UserResumeRecentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResumeRecentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResumeRecentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResumeRecentModel value)  $default,){
final _that = this;
switch (_that) {
case _UserResumeRecentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResumeRecentModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserResumeRecentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResumeRecentModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserResumeRecentModel():
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserResumeRecentModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResumeRecentModel implements UserResumeRecentModel {
  const _UserResumeRecentModel({this.id = 0, this.title = '', this.createdAt = ''});
  factory _UserResumeRecentModel.fromJson(Map<String, dynamic> json) => _$UserResumeRecentModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String createdAt;

/// Create a copy of UserResumeRecentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResumeRecentModelCopyWith<_UserResumeRecentModel> get copyWith => __$UserResumeRecentModelCopyWithImpl<_UserResumeRecentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResumeRecentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResumeRecentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'UserResumeRecentModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserResumeRecentModelCopyWith<$Res> implements $UserResumeRecentModelCopyWith<$Res> {
  factory _$UserResumeRecentModelCopyWith(_UserResumeRecentModel value, $Res Function(_UserResumeRecentModel) _then) = __$UserResumeRecentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String createdAt
});




}
/// @nodoc
class __$UserResumeRecentModelCopyWithImpl<$Res>
    implements _$UserResumeRecentModelCopyWith<$Res> {
  __$UserResumeRecentModelCopyWithImpl(this._self, this._then);

  final _UserResumeRecentModel _self;
  final $Res Function(_UserResumeRecentModel) _then;

/// Create a copy of UserResumeRecentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,}) {
  return _then(_UserResumeRecentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
