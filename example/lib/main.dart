import 'package:flutter/material.dart';
import 'package:smart_gap/smart_gap.dart';
// import 'package:smart_gap/smart_gap.dart';

void main() => runApp(const SmartGapExampleApp());

class SmartGapExampleApp extends StatelessWidget {
  const SmartGapExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Gap Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
     
      ),
      home: const ExamplesHomePage(),
    );
  }
}

class ExamplesHomePage extends StatefulWidget {
  const ExamplesHomePage({super.key});

  @override
  State<ExamplesHomePage> createState() => _ExamplesHomePageState();
}

class _ExamplesHomePageState extends State<ExamplesHomePage> {
  int _selectedIndex = 0;

  final List<ExamplePage> _pages = [
    ExamplePage(
      title: 'Basic Examples',
      icon: Icons.space_bar,
      builder: () => const BasicExamplesPage(),
    ),
    ExamplePage(
      title: 'Advanced',
      icon: Icons.auto_awesome,
      builder: () => const AdvancedExamplesPage(),
    ),
    ExamplePage(
      title: 'Real World',
      icon: Icons.apps,
      builder: () => const RealWorldExamplesPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Gap Examples'),
        elevation: 2,
      ),
      body: _pages[_selectedIndex].builder(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: _pages
            .map((page) => NavigationDestination(
                  icon: Icon(page.icon),
                  label: page.title,
                ))
            .toList(),
      ),
    );
  }
}

class ExamplePage {
  final String title;
  final IconData icon;
  final Widget Function() builder;

  ExamplePage({
    required this.title,
    required this.icon,
    required this.builder,
  });
}

// ============================================================================
// BASIC EXAMPLES
// ============================================================================

class BasicExamplesPage extends StatelessWidget {
  const BasicExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const _ExampleCard(
          title: '1. Row - Horizontal Gaps',
          description: 'Gap automatically becomes horizontal in Row',
          code: '''Row(
  children: [
    Text('A'),
    Gap(16),  // Auto horizontal
    Text('B'),
    Gap(24),
    Text('C'),
  ],
)''',
          child: Row(
            children: [
              _ColorBox('A', Colors.blue),
              Gap(16),
              _ColorBox('B', Colors.green),
              Gap(24),
              _ColorBox('C', Colors.orange),
            ],
          ),
        ),
        Gaps.lg,
        const _ExampleCard(
          title: '2. Column - Vertical Gaps',
          description: 'Gap automatically becomes vertical in Column',
          code: '''Column(
  children: [
    Text('1'),
    Gap(16),  // Auto vertical
    Text('2'),
    Gap(24),
    Text('3'),
  ],
)''',
          child: Column(
            children: [
              _ColorBox('1', Colors.blue),
              Gap(16),
              _ColorBox('2', Colors.green),
              Gap(24),
              _ColorBox('3', Colors.orange),
            ],
          ),
        ),
        Gaps.lg,
        const _ExampleCard(
          title: '3. Predefined Sizes',
          description: 'Use Gaps.xs, sm, md, lg, xl, xxl for consistent spacing',
          code: '''Column(
  children: [
    Text('xs - 4px'),
    Gaps.xs,
    Text('sm - 8px'),
    Gaps.sm,
    Text('md - 16px'),
    Gaps.md,
    Text('lg - 24px'),
  ],
)''',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Extra Small (4px)'),
              Gaps.xs,
              Text('Small (8px)'),
              Gaps.sm,
              Text('Medium (16px)'),
              Gaps.md,
              Text('Large (24px)'),
              Gaps.lg,
              Text('Extra Large (32px)'),
            ],
          ),
        ),
        Gaps.lg,
        _ExampleCard(
          title: '4. Extension Syntax',
          description: 'Quick syntax: 16.gap instead of Gap(16)',
          code: '''Row(
  children: [
    Text('A'),
    8.gap,   // Quick!
    Text('B'),
    16.gap,
    Text('C'),
  ],
)''',
          child: Row(
            children: [
              const _ColorBox('A', Colors.purple),
              8.gap,
              const _ColorBox('B', Colors.pink),
              16.gap,
              const _ColorBox('C', Colors.teal),
            ],
          ),
        ),
        Gaps.lg,
        _ExampleCard(
          title: '5. Debug Mode',
          description: 'Visualize gaps with colors',
          code: '''Row(
  children: [
    Text('A'),
    16.coloredGap(Colors.red.withOpacity(0.3)),
    Text('B'),
    24.coloredGap(Colors.blue.withOpacity(0.3)),
    Text('C'),
  ],
)''',
          child: Row(
            children: [
              const _ColorBox('A', Colors.blue),
              16.coloredGap(Colors.red.withOpacity(0.3)),
              const _ColorBox('B', Colors.green),
              24.coloredGap(Colors.blue.withOpacity(0.3)),
              const _ColorBox('C', Colors.orange),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// ADVANCED EXAMPLES
// ============================================================================

class AdvancedExamplesPage extends StatelessWidget {
  const AdvancedExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const _ExampleCard(
          title: '1. Gap2D - For Wrap',
          description: 'Spacing in both directions',
          code: '''Wrap(
  children: [
    Chip(label: Text('Tag 1')),
    Gap2D.all(8),
    Chip(label: Text('Tag 2')),
  ],
)''',
          child: Wrap(
            children: [
              Chip(label: Text('Flutter')),
              Gap2D.all(8),
              Chip(label: Text('Dart')),
              Gap2D.all(8),
              Chip(label: Text('Firebase')),
              Gap2D.all(8),
              Chip(label: Text('Riverpod')),
            ],
          ),
        ),
        Gaps.lg,
        const _ExampleCard(
          title: '2. DividerGap',
          description: 'Gap with divider line',
          code: '''Row(
  children: [
    Text('Left'),
    DividerGap(24),
    Text('Right'),
  ],
)''',
          child: Row(
            children: [
              Expanded(child: Text('Section 1')),
              DividerGap(24, thickness: 2, color: Colors.grey),
              Expanded(child: Text('Section 2')),
            ],
          ),
        ),
        Gaps.lg,
        const _ExampleCard(
          title: '3. FlexGap - Spacer',
          description: 'Takes remaining space',
          code: '''Row(
  children: [
    Text('Start'),
    FlexGap(),
    Text('End'),
  ],
)''',
          child: Row(
            children: [
              _ColorBox('Start', Colors.green),
              FlexGap(),
              _ColorBox('End', Colors.orange),
            ],
          ),
        ),
        Gaps.lg,
        const _ExampleCard(
          title: '4. SmartSpacer',
          description: 'Flexible with minimum size',
          code: '''Row(
  children: [
    Text('Left'),
    SmartSpacer(minSize: 16),
    Text('Right'),
  ],
)''',
          child: Row(
            children: [
              _ColorBox('Left', Colors.blue),
              SmartSpacer(minSize: 16),
              _ColorBox('Right', Colors.purple),
            ],
          ),
        ),
        Gaps.lg,
        _ExampleCard(
          title: '5. ListView (Horizontal)',
          description: 'Auto-detects scroll direction',
          code: '''ListView(
  scrollDirection: Axis.horizontal,
  children: [
    Card(),
    Gap(16),  // Auto horizontal
    Card(),
  ],
)''',
          child: SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListCard('Item 1', Colors.blue),
                const Gap(16),
                _buildListCard('Item 2', Colors.green),
                const Gap(16),
                _buildListCard('Item 3', Colors.orange),
                const Gap(16),
                _buildListCard('Item 4', Colors.purple),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListCard(String label, Color color) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// REAL WORLD EXAMPLES
// ============================================================================

class RealWorldExamplesPage extends StatelessWidget {
  const RealWorldExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ExampleCard(
          title: '1. User Profile Card',
          description: 'A complete profile card with smart gaps',
          code: 'See implementation below',
          child: _buildUserCard(),
        ),
        Gaps.lg,
        _ExampleCard(
          title: '2. Product Card',
          description: 'E-commerce product card',
          code: 'See implementation below',
          child: _buildProductCard(),
        ),
        Gaps.lg,
        _ExampleCard(
          title: '3. Message Bubble',
          description: 'Chat message with smart spacing',
          code: 'See implementation below',
          child: Column(
            children: [
              _buildMessageBubble('Hello! How are you?', true),
              const Gap(8),
              _buildMessageBubble('I\'m doing great, thanks!', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: Text(
                  'JD',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              FlexGap(),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          Gaps.md,
          const Text(
            'Flutter developer passionate about creating beautiful and functional mobile applications.',
            style: TextStyle(fontSize: 14),
          ),
          Gaps.md,
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add, size: 18),
                  label: const Text('Follow'),
                ),
              ),
              const Gap(12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message, size: 18),
                  label: const Text('Message'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Container(
              height: 150,
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.image, size: 64, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wireless Headphones',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(4),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Gap(4),
                    Text('4.5'),
                    Gap(8),
                    Text(
                      '(234 reviews)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Gaps.sm,
                const Text(
                  'Premium wireless headphones with active noise cancellation.',
                  style: TextStyle(color: Colors.grey),
                ),
                Gaps.md,
                Row(
                  children: [
                    const Text(
                      '\$199',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const FlexGap(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart, size: 18),
                      label: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
              ),
            ),
            const Gap(4),
            Text(
              '10:30 AM',
              style: TextStyle(
                fontSize: 11,
                color: isMe ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// HELPER WIDGETS
// ============================================================================

class _ExampleCard extends StatelessWidget {
  final String title;
  final String description;
  final String code;
  final Widget child;

  const _ExampleCard({
    required this.title,
    required this.description,
    required this.code,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(4),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            Gaps.md,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: child,
            ),
            Gaps.sm,
            ExpansionTile(
              title: const Text('View Code'),
              tilePadding: EdgeInsets.zero,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    code,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.greenAccent,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorBox(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}