import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/user_cubit.dart';
import '../../cubit/user_state.dart';

class BuildCountHeader extends StatelessWidget {
  const BuildCountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen:
          (previous, current) =>
      current is UserSuccess ||
          current is UserLoading ||
          current is UserFailure,
      builder: (context, state) {
        final count =
        (state is UserSuccess && state.users.data != null)
            ? state.users.totalCount ?? 0
            : 0;
        return Row(
          children: [
            Text(
              S.of(context).newUsersCount,
              style: AppTextStyles.buttonLarge20pxRegular(context),
            ),
            const SizedBox(width: 8),
            Text(
              "$count",
              style: AppTextStyles.buttonLarge20pxRegular(context),
            ),
          ],
        );
      },
    );
  }
}
