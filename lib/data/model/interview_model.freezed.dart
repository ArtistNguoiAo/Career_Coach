// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterviewModel {

 int get id; String get userId; int get userResumeId; String get uploadedCvPath; String get cvSource; String get experienceLevel; String get status; String get language; String get conversationContext; String get startTime; String get endTime; int get totalMessages;
/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewModelCopyWith<InterviewModel> get copyWith => _$InterviewModelCopyWithImpl<InterviewModel>(this as InterviewModel, _$identity);

  /// Serializes this InterviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.uploadedCvPath, uploadedCvPath) || other.uploadedCvPath == uploadedCvPath)&&(identical(other.cvSource, cvSource) || other.cvSource == cvSource)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.language, language) || other.language == language)&&(identical(other.conversationContext, conversationContext) || other.conversationContext == conversationContext)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalMessages, totalMessages) || other.totalMessages == totalMessages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userResumeId,uploadedCvPath,cvSource,experienceLevel,status,language,conversationContext,startTime,endTime,totalMessages);

@override
String toString() {
  return 'InterviewModel(id: $id, userId: $userId, userResumeId: $userResumeId, uploadedCvPath: $uploadedCvPath, cvSource: $cvSource, experienceLevel: $experienceLevel, status: $status, language: $language, conversationContext: $conversationContext, startTime: $startTime, endTime: $endTime, totalMessages: $totalMessages)';
}


}

/// @nodoc
abstract mixin class $InterviewModelCopyWith<$Res>  {
  factory $InterviewModelCopyWith(InterviewModel value, $Res Function(InterviewModel) _then) = _$InterviewModelCopyWithImpl;
@useResult
$Res call({
 int id, String userId, int userResumeId, String uploadedCvPath, String cvSource, String experienceLevel, String status, String language, String conversationContext, String startTime, String endTime, int totalMessages
});




}
/// @nodoc
class _$InterviewModelCopyWithImpl<$Res>
    implements $InterviewModelCopyWith<$Res> {
  _$InterviewModelCopyWithImpl(this._self, this._then);

  final InterviewModel _self;
  final $Res Function(InterviewModel) _then;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userResumeId = null,Object? uploadedCvPath = null,Object? cvSource = null,Object? experienceLevel = null,Object? status = null,Object? language = null,Object? conversationContext = null,Object? startTime = null,Object? endTime = null,Object? totalMessages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,uploadedCvPath: null == uploadedCvPath ? _self.uploadedCvPath : uploadedCvPath // ignore: cast_nullable_to_non_nullable
as String,cvSource: null == cvSource ? _self.cvSource : cvSource // ignore: cast_nullable_to_non_nullable
as String,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,conversationContext: null == conversationContext ? _self.conversationContext : conversationContext // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,totalMessages: null == totalMessages ? _self.totalMessages : totalMessages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewModel].
extension InterviewModelPatterns on InterviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewModel value)  $default,){
final _that = this;
switch (_that) {
case _InterviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String userId,  int userResumeId,  String uploadedCvPath,  String cvSource,  String experienceLevel,  String status,  String language,  String conversationContext,  String startTime,  String endTime,  int totalMessages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
return $default(_that.id,_that.userId,_that.userResumeId,_that.uploadedCvPath,_that.cvSource,_that.experienceLevel,_that.status,_that.language,_that.conversationContext,_that.startTime,_that.endTime,_that.totalMessages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String userId,  int userResumeId,  String uploadedCvPath,  String cvSource,  String experienceLevel,  String status,  String language,  String conversationContext,  String startTime,  String endTime,  int totalMessages)  $default,) {final _that = this;
switch (_that) {
case _InterviewModel():
return $default(_that.id,_that.userId,_that.userResumeId,_that.uploadedCvPath,_that.cvSource,_that.experienceLevel,_that.status,_that.language,_that.conversationContext,_that.startTime,_that.endTime,_that.totalMessages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String userId,  int userResumeId,  String uploadedCvPath,  String cvSource,  String experienceLevel,  String status,  String language,  String conversationContext,  String startTime,  String endTime,  int totalMessages)?  $default,) {final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
return $default(_that.id,_that.userId,_that.userResumeId,_that.uploadedCvPath,_that.cvSource,_that.experienceLevel,_that.status,_that.language,_that.conversationContext,_that.startTime,_that.endTime,_that.totalMessages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewModel implements InterviewModel {
  const _InterviewModel({this.id = 0, this.userId = "", this.userResumeId = 0, this.uploadedCvPath = "", this.cvSource = "", this.experienceLevel = "", this.status = "", this.language = "", this.conversationContext = "", this.startTime = "", this.endTime = "", this.totalMessages = 0});
  factory _InterviewModel.fromJson(Map<String, dynamic> json) => _$InterviewModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String userId;
@override@JsonKey() final  int userResumeId;
@override@JsonKey() final  String uploadedCvPath;
@override@JsonKey() final  String cvSource;
@override@JsonKey() final  String experienceLevel;
@override@JsonKey() final  String status;
@override@JsonKey() final  String language;
@override@JsonKey() final  String conversationContext;
@override@JsonKey() final  String startTime;
@override@JsonKey() final  String endTime;
@override@JsonKey() final  int totalMessages;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewModelCopyWith<_InterviewModel> get copyWith => __$InterviewModelCopyWithImpl<_InterviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userResumeId, userResumeId) || other.userResumeId == userResumeId)&&(identical(other.uploadedCvPath, uploadedCvPath) || other.uploadedCvPath == uploadedCvPath)&&(identical(other.cvSource, cvSource) || other.cvSource == cvSource)&&(identical(other.experienceLevel, experienceLevel) || other.experienceLevel == experienceLevel)&&(identical(other.status, status) || other.status == status)&&(identical(other.language, language) || other.language == language)&&(identical(other.conversationContext, conversationContext) || other.conversationContext == conversationContext)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalMessages, totalMessages) || other.totalMessages == totalMessages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userResumeId,uploadedCvPath,cvSource,experienceLevel,status,language,conversationContext,startTime,endTime,totalMessages);

@override
String toString() {
  return 'InterviewModel(id: $id, userId: $userId, userResumeId: $userResumeId, uploadedCvPath: $uploadedCvPath, cvSource: $cvSource, experienceLevel: $experienceLevel, status: $status, language: $language, conversationContext: $conversationContext, startTime: $startTime, endTime: $endTime, totalMessages: $totalMessages)';
}


}

/// @nodoc
abstract mixin class _$InterviewModelCopyWith<$Res> implements $InterviewModelCopyWith<$Res> {
  factory _$InterviewModelCopyWith(_InterviewModel value, $Res Function(_InterviewModel) _then) = __$InterviewModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String userId, int userResumeId, String uploadedCvPath, String cvSource, String experienceLevel, String status, String language, String conversationContext, String startTime, String endTime, int totalMessages
});




}
/// @nodoc
class __$InterviewModelCopyWithImpl<$Res>
    implements _$InterviewModelCopyWith<$Res> {
  __$InterviewModelCopyWithImpl(this._self, this._then);

  final _InterviewModel _self;
  final $Res Function(_InterviewModel) _then;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userResumeId = null,Object? uploadedCvPath = null,Object? cvSource = null,Object? experienceLevel = null,Object? status = null,Object? language = null,Object? conversationContext = null,Object? startTime = null,Object? endTime = null,Object? totalMessages = null,}) {
  return _then(_InterviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userResumeId: null == userResumeId ? _self.userResumeId : userResumeId // ignore: cast_nullable_to_non_nullable
as int,uploadedCvPath: null == uploadedCvPath ? _self.uploadedCvPath : uploadedCvPath // ignore: cast_nullable_to_non_nullable
as String,cvSource: null == cvSource ? _self.cvSource : cvSource // ignore: cast_nullable_to_non_nullable
as String,experienceLevel: null == experienceLevel ? _self.experienceLevel : experienceLevel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,conversationContext: null == conversationContext ? _self.conversationContext : conversationContext // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,totalMessages: null == totalMessages ? _self.totalMessages : totalMessages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
