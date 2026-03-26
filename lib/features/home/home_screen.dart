import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_theme.dart';
import '../../services/preferences_service.dart';
import '../../widgets/app_header.dart';
import '../../widgets/salary_card.dart';
import '../../widgets/price_input_card.dart';
import '../../widgets/result_card.dart';
import '../../widgets/cta_button.dart';
import '../../widgets/footer_item.dart';
import '../settings/settings_screen.dart';
import 'home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salary = ref.watch(salaryProvider);
    final homeState = ref.watch(homeViewModelProvider);
    final homeNotifier = ref.read(homeViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppHeader(
                onSettingsPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.textDark,
                          height: 1.1,
                          letterSpacing: -1,
                        ),
                        children: [
                          const TextSpan(text: 'How much of your\nlife is '),
                          TextSpan(
                            text: 'this worth?',
                            style: TextStyle(color: AppTheme.primaryBlue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Money is just time converted into currency.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SalaryCard(
                      salary: salary,
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    PriceInputCard(onChanged: homeNotifier.onInputChanged),

                    const SizedBox(height: 24),

                    ResultCard(result: homeState.result),

                    if (homeState.result != null &&
                        homeState.phrase.isNotEmpty) ...[
                      const SizedBox(height: 32),
                      Text(
                        '"${homeState.phrase}"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],

                    const SizedBox(height: 48),

                    CtaButton(
                      text: 'Organize my finances',
                      subtitle: 'Want to stop wasting money like this?',
                      onPressed: () {
                        // TODO: Implement external logic or advanced features
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Feature coming soon!')),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FooterItem(
                          icon: Icons.check_circle_outline,
                          text: 'NO SIGN-UP REQUIRED',
                        ),
                        SizedBox(width: 16),
                        FooterItem(
                          icon: Icons.lock_outline,
                          text: 'PRIVATE CALCULATION',
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
