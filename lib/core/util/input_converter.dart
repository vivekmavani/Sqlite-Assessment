import 'package:dartz/dartz.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqlite_assessment/core/error/failures.dart';


class InputConverter {
  Either<Failure, String>? stringToReadableDateString(String str) {
    try {
      final date = Jiffy(str).format("MMMM do yyyy, h:mm:ss a").toString();
      if (date.isEmpty) throw const FormatException();
      return Right(date);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}