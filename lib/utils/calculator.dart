class TimeResult {
  final double value;
  final String unit;
  final double totalHours;

  TimeResult({
    required this.value,
    required this.unit,
    required this.totalHours,
  });
}

class CalculatorUtils {
  static const int workDaysPerMonth = 22;
  static const int hoursPerDay = 8;
  static const int workDaysPerWeek = 5;

  static TimeResult calculateTime(double price, double monthlySalary) {
    if (price <= 0 || monthlySalary <= 0) {
      return TimeResult(value: 0, unit: 'HOURS', totalHours: 0);
    }

    final double dailySalary = monthlySalary / workDaysPerMonth;
    final double hourlySalary = dailySalary / hoursPerDay;

    final double totalHours = price / hourlySalary;

    if (totalHours < hoursPerDay) {
      // Show as hours
      return TimeResult(
        value: double.parse(totalHours.toStringAsFixed(1)),
        unit: 'HOURS',
        totalHours: totalHours,
      );
    } else if (totalHours < (hoursPerDay * workDaysPerWeek)) {
      // Show as days
      final double days = totalHours / hoursPerDay;
      return TimeResult(
        value: double.parse(days.toStringAsFixed(1)),
        unit: 'DAYS',
        totalHours: totalHours,
      );
    } else if (totalHours < (hoursPerDay * workDaysPerMonth)) {
      // Show as weeks
      final double weeks = totalHours / (hoursPerDay * workDaysPerWeek);
      return TimeResult(
        value: double.parse(weeks.toStringAsFixed(1)),
        unit: 'WEEKS',
        totalHours: totalHours,
      );
    } else {
      // Show as months
      final double months = totalHours / (hoursPerDay * workDaysPerMonth);
      return TimeResult(
        value: double.parse(months.toStringAsFixed(1)),
        unit: 'MONTHS',
        totalHours: totalHours,
      );
    }
  }

  static String getRandomPhrase(String amount, String unit) {
    // We get phrases with the populated values, though some phrasing might be adapted
    // since the prompt implies {days} means '2.5 days' etc.
    final List<String> phrases = [
      'This costs you $amount $unit of work.',
      'You traded $amount $unit of your life for this.',
      'This is $amount $unit of your time.',
      'That’s $amount $unit you won’t get back.',
      'Was this worth $amount $unit of your life?',
    ];
    phrases.shuffle();
    return phrases.first;
  }
}
