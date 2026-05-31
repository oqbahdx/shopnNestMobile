// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordEvent {

 String get email;
/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordEventCopyWith<ForgotPasswordEvent> get copyWith => _$ForgotPasswordEventCopyWithImpl<ForgotPasswordEvent>(this as ForgotPasswordEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordEvent&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordEvent(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordEventCopyWith<$Res>  {
  factory $ForgotPasswordEventCopyWith(ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) _then) = _$ForgotPasswordEventCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._self, this._then);

  final ForgotPasswordEvent _self;
  final $Res Function(ForgotPasswordEvent) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordEvent].
extension ForgotPasswordEventPatterns on ForgotPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when submitted != null:
return submitted(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  submitted,}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted():
return submitted(_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  submitted,}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when submitted != null:
return submitted(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordSubmitted extends ForgotPasswordEvent {
  const ForgotPasswordSubmitted({required this.email}): super._();
  

@override final  String email;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordSubmittedCopyWith<ForgotPasswordSubmitted> get copyWith => _$ForgotPasswordSubmittedCopyWithImpl<ForgotPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordSubmitted&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ForgotPasswordEvent.submitted(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordSubmittedCopyWith<$Res> implements $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordSubmittedCopyWith(ForgotPasswordSubmitted value, $Res Function(ForgotPasswordSubmitted) _then) = _$ForgotPasswordSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordSubmittedCopyWithImpl<$Res>
    implements $ForgotPasswordSubmittedCopyWith<$Res> {
  _$ForgotPasswordSubmittedCopyWithImpl(this._self, this._then);

  final ForgotPasswordSubmitted _self;
  final $Res Function(ForgotPasswordSubmitted) _then;

/// Create a copy of ForgotPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ForgotPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState()';
}


}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res>  {
$ForgotPasswordStateCopyWith(ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordInitial value)?  initial,TResult Function( ForgotPasswordLoading value)?  loading,TResult Function( ForgotPasswordSuccess value)?  success,TResult Function( ForgotPasswordFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordInitial() when initial != null:
return initial(_that);case ForgotPasswordLoading() when loading != null:
return loading(_that);case ForgotPasswordSuccess() when success != null:
return success(_that);case ForgotPasswordFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordInitial value)  initial,required TResult Function( ForgotPasswordLoading value)  loading,required TResult Function( ForgotPasswordSuccess value)  success,required TResult Function( ForgotPasswordFailure value)  failure,}){
final _that = this;
switch (_that) {
case ForgotPasswordInitial():
return initial(_that);case ForgotPasswordLoading():
return loading(_that);case ForgotPasswordSuccess():
return success(_that);case ForgotPasswordFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordInitial value)?  initial,TResult? Function( ForgotPasswordLoading value)?  loading,TResult? Function( ForgotPasswordSuccess value)?  success,TResult? Function( ForgotPasswordFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ForgotPasswordInitial() when initial != null:
return initial(_that);case ForgotPasswordLoading() when loading != null:
return loading(_that);case ForgotPasswordSuccess() when success != null:
return success(_that);case ForgotPasswordFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordInitial() when initial != null:
return initial();case ForgotPasswordLoading() when loading != null:
return loading();case ForgotPasswordSuccess() when success != null:
return success(_that.message);case ForgotPasswordFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ForgotPasswordInitial():
return initial();case ForgotPasswordLoading():
return loading();case ForgotPasswordSuccess():
return success(_that.message);case ForgotPasswordFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ForgotPasswordInitial() when initial != null:
return initial();case ForgotPasswordLoading() when loading != null:
return loading();case ForgotPasswordSuccess() when success != null:
return success(_that.message);case ForgotPasswordFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordInitial implements ForgotPasswordState {
  const ForgotPasswordInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.initial()';
}


}




/// @nodoc


class ForgotPasswordLoading implements ForgotPasswordState {
  const ForgotPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.loading()';
}


}




/// @nodoc


class ForgotPasswordSuccess implements ForgotPasswordState {
  const ForgotPasswordSuccess(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordSuccessCopyWith<ForgotPasswordSuccess> get copyWith => _$ForgotPasswordSuccessCopyWithImpl<ForgotPasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordSuccessCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordSuccessCopyWith(ForgotPasswordSuccess value, $Res Function(ForgotPasswordSuccess) _then) = _$ForgotPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ForgotPasswordSuccessCopyWithImpl<$Res>
    implements $ForgotPasswordSuccessCopyWith<$Res> {
  _$ForgotPasswordSuccessCopyWithImpl(this._self, this._then);

  final ForgotPasswordSuccess _self;
  final $Res Function(ForgotPasswordSuccess) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ForgotPasswordSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ForgotPasswordFailure implements ForgotPasswordState {
  const ForgotPasswordFailure(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordFailureCopyWith<ForgotPasswordFailure> get copyWith => _$ForgotPasswordFailureCopyWithImpl<ForgotPasswordFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordFailureCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordFailureCopyWith(ForgotPasswordFailure value, $Res Function(ForgotPasswordFailure) _then) = _$ForgotPasswordFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ForgotPasswordFailureCopyWithImpl<$Res>
    implements $ForgotPasswordFailureCopyWith<$Res> {
  _$ForgotPasswordFailureCopyWithImpl(this._self, this._then);

  final ForgotPasswordFailure _self;
  final $Res Function(ForgotPasswordFailure) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ForgotPasswordFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
