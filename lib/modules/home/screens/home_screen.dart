import 'package:flutter/material.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';
import 'package:kuriftuquest/modules/auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
       final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    print(user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary.withOpacity(0.1),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.notifications_rounded,
            color: AppColors.secondary,
          ),
        ),
        title: const Text(
          'Home',
          style: AppTextStyles.headline2,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '200',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        leadingWidth: 56,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person, color: AppColors.secondary, size: 32),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "wellcome back ${user?.email}",
                          style: AppTextStyles.bodyText2.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: AppColors.secondary, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              "${user?.points} Pts",
                              style: AppTextStyles.bodyText1.copyWith(
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Membership Tier Card
              // Container(
              //   padding: const EdgeInsets.all(16),
              //   decoration: BoxDecoration(
              //     color: AppColors.onPrimary,
              //     borderRadius: BorderRadius.circular(12),
              //     border: Border.all(color: AppColors.secondary),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Gold Tier',
              //         style: AppTextStyles.headline2.copyWith(
              //           color: AppColors.primary,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       LinearProgressIndicator(
              //         value: 0.8, // 400/500 points
              //         backgroundColor: AppColors.onSurfaceLight(context),
              //         valueColor:
              //             AlwaysStoppedAnimation<Color>(AppColors.secondary),
              //       ),
              //       const SizedBox(height: 8),
              //       Text(
              //         '400/500 Pts',
              //         style: AppTextStyles.bodyText1.copyWith(
              //           color: AppColors.tertiaryColor,
              //         ),
              //       ),
              //       const SizedBox(height: 16),
              //       Text(
              //         'Gold Benefits:',
              //         style: AppTextStyles.headline3.copyWith(
              //           color: AppColors.primary,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       _buildBenefitItem('Free late checkout'),
              //       _buildBenefitItem('Priority bookings'),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 24),

              // AI-Personalized Challenges
              Text(
                'Personalized Challenges',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              _buildPersonalizedChallenge(
                icon: Icons.spa,
                title: 'Since you love spas, earn 100 pts for a massage!',
                points: 100,
              ),
              const SizedBox(height: 16),
              _buildPersonalizedChallenge(
                icon: Icons.hotel,
                title: 'Book your next stay directly → 2x points!',
                points: 200,
              ),
              const SizedBox(height: 24),

              // Trending Experiences
              Text(
                'Trending Experiences',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTrendingCard(
                      title: 'Sunset Boat Tour',
                      points: 200,
                      image: 'assets/images/sunset_boat.jpg',
                    ),
                    const SizedBox(width: 16),
                    _buildTrendingCard(
                      title: 'Private Dinner',
                      points: 500,
                      image: 'assets/images/private_dinner.jpg',
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

  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.secondary,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodyText1.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalizedChallenge({
    required IconData icon,
    required String title,
    required int points,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.onPrimary,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
    );
  }

  Widget _buildTrendingCard({
    required String title,
    required int points,
    required String image,
  }) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bodyText2.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            const SizedBox(height: 4),
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
                    color: AppColors.onPrimary,
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
