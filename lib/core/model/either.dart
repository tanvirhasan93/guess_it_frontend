abstract class Either<L, R> {
  T fold<T>(T Function(L l) leftfn, T Function(R r) rightFn);
}

class Left<L, R> extends Either<L, R> {
  final L value;
  Left(this.value);

  @override
  T fold<T>(T Function(L l) leftfn, T Function(R r) rightFn) {
    return leftfn(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;
  Right(this.value);

  @override
  T fold<T>(T Function(L l) leftfn, T Function(R r) rightFn) {
    return rightFn(value);
  }
}
