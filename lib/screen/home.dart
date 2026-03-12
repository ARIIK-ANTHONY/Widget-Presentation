import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false;

  void _toggleCard() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              // duration
              duration: const Duration(milliseconds: 200),
              reverseDuration: const Duration(milliseconds: 700),

              // switchInCurve/switchOutCurve
              switchInCurve: Curves.easeOutCubic,
              switchOutCurve: Curves.easeInCubic,

              // transitionBuilder
              transitionBuilder: (child, animation) {
                final slideAnimation = Tween<Offset>(
                  begin: const Offset(0.0, 0.4),
                  end: Offset.zero,
                ).animate(animation);

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: slideAnimation,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.85,
                        end: 1.0,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                );
              },
              child: _isExpanded
                  ? _buildExpandedCard(theme)
                  : _buildCompactCard(theme),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _toggleCard,
              icon: Icon(_isExpanded ? Icons.close : Icons.open_in_full),
              label: Text(_isExpanded ? 'Show Compact View' : 'Show Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactCard(ThemeData theme) {
    return Container(
      key: const ValueKey('compact'),
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_bag, size: 48),
          const SizedBox(height: 8),
          Text('Order #1042', style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget _buildExpandedCard(ThemeData theme) {
    return Container(
      key: const ValueKey('expanded'),
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order #1042', style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Status: Out for delivery', style: theme.textTheme.bodyLarge),
          const SizedBox(height: 4),
          Text('ETA: 25 minutes', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text('Courier: Ariik', style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
