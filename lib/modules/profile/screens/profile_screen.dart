import 'package:flutter/material.dart';
import 'package:kuriftuquest/core/constants/colors/colors.dart';
import 'package:kuriftuquest/core/constants/text_styles.dart';
import 'package:kuriftuquest/core/constants/dimentsions.dart';
import 'package:kuriftuquest/core/constants/app_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: AppTextStyles.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstant.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: AppColors.primary,
                ),
                // backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
            ),
            const SizedBox(height: AppDimensions.mediumMargin),

            // User Details
            const Text(
              'jegnaw Abebe',
              style: AppTextStyles.headline1,
            ),
            const SizedBox(height: AppDimensions.smallMargin),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email_outlined, size: 16, color: Colors.black54),
                SizedBox(width: 6),
                Text(
                  'jegnaw@example.com',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_outlined, size: 16, color: Colors.black54),
                SizedBox(width: 6),
                Text(
                  '+251 912 345 678',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppDimensions.largeMargin),

            // Info Cards
            _buildOptionCard(
              icon: Icons.person_outline,
              label: 'Edit Profile',
              onTap: () {},
            ),
            _buildOptionCard(
              icon: Icons.calendar_today_outlined,
              label: 'My Bookings',
              onTap: () {},
            ),
            _buildOptionCard(
              icon: Icons.payment_outlined,
              label: 'Payment Methods',
              onTap: () {},
            ),
            _buildOptionCard(
              icon: Icons.notifications_outlined,
              label: 'Notifications',
              onTap: () {},
            ),
            _buildOptionCard(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onTap: () {},
            ),
            const SizedBox(height: AppDimensions.mediumMargin),

            // Logout Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Add logout logic
                },
                icon: const Icon(Icons.logout, size: 20),
                label: const Text('Logout', style: AppTextStyles.buttonText),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.mediumBorderRadius),
                  ),
                  elevation: 2,
                ),
              ),
            )
            , SizedBox(height: AppDimensions.mediumMargin),
         
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.smallBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
        onTap: onTap,
      ),
    );
  }
}
