import 'package:flutter_test/flutter_test.dart';
import 'package:dailywater_and_hydrationtracker/calculate_function/water_calculator.dart';

void main() {
  group('WaterCalculator Test Cases from Specification', () {
    test('Test Case 1: weight 50kg, 0h activity -> 1.75 L', () {
      final result = WaterCalculator.calculateWater(weight: 50, hours: 0);
      expect(result, 1.75);
    });

    test('Test Case 2: weight 60kg, 8h activity -> 4.10 L', () {
      final result = WaterCalculator.calculateWater(weight: 60, hours: 8);
      expect(result, 4.10);
    });

    test('Test Case 3: weight 70kg, 2h activity -> 2.95 L', () {
      final result = WaterCalculator.calculateWater(weight: 70, hours: 2);
      expect(result, 2.95);
    });

    test('Test Case 4: weight 90kg, 4h activity -> 4.15 L', () {
      final result = WaterCalculator.calculateWater(weight: 90, hours: 4);
      expect(result, 4.15);
    });
  });
}
