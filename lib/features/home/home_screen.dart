import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_theme.dart';
import '../../services/preferences_service.dart';
import '../../widgets/app_header.dart';
import '../../widgets/salary_card.dart';
import '../../widgets/price_input_card.dart';
import '../../widgets/result_card.dart';
import '../../widgets/cta_button.dart';
import '../../widgets/buy_me_a_coffee_button.dart';
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
                      text: 'Organize Your Finances',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      subtitle: 'Want to stop wasting money like this?',
                      onPressed: () async {
                        final uri = Uri.parse('https://properorganizer.com');
                        final launched = await launchUrl(
                          uri,
                          mode: LaunchMode.externalApplication,
                        );

                        if (!launched && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No se pudo abrir el enlace.'),
                            ),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 32),

                    const BuyMeACoffeeButton(),

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
