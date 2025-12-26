// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalysisModel {

 int get id; int get sessionId; double get overallScore; double get technicalScore; double get communicationScore; double get confidenceScore; String get strengths; String get weaknesses; String get detailedFeedback; String get recommendations; String get keywordMatches; String get analysisStatus; String get createdAt; String get updatedAt;
/// Create a copy of AnalysisModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalysisModelCopyWith<AnalysisModel> get copyWith => _$AnalysisModelCopyWithImpl<AnalysisModel>(this as AnalysisModel, _$identity);

  /// Serializes this AnalysisModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalysisModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.technicalScore, technicalScore) || other.technicalScore == technicalScore)&&(identical(other.communicationScore, communicationScore) || other.communicationScore == communicationScore)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.strengths, strengths) || other.strengths == strengths)&&(identical(other.weaknesses, weaknesses) || other.weaknesses == weaknesses)&&(identical(other.detailedFeedback, detailedFeedback) || other.detailedFeedback == detailedFeedback)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.keywordMatches, keywordMatches) || other.keywordMatches == keywordMatches)&&(identical(other.analysisStatus, analysisStatus) || other.analysisStatus == analysisStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,overallScore,technicalScore,communicationScore,confidenceScore,strengths,weaknesses,detailedFeedback,recommendations,keywordMatches,analysisStatus,createdAt,updatedAt);

@override
String toString() {
  return 'AnalysisModel(id: $id, sessionId: $sessionId, overallScore: $overallScore, technicalScore: $technicalScore, communicationScore: $communicationScore, confidenceScore: $confidenceScore, strengths: $strengths, weaknesses: $weaknesses, detailedFeedback: $detailedFeedback, recommendations: $recommendations, keywordMatches: $keywordMatches, analysisStatus: $analysisStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AnalysisModelCopyWith<$Res>  {
  factory $AnalysisModelCopyWith(AnalysisModel value, $Res Function(AnalysisModel) _then) = _$AnalysisModelCopyWithImpl;
@useResult
$Res call({
 int id, int sessionId, double overallScore, double technicalScore, double communicationScore, double confidenceScore, String strengths, String weaknesses, String detailedFeedback, String recommendations, String keywordMatches, String analysisStatus, String createdAt, String updatedAt
});




}
/// @nodoc
class _$AnalysisModelCopyWithImpl<$Res>
    implements $AnalysisModelCopyWith<$Res> {
  _$AnalysisModelCopyWithImpl(this._self, this._then);

  final AnalysisModel _self;
  final $Res Function(AnalysisModel) _then;

/// Create a copy of AnalysisModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? overallScore = null,Object? technicalScore = null,Object? communicationScore = null,Object? confidenceScore = null,Object? strengths = null,Object? weaknesses = null,Object? detailedFeedback = null,Object? recommendations = null,Object? keywordMatches = null,Object? analysisStatus = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as double,technicalScore: null == technicalScore ? _self.technicalScore : technicalScore // ignore: cast_nullable_to_non_nullable
as double,communicationScore: null == communicationScore ? _self.communicationScore : communicationScore // ignore: cast_nullable_to_non_nullable
as double,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as String,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as String,detailedFeedback: null == detailedFeedback ? _self.detailedFeedback : detailedFeedback // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as String,keywordMatches: null == keywordMatches ? _self.keywordMatches : keywordMatches // ignore: cast_nullable_to_non_nullable
as String,analysisStatus: null == analysisStatus ? _self.analysisStatus : analysisStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalysisModel].
extension AnalysisModelPatterns on AnalysisModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalysisModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalysisModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalysisModel value)  $default,){
final _that = this;
switch (_that) {
case _AnalysisModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalysisModel value)?  $default,){
final _that = this;
switch (_that) {
case _AnalysisModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sessionId,  double overallScore,  double technicalScore,  double communicationScore,  double confidenceScore,  String strengths,  String weaknesses,  String detailedFeedback,  String recommendations,  String keywordMatches,  String analysisStatus,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalysisModel() when $default != null:
return $default(_that.id,_that.sessionId,_that.overallScore,_that.technicalScore,_that.communicationScore,_that.confidenceScore,_that.strengths,_that.weaknesses,_that.detailedFeedback,_that.recommendations,_that.keywordMatches,_that.analysisStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sessionId,  double overallScore,  double technicalScore,  double communicationScore,  double confidenceScore,  String strengths,  String weaknesses,  String detailedFeedback,  String recommendations,  String keywordMatches,  String analysisStatus,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AnalysisModel():
return $default(_that.id,_that.sessionId,_that.overallScore,_that.technicalScore,_that.communicationScore,_that.confidenceScore,_that.strengths,_that.weaknesses,_that.detailedFeedback,_that.recommendations,_that.keywordMatches,_that.analysisStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sessionId,  double overallScore,  double technicalScore,  double communicationScore,  double confidenceScore,  String strengths,  String weaknesses,  String detailedFeedback,  String recommendations,  String keywordMatches,  String analysisStatus,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AnalysisModel() when $default != null:
return $default(_that.id,_that.sessionId,_that.overallScore,_that.technicalScore,_that.communicationScore,_that.confidenceScore,_that.strengths,_that.weaknesses,_that.detailedFeedback,_that.recommendations,_that.keywordMatches,_that.analysisStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalysisModel implements AnalysisModel {
  const _AnalysisModel({this.id = 0, this.sessionId = 0, this.overallScore = 0.0, this.technicalScore = 0.0, this.communicationScore = 0.0, this.confidenceScore = 0.0, this.strengths = '', this.weaknesses = '', this.detailedFeedback = '', this.recommendations = '', this.keywordMatches = '', this.analysisStatus = '', this.createdAt = '', this.updatedAt = ''});
  factory _AnalysisModel.fromJson(Map<String, dynamic> json) => _$AnalysisModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int sessionId;
@override@JsonKey() final  double overallScore;
@override@JsonKey() final  double technicalScore;
@override@JsonKey() final  double communicationScore;
@override@JsonKey() final  double confidenceScore;
@override@JsonKey() final  String strengths;
@override@JsonKey() final  String weaknesses;
@override@JsonKey() final  String detailedFeedback;
@override@JsonKey() final  String recommendations;
@override@JsonKey() final  String keywordMatches;
@override@JsonKey() final  String analysisStatus;
@override@JsonKey() final  String createdAt;
@override@JsonKey() final  String updatedAt;

/// Create a copy of AnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalysisModelCopyWith<_AnalysisModel> get copyWith => __$AnalysisModelCopyWithImpl<_AnalysisModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalysisModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalysisModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.overallScore, overallScore) || other.overallScore == overallScore)&&(identical(other.technicalScore, technicalScore) || other.technicalScore == technicalScore)&&(identical(other.communicationScore, communicationScore) || other.communicationScore == communicationScore)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.strengths, strengths) || other.strengths == strengths)&&(identical(other.weaknesses, weaknesses) || other.weaknesses == weaknesses)&&(identical(other.detailedFeedback, detailedFeedback) || other.detailedFeedback == detailedFeedback)&&(identical(other.recommendations, recommendations) || other.recommendations == recommendations)&&(identical(other.keywordMatches, keywordMatches) || other.keywordMatches == keywordMatches)&&(identical(other.analysisStatus, analysisStatus) || other.analysisStatus == analysisStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,overallScore,technicalScore,communicationScore,confidenceScore,strengths,weaknesses,detailedFeedback,recommendations,keywordMatches,analysisStatus,createdAt,updatedAt);

@override
String toString() {
  return 'AnalysisModel(id: $id, sessionId: $sessionId, overallScore: $overallScore, technicalScore: $technicalScore, communicationScore: $communicationScore, confidenceScore: $confidenceScore, strengths: $strengths, weaknesses: $weaknesses, detailedFeedback: $detailedFeedback, recommendations: $recommendations, keywordMatches: $keywordMatches, analysisStatus: $analysisStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AnalysisModelCopyWith<$Res> implements $AnalysisModelCopyWith<$Res> {
  factory _$AnalysisModelCopyWith(_AnalysisModel value, $Res Function(_AnalysisModel) _then) = __$AnalysisModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int sessionId, double overallScore, double technicalScore, double communicationScore, double confidenceScore, String strengths, String weaknesses, String detailedFeedback, String recommendations, String keywordMatches, String analysisStatus, String createdAt, String updatedAt
});




}
/// @nodoc
class __$AnalysisModelCopyWithImpl<$Res>
    implements _$AnalysisModelCopyWith<$Res> {
  __$AnalysisModelCopyWithImpl(this._self, this._then);

  final _AnalysisModel _self;
  final $Res Function(_AnalysisModel) _then;

/// Create a copy of AnalysisModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? overallScore = null,Object? technicalScore = null,Object? communicationScore = null,Object? confidenceScore = null,Object? strengths = null,Object? weaknesses = null,Object? detailedFeedback = null,Object? recommendations = null,Object? keywordMatches = null,Object? analysisStatus = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AnalysisModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,overallScore: null == overallScore ? _self.overallScore : overallScore // ignore: cast_nullable_to_non_nullable
as double,technicalScore: null == technicalScore ? _self.technicalScore : technicalScore // ignore: cast_nullable_to_non_nullable
as double,communicationScore: null == communicationScore ? _self.communicationScore : communicationScore // ignore: cast_nullable_to_non_nullable
as double,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as String,weaknesses: null == weaknesses ? _self.weaknesses : weaknesses // ignore: cast_nullable_to_non_nullable
as String,detailedFeedback: null == detailedFeedback ? _self.detailedFeedback : detailedFeedback // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as String,keywordMatches: null == keywordMatches ? _self.keywordMatches : keywordMatches // ignore: cast_nullable_to_non_nullable
as String,analysisStatus: null == analysisStatus ? _self.analysisStatus : analysisStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
