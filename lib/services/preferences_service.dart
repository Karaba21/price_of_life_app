import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

class PreferencesService {
  final SharedPreferences _prefs;
  static const _salaryKey = 'monthly_salary';

  PreferencesService(this._prefs);

  double getMonthlySalary() {
    return _prefs.getDouble(_salaryKey) ?? 5000.0;
  }

  Future<void> saveMonthlySalary(double salary) async {
    await _prefs.setDouble(_salaryKey, salary);
  }
}

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PreferencesService(prefs);
});

class SalaryNotifier extends Notifier<double> {
  @override
  double build() {
    return ref.watch(preferencesServiceProvider).getMonthlySalary();
  }

  Future<void> updateSalary(double newSalary) async {
    await ref.read(preferencesServiceProvider).saveMonthlySalary(newSalary);
    state = newSalary;
  }
}

final salaryProvider = NotifierProvider<SalaryNotifier, double>(SalaryNotifier.new);
