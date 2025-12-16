// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_resume_layout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResumeLayoutModel {

 int get id; String get side; List<String> get sections; double get widthPercentage;
/// Create a copy of UserResumeLayoutModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResumeLayoutModelCopyWith<UserResumeLayoutModel> get copyWith => _$UserResumeLayoutModelCopyWithImpl<UserResumeLayoutModel>(this as UserResumeLayoutModel, _$identity);

  /// Serializes this UserResumeLayoutModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResumeLayoutModel&&(identical(other.id, id) || other.id == id)&&(identical(other.side, side) || other.side == side)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.widthPercentage, widthPercentage) || other.widthPercentage == widthPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,side,const DeepCollectionEquality().hash(sections),widthPercentage);

@override
String toString() {
  return 'UserResumeLayoutModel(id: $id, side: $side, sections: $sections, widthPercentage: $widthPercentage)';
}


}

/// @nodoc
abstract mixin class $UserResumeLayoutModelCopyWith<$Res>  {
  factory $UserResumeLayoutModelCopyWith(UserResumeLayoutModel value, $Res Function(UserResumeLayoutModel) _then) = _$UserResumeLayoutModelCopyWithImpl;
@useResult
$Res call({
 int id, String side, List<String> sections, double widthPercentage
});




}
/// @nodoc
class _$UserResumeLayoutModelCopyWithImpl<$Res>
    implements $UserResumeLayoutModelCopyWith<$Res> {
  _$UserResumeLayoutModelCopyWithImpl(this._self, this._then);

  final UserResumeLayoutModel _self;
  final $Res Function(UserResumeLayoutModel) _then;

/// Create a copy of UserResumeLayoutModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? side = null,Object? sections = null,Object? widthPercentage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<String>,widthPercentage: null == widthPercentage ? _self.widthPercentage : widthPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResumeLayoutModel].
extension UserResumeLayoutModelPatterns on UserResumeLayoutModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResumeLayoutModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResumeLayoutModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResumeLayoutModel value)  $default,){
final _that = this;
switch (_that) {
case _UserResumeLayoutModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResumeLayoutModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserResumeLayoutModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String side,  List<String> sections,  double widthPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResumeLayoutModel() when $default != null:
return $default(_that.id,_that.side,_that.sections,_that.widthPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String side,  List<String> sections,  double widthPercentage)  $default,) {final _that = this;
switch (_that) {
case _UserResumeLayoutModel():
return $default(_that.id,_that.side,_that.sections,_that.widthPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String side,  List<String> sections,  double widthPercentage)?  $default,) {final _that = this;
switch (_that) {
case _UserResumeLayoutModel() when $default != null:
return $default(_that.id,_that.side,_that.sections,_that.widthPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResumeLayoutModel implements UserResumeLayoutModel {
  const _UserResumeLayoutModel({this.id = 0, this.side = '', final  List<String> sections = const [], this.widthPercentage = 0.0}): _sections = sections;
  factory _UserResumeLayoutModel.fromJson(Map<String, dynamic> json) => _$UserResumeLayoutModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String side;
 final  List<String> _sections;
@override@JsonKey() List<String> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override@JsonKey() final  double widthPercentage;

/// Create a copy of UserResumeLayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResumeLayoutModelCopyWith<_UserResumeLayoutModel> get copyWith => __$UserResumeLayoutModelCopyWithImpl<_UserResumeLayoutModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResumeLayoutModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResumeLayoutModel&&(identical(other.id, id) || other.id == id)&&(identical(other.side, side) || other.side == side)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.widthPercentage, widthPercentage) || other.widthPercentage == widthPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,side,const DeepCollectionEquality().hash(_sections),widthPercentage);

@override
String toString() {
  return 'UserResumeLayoutModel(id: $id, side: $side, sections: $sections, widthPercentage: $widthPercentage)';
}


}

/// @nodoc
abstract mixin class _$UserResumeLayoutModelCopyWith<$Res> implements $UserResumeLayoutModelCopyWith<$Res> {
  factory _$UserResumeLayoutModelCopyWith(_UserResumeLayoutModel value, $Res Function(_UserResumeLayoutModel) _then) = __$UserResumeLayoutModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String side, List<String> sections, double widthPercentage
});




}
/// @nodoc
class __$UserResumeLayoutModelCopyWithImpl<$Res>
    implements _$UserResumeLayoutModelCopyWith<$Res> {
  __$UserResumeLayoutModelCopyWithImpl(this._self, this._then);

  final _UserResumeLayoutModel _self;
  final $Res Function(_UserResumeLayoutModel) _then;

/// Create a copy of UserResumeLayoutModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? side = null,Object? sections = null,Object? widthPercentage = null,}) {
  return _then(_UserResumeLayoutModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<String>,widthPercentage: null == widthPercentage ? _self.widthPercentage : widthPercentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
