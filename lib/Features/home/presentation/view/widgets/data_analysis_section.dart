import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repo/status_home_repo_impl.dart';
import '../../cubit/status_home_cubit.dart';
import '../../cubit/status_home_stats.dart';
import 'home_item_bulider.dart';

class DataAnalysisSection extends StatefulWidget {
  const DataAnalysisSection({super.key, required this.isDark});

  final bool isDark;

  @override
  State<DataAnalysisSection> createState() => _DataAnalysisSectionState();
}

class _DataAnalysisSectionState extends State<DataAnalysisSection> {
  @override
  void initState() {
    context.read<DashboardStatsCubit>().fetchDashboardStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardStatsCubit, DashboardStatsState>(
      builder: (context, state) {
        if (state is DashboardStatsLoading || state is DashboardStatsInitial) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.60,
            child: CustomLoading(),
          );
        }
        if (state is DashboardStatsFailure) {
          return Center(child: Text(S.of(context).errorOccurred(state.error)));
        }
        if (state is DashboardStatsSuccess) {
          final stats = state.stats;
          final int emptyUnits =
              stats["totalUnits"] - stats["soldUnits"] - stats["rentedUnits"];
          return Column(
            children: [
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                children: [
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome1,
                    title: "${stats["totalUnits"]}",
                    subTitle: S.of(context).totalUnits,
                  ),
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome2,
                    title: "${stats["soldUnits"]}",
                    subTitle: S.of(context).soldUnits,
                  ),
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome3,
                    title: "${stats["rentedUnits"]}",
                    subTitle: S.of(context).rentedUnits1,
                  ),
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome4,
                    title: "$emptyUnits",
                    subTitle: S.of(context).emptyUnits,
                  ),
                ],
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                children: [
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome5,
                    title: "${stats["totalUsers"]}",
                    subTitle: S.of(context).allUsers,
                  ),
                  HomeItemBulider(
                    isDark: widget.isDark,
                    image: Assets.imagesHome7,
                    title: "${stats["blockedUsers"]}",
                    subTitle: S.of(context).blockedUsers,
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}