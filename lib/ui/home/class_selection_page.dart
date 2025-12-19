import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../camera/camera_detection_page.dart';

class ClassSelectionPage extends StatelessWidget {
  const ClassSelectionPage({super.key});

  // Map class names to image filenames
  String _getImagePath(String className) {
    final Map<String, String> imageMap = {
      'Durian': 'Durian',
      'Pineapple': 'Pineapple',
      'Rambutan': 'Rambotan', // Note the different spelling
      'Horned Melon': 'HornedMelon',
      'Jackfruit': 'Langka',   // Using Langka.jpg for Jackfruit
      'Chayote': 'Chayote',
      'Dragon Fruit': 'DragonFruit',
      'Rabana': 'Rabana',
      'Snake Fruit': 'SnakeFruit',
      'Horse Chestnut': 'HorseChestnut',
    };
    
    final imageName = imageMap[className] ?? 'default_fruit';
    return 'assets/images/$imageName.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final classes = AppColors.classNames;
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.grey[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    color: AppColors.primaryBlue,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fruit Identifier',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Select a fruit to identify',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLargeScreen ? 3 : 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9, // Slightly wider than tall
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final name = classes[index];
                final color = AppColors.classColors[index % AppColors.classColors.length];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CameraDetectionPage(
                          selectedClassIndex: index,
                          selectedClassName: name,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                          spreadRadius: 1,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Fruit Image with shadow
                        Container(
                          height: 80,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: color.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: Image.asset(
                                _getImagePath(name),
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  debugPrint('Error loading image for $name: $error');
                                  return Icon(
                                    Icons.emoji_nature_rounded,
                                    size: 40,
                                    color: color,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        
                        // Fruit Name with flexible constraints
                        Expanded(
                          child: Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                              letterSpacing: 0.2,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        // Subtitle
                        const SizedBox(height: 2),
                        const Text(
                          'Tap to identify',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
