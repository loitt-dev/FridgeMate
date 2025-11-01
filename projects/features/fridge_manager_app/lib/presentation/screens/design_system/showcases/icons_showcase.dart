import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import '../widgets/component_showcase_card.dart';

/// Icons & Graphics Showcase
///
/// Showcase of all icon and graphic components in the design system.
class IconsShowcase extends StatefulWidget {
  const IconsShowcase({super.key});

  @override
  State<IconsShowcase> createState() => _IconsShowcaseState();
}

class _IconsShowcaseState extends State<IconsShowcase> {
  AppIconSize _iconSize = AppIconSize.medium;
  Color _iconColor = Colors.black;

  final List<Color> _colorOptions = [
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppIcon Examples
        ComponentShowcaseCard(
          title: 'AppIcon',
          description: 'Custom icon component with consistent styling',
          example: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIcon(icon: Icons.home, size: _iconSize, color: _iconColor),
                  AppIcon(
                    icon: Icons.favorite,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                  AppIcon(
                    icon: Icons.settings,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                  AppIcon(
                    icon: Icons.notifications,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppIcon(icon: Icons.add, size: _iconSize, color: _iconColor),
                  AppIcon(icon: Icons.edit, size: _iconSize, color: _iconColor),
                  AppIcon(
                    icon: Icons.delete,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                  AppIcon(
                    icon: Icons.share,
                    size: _iconSize,
                    color: _iconColor,
                  ),
                ],
              ),
            ],
          ),
          codeSnippet: '''AppIcon(
  icon: Icons.home,
  size: AppIconSize.medium,
  color: Colors.black,
)

AppIcon(
  icon: Icons.favorite,
  size: AppIconSize.medium,
  color: Colors.red,
)

AppIcon(
  icon: Icons.settings,
  size: AppIconSize.medium,
  color: Colors.blue,
)''',
          controls: [
            Text('Size: $_iconSize'),
            DropdownButton<AppIconSize>(
              value: _iconSize,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _iconSize = value;
                  });
                }
              },
              items: AppIconSize.values.map((size) {
                return DropdownMenuItem(value: size, child: Text(size.name));
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text('Color:'),
            Wrap(
              spacing: 8,
              children: _colorOptions.map((color) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _iconColor = color;
                    });
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: _iconColor == color
                          ? Border.all(color: Colors.black, width: 2)
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Material Icons Examples
        ComponentShowcaseCard(
          title: 'Material Icons',
          description: 'Standard Material Design icons with different styles',
          example: Column(
            children: [
              // Filled icons
              Text(
                'Filled Icons:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: const [
                  Icon(Icons.home, color: Colors.blue),
                  Icon(Icons.favorite, color: Colors.red),
                  Icon(Icons.star, color: Colors.orange),
                  Icon(Icons.bookmark, color: Colors.green),
                  Icon(Icons.settings, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 16),
              // Outlined icons
              Text(
                'Outlined Icons:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: const [
                  Icon(Icons.home_outlined, color: Colors.blue),
                  Icon(Icons.favorite_outline, color: Colors.red),
                  Icon(Icons.star_outline, color: Colors.orange),
                  Icon(Icons.bookmark_outline, color: Colors.green),
                  Icon(Icons.settings_outlined, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 16),
              // Rounded icons
              Text(
                'Rounded Icons:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: const [
                  Icon(Icons.home_rounded, color: Colors.blue),
                  Icon(Icons.favorite_rounded, color: Colors.red),
                  Icon(Icons.star_rounded, color: Colors.orange),
                  Icon(Icons.bookmark_rounded, color: Colors.green),
                  Icon(Icons.settings_rounded, color: Colors.grey),
                ],
              ),
            ],
          ),
          codeSnippet: '''Icon(Icons.home, color: Colors.blue)
Icon(Icons.favorite, color: Colors.red)
Icon(Icons.star, color: Colors.orange)

Icon(Icons.home_outlined, color: Colors.blue)
Icon(Icons.favorite_outline, color: Colors.red)
Icon(Icons.star_outline, color: Colors.orange)

Icon(Icons.home_rounded, color: Colors.blue)
Icon(Icons.favorite_rounded, color: Colors.red)
Icon(Icons.star_rounded, color: Colors.orange)''',
        ),

        const SizedBox(height: 24),

        // Icon Sizes Examples
        ComponentShowcaseCard(
          title: 'Icon Sizes',
          description: 'Icons with different sizes for various use cases',
          example: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  Icon(Icons.star, size: 20, color: Colors.orange),
                  Icon(Icons.star, size: 24, color: Colors.orange),
                  Icon(Icons.star, size: 32, color: Colors.orange),
                  Icon(Icons.star, size: 40, color: Colors.orange),
                  Icon(Icons.star, size: 48, color: Colors.orange),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('16px', style: TextStyle(fontSize: 12)),
                  Text('20px', style: TextStyle(fontSize: 12)),
                  Text('24px', style: TextStyle(fontSize: 12)),
                  Text('32px', style: TextStyle(fontSize: 12)),
                  Text('40px', style: TextStyle(fontSize: 12)),
                  Text('48px', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          codeSnippet: '''Icon(Icons.star, size: 16, color: Colors.orange)
Icon(Icons.star, size: 20, color: Colors.orange)
Icon(Icons.star, size: 24, color: Colors.orange)
Icon(Icons.star, size: 32, color: Colors.orange)
Icon(Icons.star, size: 40, color: Colors.orange)
Icon(Icons.star, size: 48, color: Colors.orange)''',
        ),

        const SizedBox(height: 24),

        // Icon with Background Examples
        ComponentShowcaseCard(
          title: 'Icons with Background',
          description: 'Icons with different background styles and shapes',
          example: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              // Circle background
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home, color: Colors.white),
              ),
              // Rounded rectangle background
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.favorite, color: Colors.white),
              ),
              // Square background
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(color: Colors.red),
                child: const Icon(Icons.star, color: Colors.white),
              ),
              // Gradient background
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.settings, color: Colors.white),
              ),
              // Outlined background
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.orange, width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.bookmark, color: Colors.orange),
              ),
            ],
          ),
          codeSnippet: '''Container(
  width: 48,
  height: 48,
  decoration: BoxDecoration(
    color: Colors.blue,
    shape: BoxShape.circle,
  ),
  child: Icon(Icons.home, color: Colors.white),
)

Container(
  width: 48,
  height: 48,
  decoration: BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Icon(Icons.favorite, color: Colors.white),
)

Container(
  width: 48,
  height: 48,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.purple, Colors.pink],
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Icon(Icons.settings, color: Colors.white),
)''',
        ),
      ],
    );
  }
}
