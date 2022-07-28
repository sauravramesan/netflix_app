// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';
@freezed
class MainFailure with _$MainFailure{
  // ignore: non_constant_identifier_names
  const factory MainFailure.ClientFailure() = _ClientFailure;
  const factory MainFailure.serverFailure() = _serverFailure;
  
}
