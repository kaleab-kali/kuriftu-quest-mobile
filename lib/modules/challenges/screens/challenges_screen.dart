import 'package:flutter/material.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Challenges',
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
              // Categories Section
              Text(
                'Categories',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryChip('Dining'),
                  _buildCategoryChip('Spa'),
                  _buildCategoryChip('Adventure'),
                  _buildCategoryChip('Bookings'),
                ],
              ),
              const SizedBox(height: 24),

              // Challenge Cards Section
              Text(
                'Available Challenges',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              _buildChallengeCard(
                title: 'Dine at the Lakeside Restaurant',
                points: 50,
                description: 'Try the chef\'s special and post a photo!',
                status: 'Scan QR at table to start',
              ),
              const SizedBox(height: 16),
              _buildChallengeCard(
                title: 'Book Directly',
                points: 200,
                description: 'Earn 2x points on your next stay!',
                status: 'Book through the app',
              ),

              // Direct Booking Incentive Banner
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.onPrimary),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Book directly → Earn 2x points!',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodyText1.copyWith(
          color: AppColors.onPrimary,
        ),
      ),
    );
  }

  Widget _buildChallengeCard({
    required String title,
    required int points,
    required String description,
    required String status,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.headline3.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$points pts',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.tertiaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.qr_code_scanner, size: 16),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: AppTextStyles.bodyText1.copyWith(
                    color: AppColors.tertiaryColor,
                    fontSize: 14,
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
