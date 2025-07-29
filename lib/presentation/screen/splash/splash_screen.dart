import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:career_coach/data/local/local_cache.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = false;
  bool _scaled = false;

  @override
  void initState() {
    super.initState();

    // Start animation
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _visible = true;
        _scaled = true;
      });
    });

    // Navigate to home or login after 2.5s
    Timer(const Duration(milliseconds: 2500), ()  async {
      final checkIsLoggedIn = await LocalCache.getBool(StringCache.isLoggedIn);
      if (!mounted) return;
      if(checkIsLoggedIn) {
        AutoRouter.of(context).replaceAll([const OverViewRoute()]);
      } else {
        AutoRouter.of(context).replaceAll([const LoginRoute()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1200),
          opacity: _visible ? 1 : 0,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 900),
            scale: _scaled ? 1.0 : 0.6,
            curve: Curves.easeOutBack,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo or Icon
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // App name
                const Text(
                  'Career Coach',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your path. Your future.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
