// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvatarModel {

 int get id; int get userResumeId; String get alt; String get filename; String get url;
/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarModelCopyWith<AvatarModel> get copyWith => _$AvatarModelCopyWithImpl<AvatarModel>(this as AvatarModel, _$identity);

  /// Serializes this AvatarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,alt,filename,url);

@override
String toString() {
  return 'AvatarModel(id: $id, userResumeId: $userResumeId, alt: $alt, filename: $filename, url: $url)';
}


}

/// @nodoc
abstract mixin class $AvatarModelCopyWith<$Res>  {
  factory $AvatarModelCopyWith(AvatarModel value, $Res Function(AvatarModel) _then) = _$AvatarModelCopyWithImpl;
@useResult
$Res call({
 int id, int userResumeId, String alt, String filename, String url
});




}
/// @nodoc
class _$AvatarModelCopyWithImpl<$Res>
    implements $AvatarModelCopyWith<$Res> {
  _$AvatarModelCopyWithImpl(this._self, this._then);

  final AvatarModel _self;
  final $Res Function(AvatarModel) _then;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userResumeId = null,Object? alt = null,Object? filename = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarModel].
extension AvatarModelPatterns on AvatarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarModel value)  $default,){
final _that = this;
switch (_that) {
case _AvatarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String alt,  String filename,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.alt,_that.filename,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String alt,  String filename,  String url)  $default,) {final _that = this;
switch (_that) {
case _AvatarModel():
return $default(_that.id,_that.userResumeId,_that.alt,_that.filename,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userResumeId,  String alt,  String filename,  String url)?  $default,) {final _that = this;
switch (_that) {
case _AvatarModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.alt,_that.filename,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvatarModel implements AvatarModel {
  const _AvatarModel({this.id = 0, this.userResumeId = 0, this.alt = '', this.filename = '', this.url = ''});
  factory _AvatarModel.fromJson(Map<String, dynamic> json) => _$AvatarModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  String alt;
@override@JsonKey() final  String filename;
@override@JsonKey() final  String url;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarModelCopyWith<_AvatarModel> get copyWith => __$AvatarModelCopyWithImpl<_AvatarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvatarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,alt,filename,url);

@override
String toString() {
  return 'AvatarModel(id: $id, userResumeId: $userResumeId, alt: $alt, filename: $filename, url: $url)';
}


}

/// @nodoc
abstract mixin class _$AvatarModelCopyWith<$Res> implements $AvatarModelCopyWith<$Res> {
  factory _$AvatarModelCopyWith(_AvatarModel value, $Res Function(_AvatarModel) _then) = __$AvatarModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userResumeId, String alt, String filename, String url
});




}
/// @nodoc
class __$AvatarModelCopyWithImpl<$Res>
    implements _$AvatarModelCopyWith<$Res> {
  __$AvatarModelCopyWithImpl(this._self, this._then);

  final _AvatarModel _self;
  final $Res Function(_AvatarModel) _then;

/// Create a copy of AvatarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userResumeId = null,Object? alt = null,Object? filename = null,Object? url = null,}) {
  return _then(_AvatarModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,alt: null == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as String,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
