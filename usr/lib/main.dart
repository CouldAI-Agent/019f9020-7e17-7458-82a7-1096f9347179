import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BiodataScreen(),
      },
    );
  }
}

class BiodataScreen extends StatelessWidget {
  const BiodataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Biodata'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                const ProfileHeader(),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'Personal Information'),
                const SizedBox(height: 16),
                const InfoCard(
                  children: [
                    InfoRow(label: 'Name', value: 'Lekhana HC (Vijayalakshmi)'),
                    InfoRow(label: 'Date of Birth', value: '07/11/2003'),
                    InfoRow(label: 'Time of Birth', value: '11:00 PM'),
                    InfoRow(label: 'Birth Place', value: 'Herisave'),
                    InfoRow(label: 'Zodiac Sign', value: 'Aries'),
                    InfoRow(label: 'Caste', value: 'Vokkaliga (Gangatkar)'),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Education & Career'),
                const SizedBox(height: 16),
                const InfoCard(
                  children: [
                    InfoRow(label: 'Qualification', value: 'B.Com'),
                    InfoRow(label: 'Job', value: 'NBFC Company'),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Family Details'),
                const SizedBox(height: 16),
                const InfoCard(
                  children: [
                    InfoRow(label: 'Father', value: 'Late Chandregowda'),
                    InfoRow(label: 'Mother', value: 'Savitha (Housewife)'),
                    InfoRow(label: 'Younger Sister', value: 'Self-employed'),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle(context, 'Contact Information'),
                const SizedBox(height: 16),
                const InfoCard(
                  children: [
                    InfoRow(
                      label: 'Address',
                      value:
                          'Balaganchi V/P, Herisave H, Channarayapatna T, Hassan D',
                    ),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Icon(
            Icons.person,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Lekhana HC',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'B.Com Professional',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final List<Widget> children;

  const InfoCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
