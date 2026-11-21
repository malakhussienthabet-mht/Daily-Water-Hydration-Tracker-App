
class WaterCalculator {

  static double calculateWater({
    required int weight,
    required double hours,
  }) {
    double baseMl = weight * 35;

    double activityMl = hours * 250;

    double totalMl = baseMl + activityMl;

    double litres = totalMl / 1000;

    return litres;
  }
}
