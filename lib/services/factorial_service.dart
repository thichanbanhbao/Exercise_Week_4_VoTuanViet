import 'dart:core';
import 'package:flutter/foundation.dart';

BigInt calculateFactorial(int n) {
  BigInt result = BigInt.one;
  for (int i = 2; i <= n; i++) {
    result *= BigInt.from(i);
  }
  return result;
}

Future<BigInt> computeFactorial(int n) async {
  return await compute(calculateFactorial, n);
}
