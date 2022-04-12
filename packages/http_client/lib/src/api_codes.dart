import 'package:meta/meta.dart';

@immutable
class APICodes {
  APICodes._();

  // Success
  static const int success = 200;
  static const int success_created = 201;
  static const int success_operation = 202;

  // Not Found
  static const int not_found = 404;
}
