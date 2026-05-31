// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterSubmitted value)?  submitted,TResult Function( PasswordChanged value)?  passwordChanged,TResult Function( PasswordVisibilityToggled value)?  passwordVisibilityToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterSubmitted() when submitted != null:
return submitted(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case PasswordVisibilityToggled() when passwordVisibilityToggled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterSubmitted value)  submitted,required TResult Function( PasswordChanged value)  passwordChanged,required TResult Function( PasswordVisibilityToggled value)  passwordVisibilityToggled,}){
final _that = this;
switch (_that) {
case RegisterSubmitted():
return submitted(_that);case PasswordChanged():
return passwordChanged(_that);case PasswordVisibilityToggled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterSubmitted value)?  submitted,TResult? Function( PasswordChanged value)?  passwordChanged,TResult? Function( PasswordVisibilityToggled value)?  passwordVisibilityToggled,}){
final _that = this;
switch (_that) {
case RegisterSubmitted() when submitted != null:
return submitted(_that);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case PasswordVisibilityToggled() when passwordVisibilityToggled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String firstName,  String lastName,  String email,  String password,  String confirmPassword)?  submitted,TResult Function( String password)?  passwordChanged,TResult Function()?  passwordVisibilityToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterSubmitted() when submitted != null:
return submitted(_that.firstName,_that.lastName,_that.email,_that.password,_that.confirmPassword);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case PasswordVisibilityToggled() when passwordVisibilityToggled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String firstName,  String lastName,  String email,  String password,  String confirmPassword)  submitted,required TResult Function( String password)  passwordChanged,required TResult Function()  passwordVisibilityToggled,}) {final _that = this;
switch (_that) {
case RegisterSubmitted():
return submitted(_that.firstName,_that.lastName,_that.email,_that.password,_that.confirmPassword);case PasswordChanged():
return passwordChanged(_that.password);case PasswordVisibilityToggled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String firstName,  String lastName,  String email,  String password,  String confirmPassword)?  submitted,TResult? Function( String password)?  passwordChanged,TResult? Function()?  passwordVisibilityToggled,}) {final _that = this;
switch (_that) {
case RegisterSubmitted() when submitted != null:
return submitted(_that.firstName,_that.lastName,_that.email,_that.password,_that.confirmPassword);case PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case PasswordVisibilityToggled() when passwordVisibilityToggled != null:
return passwordVisibilityToggled();case _:
  return null;

}
}

}

/// @nodoc


class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted({required this.firstName, required this.lastName, required this.email, required this.password, required this.confirmPassword}): super._();
  

 final  String firstName;
 final  String lastName;
 final  String email;
 final  String password;
 final  String confirmPassword;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSubmittedCopyWith<RegisterSubmitted> get copyWith => _$RegisterSubmittedCopyWithImpl<RegisterSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSubmitted&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password,confirmPassword);

@override
String toString() {
  return 'RegisterEvent.submitted(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class $RegisterSubmittedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $RegisterSubmittedCopyWith(RegisterSubmitted value, $Res Function(RegisterSubmitted) _then) = _$RegisterSubmittedCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String password, String confirmPassword
});




}
/// @nodoc
class _$RegisterSubmittedCopyWithImpl<$Res>
    implements $RegisterSubmittedCopyWith<$Res> {
  _$RegisterSubmittedCopyWithImpl(this._self, this._then);

  final RegisterSubmitted _self;
  final $Res Function(RegisterSubmitted) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,Object? confirmPassword = null,}) {
  return _then(RegisterSubmitted(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordChanged extends RegisterEvent {
  const PasswordChanged(this.password): super._();
  

 final  String password;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangedCopyWith<PasswordChanged> get copyWith => _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'RegisterEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class $PasswordChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory $PasswordChangedCopyWith(PasswordChanged value, $Res Function(PasswordChanged) _then) = _$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(this._self, this._then);

  final PasswordChanged _self;
  final $Res Function(PasswordChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PasswordVisibilityToggled extends RegisterEvent {
  const PasswordVisibilityToggled(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordVisibilityToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.passwordVisibilityToggled()';
}


}




/// @nodoc
mixin _$RegisterState {

 bool get hasMinLength; bool get hasUppercase; bool get hasLowercase; bool get hasNumber; bool get hasSpecialCharacter; bool get isPasswordStrong; bool get isPasswordObscured;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialCharacter, hasSpecialCharacter) || other.hasSpecialCharacter == hasSpecialCharacter)&&(identical(other.isPasswordStrong, isPasswordStrong) || other.isPasswordStrong == isPasswordStrong)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialCharacter,isPasswordStrong,isPasswordObscured);

@override
String toString() {
  return 'RegisterState(hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialCharacter: $hasSpecialCharacter, isPasswordStrong: $isPasswordStrong, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialCharacter, bool isPasswordStrong, bool isPasswordObscured
});




}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialCharacter = null,Object? isPasswordStrong = null,Object? isPasswordObscured = null,}) {
  return _then(_self.copyWith(
hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialCharacter: null == hasSpecialCharacter ? _self.hasSpecialCharacter : hasSpecialCharacter // ignore: cast_nullable_to_non_nullable
as bool,isPasswordStrong: null == isPasswordStrong ? _self.isPasswordStrong : isPasswordStrong // ignore: cast_nullable_to_non_nullable
as bool,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegisterInitial value)?  initial,TResult Function( RegisterLoading value)?  loading,TResult Function( RegisterSuccess value)?  success,TResult Function( RegisterFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when loading != null:
return loading(_that);case RegisterSuccess() when success != null:
return success(_that);case RegisterFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegisterInitial value)  initial,required TResult Function( RegisterLoading value)  loading,required TResult Function( RegisterSuccess value)  success,required TResult Function( RegisterFailure value)  failure,}){
final _that = this;
switch (_that) {
case RegisterInitial():
return initial(_that);case RegisterLoading():
return loading(_that);case RegisterSuccess():
return success(_that);case RegisterFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegisterInitial value)?  initial,TResult? Function( RegisterLoading value)?  loading,TResult? Function( RegisterSuccess value)?  success,TResult? Function( RegisterFailure value)?  failure,}){
final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that);case RegisterLoading() when loading != null:
return loading(_that);case RegisterSuccess() when success != null:
return success(_that);case RegisterFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  initial,TResult Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  loading,TResult Function( RegisterEntity result,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  success,TResult Function( String message,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterLoading() when loading != null:
return loading(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterSuccess() when success != null:
return success(_that.result,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterFailure() when failure != null:
return failure(_that.message,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)  initial,required TResult Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)  loading,required TResult Function( RegisterEntity result,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)  success,required TResult Function( String message,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)  failure,}) {final _that = this;
switch (_that) {
case RegisterInitial():
return initial(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterLoading():
return loading(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterSuccess():
return success(_that.result,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterFailure():
return failure(_that.message,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  initial,TResult? Function( bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  loading,TResult? Function( RegisterEntity result,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  success,TResult? Function( String message,  bool hasMinLength,  bool hasUppercase,  bool hasLowercase,  bool hasNumber,  bool hasSpecialCharacter,  bool isPasswordStrong,  bool isPasswordObscured)?  failure,}) {final _that = this;
switch (_that) {
case RegisterInitial() when initial != null:
return initial(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterLoading() when loading != null:
return loading(_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterSuccess() when success != null:
return success(_that.result,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case RegisterFailure() when failure != null:
return failure(_that.message,_that.hasMinLength,_that.hasUppercase,_that.hasLowercase,_that.hasNumber,_that.hasSpecialCharacter,_that.isPasswordStrong,_that.isPasswordObscured);case _:
  return null;

}
}

}

/// @nodoc


class RegisterInitial implements RegisterState {
  const RegisterInitial({this.hasMinLength = false, this.hasUppercase = false, this.hasLowercase = false, this.hasNumber = false, this.hasSpecialCharacter = false, this.isPasswordStrong = false, this.isPasswordObscured = true});
  

@override@JsonKey() final  bool hasMinLength;
@override@JsonKey() final  bool hasUppercase;
@override@JsonKey() final  bool hasLowercase;
@override@JsonKey() final  bool hasNumber;
@override@JsonKey() final  bool hasSpecialCharacter;
@override@JsonKey() final  bool isPasswordStrong;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterInitialCopyWith<RegisterInitial> get copyWith => _$RegisterInitialCopyWithImpl<RegisterInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterInitial&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialCharacter, hasSpecialCharacter) || other.hasSpecialCharacter == hasSpecialCharacter)&&(identical(other.isPasswordStrong, isPasswordStrong) || other.isPasswordStrong == isPasswordStrong)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialCharacter,isPasswordStrong,isPasswordObscured);

@override
String toString() {
  return 'RegisterState.initial(hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialCharacter: $hasSpecialCharacter, isPasswordStrong: $isPasswordStrong, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $RegisterInitialCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterInitialCopyWith(RegisterInitial value, $Res Function(RegisterInitial) _then) = _$RegisterInitialCopyWithImpl;
@override @useResult
$Res call({
 bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialCharacter, bool isPasswordStrong, bool isPasswordObscured
});




}
/// @nodoc
class _$RegisterInitialCopyWithImpl<$Res>
    implements $RegisterInitialCopyWith<$Res> {
  _$RegisterInitialCopyWithImpl(this._self, this._then);

  final RegisterInitial _self;
  final $Res Function(RegisterInitial) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialCharacter = null,Object? isPasswordStrong = null,Object? isPasswordObscured = null,}) {
  return _then(RegisterInitial(
hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialCharacter: null == hasSpecialCharacter ? _self.hasSpecialCharacter : hasSpecialCharacter // ignore: cast_nullable_to_non_nullable
as bool,isPasswordStrong: null == isPasswordStrong ? _self.isPasswordStrong : isPasswordStrong // ignore: cast_nullable_to_non_nullable
as bool,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RegisterLoading implements RegisterState {
  const RegisterLoading({this.hasMinLength = false, this.hasUppercase = false, this.hasLowercase = false, this.hasNumber = false, this.hasSpecialCharacter = false, this.isPasswordStrong = false, this.isPasswordObscured = true});
  

@override@JsonKey() final  bool hasMinLength;
@override@JsonKey() final  bool hasUppercase;
@override@JsonKey() final  bool hasLowercase;
@override@JsonKey() final  bool hasNumber;
@override@JsonKey() final  bool hasSpecialCharacter;
@override@JsonKey() final  bool isPasswordStrong;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterLoadingCopyWith<RegisterLoading> get copyWith => _$RegisterLoadingCopyWithImpl<RegisterLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterLoading&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialCharacter, hasSpecialCharacter) || other.hasSpecialCharacter == hasSpecialCharacter)&&(identical(other.isPasswordStrong, isPasswordStrong) || other.isPasswordStrong == isPasswordStrong)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialCharacter,isPasswordStrong,isPasswordObscured);

@override
String toString() {
  return 'RegisterState.loading(hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialCharacter: $hasSpecialCharacter, isPasswordStrong: $isPasswordStrong, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $RegisterLoadingCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterLoadingCopyWith(RegisterLoading value, $Res Function(RegisterLoading) _then) = _$RegisterLoadingCopyWithImpl;
@override @useResult
$Res call({
 bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialCharacter, bool isPasswordStrong, bool isPasswordObscured
});




}
/// @nodoc
class _$RegisterLoadingCopyWithImpl<$Res>
    implements $RegisterLoadingCopyWith<$Res> {
  _$RegisterLoadingCopyWithImpl(this._self, this._then);

  final RegisterLoading _self;
  final $Res Function(RegisterLoading) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialCharacter = null,Object? isPasswordStrong = null,Object? isPasswordObscured = null,}) {
  return _then(RegisterLoading(
hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialCharacter: null == hasSpecialCharacter ? _self.hasSpecialCharacter : hasSpecialCharacter // ignore: cast_nullable_to_non_nullable
as bool,isPasswordStrong: null == isPasswordStrong ? _self.isPasswordStrong : isPasswordStrong // ignore: cast_nullable_to_non_nullable
as bool,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RegisterSuccess implements RegisterState {
  const RegisterSuccess(this.result, {this.hasMinLength = false, this.hasUppercase = false, this.hasLowercase = false, this.hasNumber = false, this.hasSpecialCharacter = false, this.isPasswordStrong = false, this.isPasswordObscured = true});
  

 final  RegisterEntity result;
@override@JsonKey() final  bool hasMinLength;
@override@JsonKey() final  bool hasUppercase;
@override@JsonKey() final  bool hasLowercase;
@override@JsonKey() final  bool hasNumber;
@override@JsonKey() final  bool hasSpecialCharacter;
@override@JsonKey() final  bool isPasswordStrong;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSuccessCopyWith<RegisterSuccess> get copyWith => _$RegisterSuccessCopyWithImpl<RegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSuccess&&(identical(other.result, result) || other.result == result)&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialCharacter, hasSpecialCharacter) || other.hasSpecialCharacter == hasSpecialCharacter)&&(identical(other.isPasswordStrong, isPasswordStrong) || other.isPasswordStrong == isPasswordStrong)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,result,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialCharacter,isPasswordStrong,isPasswordObscured);

@override
String toString() {
  return 'RegisterState.success(result: $result, hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialCharacter: $hasSpecialCharacter, isPasswordStrong: $isPasswordStrong, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $RegisterSuccessCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterSuccessCopyWith(RegisterSuccess value, $Res Function(RegisterSuccess) _then) = _$RegisterSuccessCopyWithImpl;
@override @useResult
$Res call({
 RegisterEntity result, bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialCharacter, bool isPasswordStrong, bool isPasswordObscured
});




}
/// @nodoc
class _$RegisterSuccessCopyWithImpl<$Res>
    implements $RegisterSuccessCopyWith<$Res> {
  _$RegisterSuccessCopyWithImpl(this._self, this._then);

  final RegisterSuccess _self;
  final $Res Function(RegisterSuccess) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialCharacter = null,Object? isPasswordStrong = null,Object? isPasswordObscured = null,}) {
  return _then(RegisterSuccess(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as RegisterEntity,hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialCharacter: null == hasSpecialCharacter ? _self.hasSpecialCharacter : hasSpecialCharacter // ignore: cast_nullable_to_non_nullable
as bool,isPasswordStrong: null == isPasswordStrong ? _self.isPasswordStrong : isPasswordStrong // ignore: cast_nullable_to_non_nullable
as bool,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RegisterFailure implements RegisterState {
  const RegisterFailure(this.message, {this.hasMinLength = false, this.hasUppercase = false, this.hasLowercase = false, this.hasNumber = false, this.hasSpecialCharacter = false, this.isPasswordStrong = false, this.isPasswordObscured = true});
  

 final  String message;
@override@JsonKey() final  bool hasMinLength;
@override@JsonKey() final  bool hasUppercase;
@override@JsonKey() final  bool hasLowercase;
@override@JsonKey() final  bool hasNumber;
@override@JsonKey() final  bool hasSpecialCharacter;
@override@JsonKey() final  bool isPasswordStrong;
@override@JsonKey() final  bool isPasswordObscured;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterFailureCopyWith<RegisterFailure> get copyWith => _$RegisterFailureCopyWithImpl<RegisterFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.hasMinLength, hasMinLength) || other.hasMinLength == hasMinLength)&&(identical(other.hasUppercase, hasUppercase) || other.hasUppercase == hasUppercase)&&(identical(other.hasLowercase, hasLowercase) || other.hasLowercase == hasLowercase)&&(identical(other.hasNumber, hasNumber) || other.hasNumber == hasNumber)&&(identical(other.hasSpecialCharacter, hasSpecialCharacter) || other.hasSpecialCharacter == hasSpecialCharacter)&&(identical(other.isPasswordStrong, isPasswordStrong) || other.isPasswordStrong == isPasswordStrong)&&(identical(other.isPasswordObscured, isPasswordObscured) || other.isPasswordObscured == isPasswordObscured));
}


@override
int get hashCode => Object.hash(runtimeType,message,hasMinLength,hasUppercase,hasLowercase,hasNumber,hasSpecialCharacter,isPasswordStrong,isPasswordObscured);

@override
String toString() {
  return 'RegisterState.failure(message: $message, hasMinLength: $hasMinLength, hasUppercase: $hasUppercase, hasLowercase: $hasLowercase, hasNumber: $hasNumber, hasSpecialCharacter: $hasSpecialCharacter, isPasswordStrong: $isPasswordStrong, isPasswordObscured: $isPasswordObscured)';
}


}

/// @nodoc
abstract mixin class $RegisterFailureCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory $RegisterFailureCopyWith(RegisterFailure value, $Res Function(RegisterFailure) _then) = _$RegisterFailureCopyWithImpl;
@override @useResult
$Res call({
 String message, bool hasMinLength, bool hasUppercase, bool hasLowercase, bool hasNumber, bool hasSpecialCharacter, bool isPasswordStrong, bool isPasswordObscured
});




}
/// @nodoc
class _$RegisterFailureCopyWithImpl<$Res>
    implements $RegisterFailureCopyWith<$Res> {
  _$RegisterFailureCopyWithImpl(this._self, this._then);

  final RegisterFailure _self;
  final $Res Function(RegisterFailure) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? hasMinLength = null,Object? hasUppercase = null,Object? hasLowercase = null,Object? hasNumber = null,Object? hasSpecialCharacter = null,Object? isPasswordStrong = null,Object? isPasswordObscured = null,}) {
  return _then(RegisterFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,hasMinLength: null == hasMinLength ? _self.hasMinLength : hasMinLength // ignore: cast_nullable_to_non_nullable
as bool,hasUppercase: null == hasUppercase ? _self.hasUppercase : hasUppercase // ignore: cast_nullable_to_non_nullable
as bool,hasLowercase: null == hasLowercase ? _self.hasLowercase : hasLowercase // ignore: cast_nullable_to_non_nullable
as bool,hasNumber: null == hasNumber ? _self.hasNumber : hasNumber // ignore: cast_nullable_to_non_nullable
as bool,hasSpecialCharacter: null == hasSpecialCharacter ? _self.hasSpecialCharacter : hasSpecialCharacter // ignore: cast_nullable_to_non_nullable
as bool,isPasswordStrong: null == isPasswordStrong ? _self.isPasswordStrong : isPasswordStrong // ignore: cast_nullable_to_non_nullable
as bool,isPasswordObscured: null == isPasswordObscured ? _self.isPasswordObscured : isPasswordObscured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
