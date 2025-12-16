// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResumeModel {

 int get id; String get title; String get description; String get thumbnailUrl; String get type; int get viewCount; int get downloadCount; List<String> get sections;
/// Create a copy of ResumeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeModelCopyWith<ResumeModel> get copyWith => _$ResumeModelCopyWithImpl<ResumeModel>(this as ResumeModel, _$identity);

  /// Serializes this ResumeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&const DeepCollectionEquality().equals(other.sections, sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,thumbnailUrl,type,viewCount,downloadCount,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'ResumeModel(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, type: $type, viewCount: $viewCount, downloadCount: $downloadCount, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $ResumeModelCopyWith<$Res>  {
  factory $ResumeModelCopyWith(ResumeModel value, $Res Function(ResumeModel) _then) = _$ResumeModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String thumbnailUrl, String type, int viewCount, int downloadCount, List<String> sections
});




}
/// @nodoc
class _$ResumeModelCopyWithImpl<$Res>
    implements $ResumeModelCopyWith<$Res> {
  _$ResumeModelCopyWithImpl(this._self, this._then);

  final ResumeModel _self;
  final $Res Function(ResumeModel) _then;

/// Create a copy of ResumeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? thumbnailUrl = null,Object? type = null,Object? viewCount = null,Object? downloadCount = null,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResumeModel].
extension ResumeModelPatterns on ResumeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResumeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResumeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResumeModel value)  $default,){
final _that = this;
switch (_that) {
case _ResumeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResumeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResumeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String thumbnailUrl,  String type,  int viewCount,  int downloadCount,  List<String> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResumeModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.thumbnailUrl,_that.type,_that.viewCount,_that.downloadCount,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String thumbnailUrl,  String type,  int viewCount,  int downloadCount,  List<String> sections)  $default,) {final _that = this;
switch (_that) {
case _ResumeModel():
return $default(_that.id,_that.title,_that.description,_that.thumbnailUrl,_that.type,_that.viewCount,_that.downloadCount,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String thumbnailUrl,  String type,  int viewCount,  int downloadCount,  List<String> sections)?  $default,) {final _that = this;
switch (_that) {
case _ResumeModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.thumbnailUrl,_that.type,_that.viewCount,_that.downloadCount,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResumeModel implements ResumeModel {
  const _ResumeModel({this.id = 0, this.title = '', this.description = '', this.thumbnailUrl = '', this.type = '', this.viewCount = 0, this.downloadCount = 0, final  List<String> sections = const []}): _sections = sections;
  factory _ResumeModel.fromJson(Map<String, dynamic> json) => _$ResumeModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String thumbnailUrl;
@override@JsonKey() final  String type;
@override@JsonKey() final  int viewCount;
@override@JsonKey() final  int downloadCount;
 final  List<String> _sections;
@override@JsonKey() List<String> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of ResumeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeModelCopyWith<_ResumeModel> get copyWith => __$ResumeModelCopyWithImpl<_ResumeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.type, type) || other.type == type)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.downloadCount, downloadCount) || other.downloadCount == downloadCount)&&const DeepCollectionEquality().equals(other._sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,thumbnailUrl,type,viewCount,downloadCount,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'ResumeModel(id: $id, title: $title, description: $description, thumbnailUrl: $thumbnailUrl, type: $type, viewCount: $viewCount, downloadCount: $downloadCount, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$ResumeModelCopyWith<$Res> implements $ResumeModelCopyWith<$Res> {
  factory _$ResumeModelCopyWith(_ResumeModel value, $Res Function(_ResumeModel) _then) = __$ResumeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String thumbnailUrl, String type, int viewCount, int downloadCount, List<String> sections
});




}
/// @nodoc
class __$ResumeModelCopyWithImpl<$Res>
    implements _$ResumeModelCopyWith<$Res> {
  __$ResumeModelCopyWithImpl(this._self, this._then);

  final _ResumeModel _self;
  final $Res Function(_ResumeModel) _then;

/// Create a copy of ResumeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? thumbnailUrl = null,Object? type = null,Object? viewCount = null,Object? downloadCount = null,Object? sections = null,}) {
  return _then(_ResumeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,downloadCount: null == downloadCount ? _self.downloadCount : downloadCount // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
