import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name is required'),
]);

final surnameValidator = MultiValidator([
  RequiredValidator(errorText: 'Surname is required'),
]);

final identityValidator = MultiValidator([
  RequiredValidator(errorText: 'Identity is required'),
  MinLengthValidator(11, errorText: 'Identity must be 11 digits long'),
  MaxLengthValidator(11, errorText: 'Identity must be 11 digits long')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: "Enter a valid email address")
]);

final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    //PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);



