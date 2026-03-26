import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/calculator.dart';
import '../../services/preferences_service.dart';

class HomeState {
  final String rawInput;
  final double price;
  final TimeResult? result;
  final String phrase;

  HomeState({
    this.rawInput = '',
    this.price = 0,
    this.result,
    this.phrase = '',
  });

  HomeState copyWith({
    String? rawInput,
    double? price,
    TimeResult? result,
    String? phrase,
  }) {
    return HomeState(
      rawInput: rawInput ?? this.rawInput,
      price: price ?? this.price,
      result: result ?? this.result,
      phrase: phrase ?? this.phrase,
    );
  }
}

class HomeViewModel extends Notifier<HomeState> {
  Timer? _phraseDebounce;
  bool _phraseGeneratedForCurrentSession = false;

  @override
  HomeState build() {
    return HomeState();
  }

  void onInputChanged(String input) {
    if (input.isEmpty) {
      _phraseGeneratedForCurrentSession = false;
      state = HomeState(); // Reset
      return;
    }

    final monthlySalary = ref.read(salaryProvider);

    // Basic formatting removal for calculation (commas, currency symbols if typed)
    final cleanInput = input.replaceAll(',', '').replaceAll('\$', '');
    final double? parsedPrice = double.tryParse(cleanInput);

    if (parsedPrice == null || parsedPrice <= 0) {
      return;
    }

    final newResult = CalculatorUtils.calculateTime(parsedPrice, monthlySalary);
    
    // Determine the phrase logically
    String updatedPhrase = state.phrase;
    
    if (!_phraseGeneratedForCurrentSession) {
      updatedPhrase = CalculatorUtils.getRandomPhrase(
        newResult.value.toString(),
        newResult.unit.toLowerCase(),
      );
      _phraseGeneratedForCurrentSession = true;
    }

    state = state.copyWith(
      rawInput: input,
      price: parsedPrice,
      result: newResult,
      phrase: updatedPhrase,
    );

    // After 1.5 seconds of no typing, allow a final update of the phrase
    if (_phraseDebounce?.isActive ?? false) _phraseDebounce?.cancel();
    _phraseDebounce = Timer(const Duration(milliseconds: 1500), () {
      final finalResult = CalculatorUtils.calculateTime(state.price, monthlySalary);
      state = state.copyWith(
        phrase: CalculatorUtils.getRandomPhrase(
          finalResult.value.toString(),
          finalResult.unit.toLowerCase(),
        ),
      );
    });
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);
