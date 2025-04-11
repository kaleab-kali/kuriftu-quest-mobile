import 'package:flutter/material.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rewards',
          style: AppTextStyles.headline2,
        ),
        backgroundColor: AppColors.primary.withOpacity(0.1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AI Suggestions Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, color: AppColors.secondary),
                        const SizedBox(width: 8),
                        Text(
                          'AI Suggestions',
                          style: AppTextStyles.headline2.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Frequent spa-goer? Redeem 300 pts for a free massage!',
                      style: AppTextStyles.bodyText1.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Filter Section
              Text(
                'Filter by Category',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All'),
                    _buildFilterChip('Dining'),
                    _buildFilterChip('Spa'),
                    _buildFilterChip('Adventures'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Rewards Grid
              Text(
                'Available Rewards',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildRewardCard(
                    title: 'Free Cocktail',
                    points: 100,
                    category: 'Dining',
                  ),
                  _buildRewardCard(
                    title: 'Spa Discount',
                    points: 200,
                    category: 'Spa',
                  ),
                  _buildRewardCard(
                    title: 'VIP Tour',
                    points: 300,
                    category: 'Adventures',
                  ),
                  _buildRewardCard(
                    title: 'Private Dinner',
                    points: 500,
                    category: 'Dining',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: label == 'All',
        onSelected: (bool selected) {
          // Handle filter selection
        },
        backgroundColor: AppColors.onPrimary,
        selectedColor: AppColors.secondary,
        labelStyle: TextStyle(
          color: label == 'All' ? AppColors.onPrimary : AppColors.onSecondary,
        ),
      ),
    );
  }

  Widget _buildRewardCard({
    required String title,
    required int points,
    required String category,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Handle reward selection
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  category,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.onPrimary,
                    fontSize: 12,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.secondary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$points pts',
                    style: AppTextStyles.bodyText1.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
