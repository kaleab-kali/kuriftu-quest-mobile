import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../models/sub_challenge_model.dart';
import '../providers/sub_challenges_provider.dart';

class SubChallengesScreen extends StatefulWidget {
  final String challengeId;

  const SubChallengesScreen({
    super.key,
    required this.challengeId,
  });

  @override
  State<SubChallengesScreen> createState() => _SubChallengesScreenState();
}

class _SubChallengesScreenState extends State<SubChallengesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SubChallengesProvider>(context, listen: false)
          .fetchSubChallenges(widget.challengeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sub-Challenges',
          style: AppTextStyles.headline2.copyWith(
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          Selector<SubChallengesProvider, List<SubChallenge>>(
            selector: (context, provider) => provider.subChallenges,
            builder: (context, subChallenges, child) {
              int totalPoints = 0;
              for (var challenge in subChallenges) {
                if (challenge.status == 'completed') {
                  totalPoints += challenge.points;
                }
              }
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$totalPoints pts',
                          style: AppTextStyles.bodyText2.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Selector<SubChallengesProvider, bool>(
        selector: (context, provider) => provider.isLoading,
        builder: (context, isLoading, child) {
          if (isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 25,
              ),
            );
          }

          return Selector<SubChallengesProvider, List<SubChallenge>>(
            selector: (context, provider) => provider.subChallenges,
            builder: (context, subChallenges, child) {
              if (subChallenges.isEmpty) {
                return Center(
                  child: Text(
                    'No sub-challenges available',
                    style: AppTextStyles.bodyText1.copyWith(
                      color: AppColors.tertiaryColor,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: subChallenges.length,
                itemBuilder: (context, index) {
                  return SubChallengeCard(subChallenge: subChallenges[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class SubChallengeCard extends StatelessWidget {
  final SubChallenge subChallenge;

  const SubChallengeCard({
    super.key,
    required this.subChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
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
                    color: AppColors.secondary.withOpacity(0.2),
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
                        '${subChallenge.points} pts',
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: subChallenge.status == 'completed'
                        ? Colors.green.withOpacity(0.2)
                        : AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    subChallenge.status,
                    style: AppTextStyles.bodyText2.copyWith(
                      color: subChallenge.status == 'completed'
                          ? Colors.green
                          : AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              subChallenge.title,
              style: AppTextStyles.headline3.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subChallenge.description,
              style: AppTextStyles.bodyText1.copyWith(
                color: AppColors.tertiaryColor,
              ),
            ),
        ],
        ),
      ),
    );
  }
}
