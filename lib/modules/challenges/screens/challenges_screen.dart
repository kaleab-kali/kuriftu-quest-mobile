import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';
import '../providers/challenges_provider.dart';
import '../models/challenge_model.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChallengesProvider>(context, listen: false).fetchChallenges();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Challenges',
          style: AppTextStyles.headline2.copyWith(
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: Selector<ChallengesProvider, bool>(
        selector: (context, provider) => provider.isLoading,
        builder: (context, isLoading, child) {
          if (isLoading) {
            return const Center(
                child: CupertinoActivityIndicator(
              radius: 25,
            ));
          }
          return Column(
            children: [
              _buildCategoryFilter(),
              Expanded(child: _buildChallengesList()),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Selector<ChallengesProvider, List<String>>(
      selector: (context, provider) => provider.categories,
      builder: (context, categories, child) {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildAllCategoryChip();
              }
              return _buildCategoryChip(categories[index - 1]);
            },
          ),
        );
      },
    );
  }

  Widget _buildAllCategoryChip() {
    return Selector<ChallengesProvider, String?>(
      selector: (context, provider) => provider.selectedCategory,
      builder: (context, selectedCategory, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FilterChip(
            label: const Text('All'),
            selected: selectedCategory == null,
            onSelected: (selected) {
              Provider.of<ChallengesProvider>(context, listen: false)
                  .setSelectedCategory(null);
            },
            backgroundColor: AppColors.primary.withOpacity(0.1),
            selectedColor: AppColors.primary,
            labelStyle: TextStyle(
              color: selectedCategory == null
                  ? AppColors.onPrimary
                  : AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryChip(String category) {
    return Selector<ChallengesProvider, String?>(
      selector: (context, provider) => provider.selectedCategory,
      builder: (context, selectedCategory, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FilterChip(
            label: Text(category),
            selected: selectedCategory == category,
            onSelected: (selected) {
              Provider.of<ChallengesProvider>(context, listen: false)
                  .setSelectedCategory(category);
            },
            backgroundColor: AppColors.primary.withOpacity(0.1),
            selectedColor: AppColors.primary,
            labelStyle: TextStyle(
              color: selectedCategory == category
                  ? AppColors.onPrimary
                  : AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildChallengesList() {
    return Selector<ChallengesProvider, List<Challenge>>(
      selector: (context, provider) => provider.filteredChallenges,
      builder: (context, challenges, child) {
        if (challenges.isEmpty) {
          return Center(
            child: Text(
              'No challenges available',
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.tertiaryColor,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: challenges.length,
          itemBuilder: (context, index) {
            return ChallengeCard(challenge: challenges[index]);
          },
        );
      },
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Background image with reduced opacity
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Image.network(
                  // challenge.imageUrl
                  "https://kurifturesorts.com/_nuxt/img/Tana.303f00c.webp",
                  height: 200, // Increased height to accommodate all content
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: AppColors.primary.withOpacity(0.1),
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
                // Overlay to reduce opacity
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        challenge.category,
                        style: AppTextStyles.bodyText2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: AppColors.secondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${challenge.points} pts',
                            style: AppTextStyles.bodyText2.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  challenge.title,
                  style: AppTextStyles.headline3.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  challenge.description,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    context.push("/subChallengs/${challenge.id}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Participate'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
