// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactInformationModel {

 int get id; int get userResumeId; String get fullName; String get position; String get email; String get phoneNumber; String get address; String get gender; String get dateOfBirth; String get portfolio; String get github; String get linkedIn; String get facebook;
/// Create a copy of ContactInformationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactInformationModelCopyWith<ContactInformationModel> get copyWith => _$ContactInformationModelCopyWithImpl<ContactInformationModel>(this as ContactInformationModel, _$identity);

  /// Serializes this ContactInformationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactInformationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.position, position) || other.position == position)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn)&&(identical(other.facebook, facebook) || other.facebook == facebook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,fullName,position,email,phoneNumber,address,gender,dateOfBirth,portfolio,github,linkedIn,facebook);

@override
String toString() {
  return 'ContactInformationModel(id: $id, userResumeId: $userResumeId, fullName: $fullName, position: $position, email: $email, phoneNumber: $phoneNumber, address: $address, gender: $gender, dateOfBirth: $dateOfBirth, portfolio: $portfolio, github: $github, linkedIn: $linkedIn, facebook: $facebook)';
}


}

/// @nodoc
abstract mixin class $ContactInformationModelCopyWith<$Res>  {
  factory $ContactInformationModelCopyWith(ContactInformationModel value, $Res Function(ContactInformationModel) _then) = _$ContactInformationModelCopyWithImpl;
@useResult
$Res call({
 int id, int userResumeId, String fullName, String position, String email, String phoneNumber, String address, String gender, String dateOfBirth, String portfolio, String github, String linkedIn, String facebook
});




}
/// @nodoc
class _$ContactInformationModelCopyWithImpl<$Res>
    implements $ContactInformationModelCopyWith<$Res> {
  _$ContactInformationModelCopyWithImpl(this._self, this._then);

  final ContactInformationModel _self;
  final $Res Function(ContactInformationModel) _then;

/// Create a copy of ContactInformationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userResumeId = null,Object? fullName = null,Object? position = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? gender = null,Object? dateOfBirth = null,Object? portfolio = null,Object? github = null,Object? linkedIn = null,Object? facebook = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,portfolio: null == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String,github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,facebook: null == facebook ? _self.facebook : facebook // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactInformationModel].
extension ContactInformationModelPatterns on ContactInformationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactInformationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactInformationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactInformationModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactInformationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactInformationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactInformationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String fullName,  String position,  String email,  String phoneNumber,  String address,  String gender,  String dateOfBirth,  String portfolio,  String github,  String linkedIn,  String facebook)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactInformationModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.fullName,_that.position,_that.email,_that.phoneNumber,_that.address,_that.gender,_that.dateOfBirth,_that.portfolio,_that.github,_that.linkedIn,_that.facebook);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userResumeId,  String fullName,  String position,  String email,  String phoneNumber,  String address,  String gender,  String dateOfBirth,  String portfolio,  String github,  String linkedIn,  String facebook)  $default,) {final _that = this;
switch (_that) {
case _ContactInformationModel():
return $default(_that.id,_that.userResumeId,_that.fullName,_that.position,_that.email,_that.phoneNumber,_that.address,_that.gender,_that.dateOfBirth,_that.portfolio,_that.github,_that.linkedIn,_that.facebook);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userResumeId,  String fullName,  String position,  String email,  String phoneNumber,  String address,  String gender,  String dateOfBirth,  String portfolio,  String github,  String linkedIn,  String facebook)?  $default,) {final _that = this;
switch (_that) {
case _ContactInformationModel() when $default != null:
return $default(_that.id,_that.userResumeId,_that.fullName,_that.position,_that.email,_that.phoneNumber,_that.address,_that.gender,_that.dateOfBirth,_that.portfolio,_that.github,_that.linkedIn,_that.facebook);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactInformationModel implements ContactInformationModel {
  const _ContactInformationModel({this.id = 0, this.userResumeId = 0, this.fullName = '', this.position = '', this.email = '', this.phoneNumber = '', this.address = '', this.gender = '', this.dateOfBirth = '', this.portfolio = '', this.github = '', this.linkedIn = '', this.facebook = ''});
  factory _ContactInformationModel.fromJson(Map<String, dynamic> json) => _$ContactInformationModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String position;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  String address;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  String portfolio;
@override@JsonKey() final  String github;
@override@JsonKey() final  String linkedIn;
@override@JsonKey() final  String facebook;

/// Create a copy of ContactInformationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactInformationModelCopyWith<_ContactInformationModel> get copyWith => __$ContactInformationModelCopyWithImpl<_ContactInformationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactInformationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactInformationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.position, position) || other.position == position)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn)&&(identical(other.facebook, facebook) || other.facebook == facebook));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userResumeId,fullName,position,email,phoneNumber,address,gender,dateOfBirth,portfolio,github,linkedIn,facebook);

@override
String toString() {
  return 'ContactInformationModel(id: $id, userResumeId: $userResumeId, fullName: $fullName, position: $position, email: $email, phoneNumber: $phoneNumber, address: $address, gender: $gender, dateOfBirth: $dateOfBirth, portfolio: $portfolio, github: $github, linkedIn: $linkedIn, facebook: $facebook)';
}


}

/// @nodoc
abstract mixin class _$ContactInformationModelCopyWith<$Res> implements $ContactInformationModelCopyWith<$Res> {
  factory _$ContactInformationModelCopyWith(_ContactInformationModel value, $Res Function(_ContactInformationModel) _then) = __$ContactInformationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userResumeId, String fullName, String position, String email, String phoneNumber, String address, String gender, String dateOfBirth, String portfolio, String github, String linkedIn, String facebook
});




}
/// @nodoc
class __$ContactInformationModelCopyWithImpl<$Res>
    implements _$ContactInformationModelCopyWith<$Res> {
  __$ContactInformationModelCopyWithImpl(this._self, this._then);

  final _ContactInformationModel _self;
  final $Res Function(_ContactInformationModel) _then;

/// Create a copy of ContactInformationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userResumeId = null,Object? fullName = null,Object? position = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? gender = null,Object? dateOfBirth = null,Object? portfolio = null,Object? github = null,Object? linkedIn = null,Object? facebook = null,}) {
  return _then(_ContactInformationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,portfolio: null == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String,github: null == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String,linkedIn: null == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String,facebook: null == facebook ? _self.facebook : facebook // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
