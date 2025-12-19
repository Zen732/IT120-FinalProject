import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../app_theme.dart';
import 'class_selection_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> fruits = const [
    {
      'name': 'Durian',
      'image': 'assets/images/Durian.jpg',
      'description': 'King of fruits with strong odor and rich, custard-like flesh',
    },
    {
      'name': 'Pineapple',
      'image': 'assets/images/Pineapple.jpg',
      'description': 'Sweet, slightly tart with fibrous yellow flesh',
    },
    {
      'name': 'Rambotan',
      'image': 'assets/images/Rambotan.jpg',
      'description': 'Hairy red/yellow skin with juicy white flesh',
    },
    {
      'name': 'Horned Melon',
      'image': 'assets/images/HornedMelon.jpg',
      'description': 'Spiky orange skin with lime green jelly-like flesh',
    },
    {
      'name': 'Jackfruit',
      'image': 'assets/images/Langka.jpg',
      'description': 'Large fruit with sweet yellow pods',
    },
    {
      'name': 'Chayote',
      'image': 'assets/images/Chayote.jpg',
      'description': 'Light green, wrinkled fruit with mild flavor',
    },
    {
      'name': 'Dragon Fruit',
      'image': 'assets/images/DragonFruit.jpg',
      'description': 'Vibrant pink skin with white/red flesh and black seeds',
    },
    {
      'name': 'Rabana',
      'image': 'assets/images/Rabana.jpg',
      'description': 'Common tropical fruit with soft, sweet flesh',
    },
    {
      'name': 'Snake Fruit',
      'image': 'assets/images/SnakeFruit.jpg',
      'description': 'Scaly brown skin with sweet and sour segments',
    },
    {
      'name': 'Horse Chestnut',
      'image': 'assets/images/HorseChestnut.jpg',
      'description': 'Shiny brown nut in a spiky green casing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[900] : Colors.grey[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Discover Fruits',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                final fruit = fruits[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            fruit['image']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[200],
                              child: const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fruit['name']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              fruit['description']!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
