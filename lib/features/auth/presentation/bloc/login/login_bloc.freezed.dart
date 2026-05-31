// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginSubmitted value)?  submitted,TResult Function( LoginPasswordVisibilityToggled value)?  passwordVisibilityToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginSubmitted() when submitted != null:
return submitted(_that);case LoginPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginSubmitted value)  submitted,required TResult Function( LoginPasswordVisibilityToggled value)  passwordVisibilityToggled,}){
final _that = this;
switch (_that) {
case LoginSubmitted():
return submitted(_that);case LoginPasswordVisibilityToggled():
return passwordVisibilityToggled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginSubmitted value)?  submitted,TResult? Function( LoginPasswordVisibilityToggled value)?  passwordVisibilityToggled,}){
final _that = this;
switch (_that) {
case LoginSubmitted() when submitted != null:
return submitted(_that);case LoginPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  submitted,TResult Function()?  passwordVisibilityToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginSubmitted() when submitted != null:
return submitted(_that.email,_that.password);case LoginPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  submitted,required TResult Function()  passwordVisibilityToggled,}) {final _that = this;
switch (_that) {
case LoginSubmitted():
return submitted(_that.email,_that.password);case LoginPasswordVisibilityToggled():
return passwordVisibilityToggled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  submitted,TResult? Function()?  passwordVisibilityToggled,}) {final _that = this;
switch (_that) {
case LoginSubmitted() when submitted != null:
return submitted(_that.email,_that.password);case LoginPasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled();case _:
  return null;

}
}

}

/// @nodoc


class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({required this.email, required this.password}): super._();
  

 final  String email;
 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSubmittedCopyWith<LoginSubmitted> get copyWith => _$LoginSubmittedCopyWithImpl<LoginSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginEvent.submitted(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginSubmittedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginSubmittedCopyWith(LoginSubmitted value, $Res Function(LoginSubmitted) _then) = _$LoginSubmittedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginSubmittedCopyWithImpl<$Res>
    implements $LoginSubmittedCopyWith<$Res> {
  _$LoginSubmittedCopyWithImpl(this._self, this._then);

  final LoginSubmitted _self;
  final $Res Function(LoginSubmitted) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginPasswordVisibilityToggled extends LoginEvent {
  const LoginPasswordVisibilityToggled(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPasswordVisibilityToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.passwordVisibilityToggled()';
}


}




/// @nodoc
mixin _$LoginState {

 bool get isPasswordObscured;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordObscured);

@override
String toString() {
  return 'LoginState(isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 bool isPasswordObscured
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPasswordObscured = null,}) {
  return _then(_self.copyWith(
isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginInitial value)?  initial,TResult Function( LoginLoading value)?  loading,TResult Function( LoginSuccess value)?  success,TResult Function( LoginFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loading != null:
return loading(_that);case LoginSuccess() when success != null:
return success(_that);case LoginFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginInitial value)  initial,required TResult Function( LoginLoading value)  loading,required TResult Function( LoginSuccess value)  success,required TResult Function( LoginFailure value)  failure,}){
final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that);case LoginLoading():
return loading(_that);case LoginSuccess():
return success(_that);case LoginFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginInitial value)?  initial,TResult? Function( LoginLoading value)?  loading,TResult? Function( LoginSuccess value)?  success,TResult? Function( LoginFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that);case LoginLoading() when loading != null:
return loading(_that);case LoginSuccess() when success != null:
return success(_that);case LoginFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isPasswordObscured)?  initial,TResult Function( bool isPasswordObscured)?  loading,TResult Function( LoginEntity result,  bool isPasswordObscured)?  success,TResult Function( String message,  bool isPasswordObscured)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that.isPasswordObscured);case LoginLoading() when loading != null:
return loading(_that.isPasswordObscured);case LoginSuccess() when success != null:
return success(_that.result,_that.isPasswordObscured);case LoginFailure() when failure != null:
return failure(_that.message,_that.isPasswordObscured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isPasswordObscured)  initial,required TResult Function( bool isPasswordObscured)  loading,required TResult Function( LoginEntity result,  bool isPasswordObscured)  success,required TResult Function( String message,  bool isPasswordObscured)  failure,}) {final _that = this;
switch (_that) {
case LoginInitial():
return initial(_that.isPasswordObscured);case LoginLoading():
return loading(_that.isPasswordObscured);case LoginSuccess():
return success(_that.result,_that.isPasswordObscured);case LoginFailure():
return failure(_that.message,_that.isPasswordObscured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isPasswordObscured)?  initial,TResult? Function( bool isPasswordObscured)?  loading,TResult? Function( LoginEntity result,  bool isPasswordObscured)?  success,TResult? Function( String message,  bool isPasswordObscured)?  failure,}) {final _that = this;
switch (_that) {
case LoginInitial() when initial != null:
return initial(_that.isPasswordObscured);case LoginLoading() when loading != null:
return loading(_that.isPasswordObscured);case LoginSuccess() when success != null:
return success(_that.result,_that.isPasswordObscured);case LoginFailure() when failure != null:
return failure(_that.message,_that.isPasswordObscured);case _:
  return null;

}
}

}

/// @nodoc


class LoginInitial implements LoginState {
  const LoginInitial({this.isPasswordObscured = true});
  

@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginInitialCopyWith<LoginInitial> get copyWith => _$LoginInitialCopyWithImpl<LoginInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginInitial&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordObscured);

@override
String toString() {
  return 'LoginState.initial(isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $LoginInitialCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginInitialCopyWith(LoginInitial value, $Res Function(LoginInitial) _then) = _$LoginInitialCopyWithImpl;
@override @useResult
$Res call({
 bool isPasswordObscured
});




}
/// @nodoc
class _$LoginInitialCopyWithImpl<$Res>
    implements $LoginInitialCopyWith<$Res> {
  _$LoginInitialCopyWithImpl(this._self, this._then);

  final LoginInitial _self;
  final $Res Function(LoginInitial) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPasswordObscured = null,}) {
  return _then(LoginInitial(
isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoginLoading implements LoginState {
  const LoginLoading({this.isPasswordObscured = true});
  

@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginLoadingCopyWith<LoginLoading> get copyWith => _$LoginLoadingCopyWithImpl<LoginLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoading&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordObscured);

@override
String toString() {
  return 'LoginState.loading(isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $LoginLoadingCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginLoadingCopyWith(LoginLoading value, $Res Function(LoginLoading) _then) = _$LoginLoadingCopyWithImpl;
@override @useResult
$Res call({
 bool isPasswordObscured
});




}
/// @nodoc
class _$LoginLoadingCopyWithImpl<$Res>
    implements $LoginLoadingCopyWith<$Res> {
  _$LoginLoadingCopyWithImpl(this._self, this._then);

  final LoginLoading _self;
  final $Res Function(LoginLoading) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPasswordObscured = null,}) {
  return _then(LoginLoading(
isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoginSuccess implements LoginState {
  const LoginSuccess(this.result, {this.isPasswordObscured = true});
  

 final  LoginEntity result;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessCopyWith<LoginSuccess> get copyWith => _$LoginSuccessCopyWithImpl<LoginSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccess&&(identical(other.result, result) || other.result == result)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,result,isPasswordObscured);

@override
String toString() {
  return 'LoginState.success(result: $result, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessCopyWith(LoginSuccess value, $Res Function(LoginSuccess) _then) = _$LoginSuccessCopyWithImpl;
@override @useResult
$Res call({
 LoginEntity result, bool isPasswordObscured
});




}
/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(this._self, this._then);

  final LoginSuccess _self;
  final $Res Function(LoginSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? isPasswordObscured = null,}) {
  return _then(LoginSuccess(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LoginEntity,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoginFailure implements LoginState {
  const LoginFailure(this.message, {this.isPasswordObscured = true});
  

 final  String message;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginFailureCopyWith<LoginFailure> get copyWith => _$LoginFailureCopyWithImpl<LoginFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,message,isPasswordObscured);

@override
String toString() {
  return 'LoginState.failure(message: $message, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $LoginFailureCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginFailureCopyWith(LoginFailure value, $Res Function(LoginFailure) _then) = _$LoginFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, bool isPasswordObscured
});




}
/// @nodoc
class _$LoginFailureCopyWithImpl<$Res>
    implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(this._self, this._then);

  final LoginFailure _self;
  final $Res Function(LoginFailure) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? isPasswordObscured = null,}) {
  return _then(LoginFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
