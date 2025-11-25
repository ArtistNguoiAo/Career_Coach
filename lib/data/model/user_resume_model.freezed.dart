// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_resume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResumeModel {

 int get id; String get title; int get numberOfColumns; String get language; String get fontFamily; int get fontSize; double get lineHeight; String get color; List<UserResumeLayoutModel> get layouts;
/// Create a copy of UserResumeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResumeModelCopyWith<UserResumeModel> get copyWith => _$UserResumeModelCopyWithImpl<UserResumeModel>(this as UserResumeModel, _$identity);

  /// Serializes this UserResumeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResumeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.numberOfColumns, numberOfColumns) || other.numberOfColumns == numberOfColumns)&&(identical(other.language, language) || other.language == language)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.layouts, layouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,numberOfColumns,language,fontFamily,fontSize,lineHeight,color,const DeepCollectionEquality().hash(layouts));

@override
String toString() {
  return 'UserResumeModel(id: $id, title: $title, numberOfColumns: $numberOfColumns, language: $language, fontFamily: $fontFamily, fontSize: $fontSize, lineHeight: $lineHeight, color: $color, layouts: $layouts)';
}


}

/// @nodoc
abstract mixin class $UserResumeModelCopyWith<$Res>  {
  factory $UserResumeModelCopyWith(UserResumeModel value, $Res Function(UserResumeModel) _then) = _$UserResumeModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, int numberOfColumns, String language, String fontFamily, int fontSize, double lineHeight, String color, List<UserResumeLayoutModel> layouts
});




}
/// @nodoc
class _$UserResumeModelCopyWithImpl<$Res>
    implements $UserResumeModelCopyWith<$Res> {
  _$UserResumeModelCopyWithImpl(this._self, this._then);

  final UserResumeModel _self;
  final $Res Function(UserResumeModel) _then;

/// Create a copy of UserResumeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? numberOfColumns = null,Object? language = null,Object? fontFamily = null,Object? fontSize = null,Object? lineHeight = null,Object? color = null,Object? layouts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,numberOfColumns: null == numberOfColumns ? _self.numberOfColumns : numberOfColumns // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,layouts: null == layouts ? _self.layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<UserResumeLayoutModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResumeModel].
extension UserResumeModelPatterns on UserResumeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResumeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResumeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResumeModel value)  $default,){
final _that = this;
switch (_that) {
case _UserResumeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResumeModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserResumeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int numberOfColumns,  String language,  String fontFamily,  int fontSize,  double lineHeight,  String color,  List<UserResumeLayoutModel> layouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResumeModel() when $default != null:
return $default(_that.id,_that.title,_that.numberOfColumns,_that.language,_that.fontFamily,_that.fontSize,_that.lineHeight,_that.color,_that.layouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int numberOfColumns,  String language,  String fontFamily,  int fontSize,  double lineHeight,  String color,  List<UserResumeLayoutModel> layouts)  $default,) {final _that = this;
switch (_that) {
case _UserResumeModel():
return $default(_that.id,_that.title,_that.numberOfColumns,_that.language,_that.fontFamily,_that.fontSize,_that.lineHeight,_that.color,_that.layouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int numberOfColumns,  String language,  String fontFamily,  int fontSize,  double lineHeight,  String color,  List<UserResumeLayoutModel> layouts)?  $default,) {final _that = this;
switch (_that) {
case _UserResumeModel() when $default != null:
return $default(_that.id,_that.title,_that.numberOfColumns,_that.language,_that.fontFamily,_that.fontSize,_that.lineHeight,_that.color,_that.layouts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResumeModel implements UserResumeModel {
  const _UserResumeModel({this.id = 0, this.title = '', this.numberOfColumns = 0, this.language = 'VIETNAMESE', this.fontFamily = 'ARIAL', this.fontSize = 16, this.lineHeight = 1.0, this.color = '#000000', final  List<UserResumeLayoutModel> layouts = const []}): _layouts = layouts;
  factory _UserResumeModel.fromJson(Map<String, dynamic> json) => _$UserResumeModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  int numberOfColumns;
@override@JsonKey() final  String language;
@override@JsonKey() final  String fontFamily;
@override@JsonKey() final  int fontSize;
@override@JsonKey() final  double lineHeight;
@override@JsonKey() final  String color;
 final  List<UserResumeLayoutModel> _layouts;
@override@JsonKey() List<UserResumeLayoutModel> get layouts {
  if (_layouts is EqualUnmodifiableListView) return _layouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_layouts);
}


/// Create a copy of UserResumeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResumeModelCopyWith<_UserResumeModel> get copyWith => __$UserResumeModelCopyWithImpl<_UserResumeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResumeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResumeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.numberOfColumns, numberOfColumns) || other.numberOfColumns == numberOfColumns)&&(identical(other.language, language) || other.language == language)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._layouts, _layouts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,numberOfColumns,language,fontFamily,fontSize,lineHeight,color,const DeepCollectionEquality().hash(_layouts));

@override
String toString() {
  return 'UserResumeModel(id: $id, title: $title, numberOfColumns: $numberOfColumns, language: $language, fontFamily: $fontFamily, fontSize: $fontSize, lineHeight: $lineHeight, color: $color, layouts: $layouts)';
}


}

/// @nodoc
abstract mixin class _$UserResumeModelCopyWith<$Res> implements $UserResumeModelCopyWith<$Res> {
  factory _$UserResumeModelCopyWith(_UserResumeModel value, $Res Function(_UserResumeModel) _then) = __$UserResumeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int numberOfColumns, String language, String fontFamily, int fontSize, double lineHeight, String color, List<UserResumeLayoutModel> layouts
});




}
/// @nodoc
class __$UserResumeModelCopyWithImpl<$Res>
    implements _$UserResumeModelCopyWith<$Res> {
  __$UserResumeModelCopyWithImpl(this._self, this._then);

  final _UserResumeModel _self;
  final $Res Function(_UserResumeModel) _then;

/// Create a copy of UserResumeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? numberOfColumns = null,Object? language = null,Object? fontFamily = null,Object? fontSize = null,Object? lineHeight = null,Object? color = null,Object? layouts = null,}) {
  return _then(_UserResumeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,numberOfColumns: null == numberOfColumns ? _self.numberOfColumns : numberOfColumns // ignore: cast_nullable_to_non_nullable
as int,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,layouts: null == layouts ? _self._layouts : layouts // ignore: cast_nullable_to_non_nullable
as List<UserResumeLayoutModel>,
  ));
}


}

// dart format on
