import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/property_action_cubit.dart';
import '../../cubit/property_action_state.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({
    super.key,
    required this.propertyId,
    required this.onTapBack,
    required this.onTapEditDetails,
  });

  final int propertyId;
  final VoidCallback onTapBack;
  final void Function(int id) onTapEditDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BlocConsumer<PropertyActionsCubit, PropertyActionsState>(
        listener: (context, state) {
          if (state is PropertyActionSuccess) {
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  S.of(context).success
                ),
                backgroundColor: Colors.green,
              ),
            );
            // Optionally, you can navigate back or reset the state
            context.read<PropertyActionsCubit>().reset();
            onTapBack();
          } else if (state is PropertyActionFailure) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${ S.of(context).error} ${state.error}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<PropertyActionsCubit>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 40,
                minWidth: 200,
                onPressed:
                    state is PropertyActionsLoading
                        ? null
                        : () => cubit.acceptProperty(propertyId),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColors.green,
                child: Text(
                  S.of(context).accept,
                  style: AppTextStyles.buttonLarge20pxRegular(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
              ),
              const SizedBox(width: 20),
              MaterialButton(
                height: 40,
                minWidth: 200,
                onPressed: () {
                  onTapEditDetails(propertyId);
                },

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColors.darkModeAccent,
                child: Text(
                  S.of(context).edit,
                  style: AppTextStyles.buttonLarge20pxRegular(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
              ),
              const SizedBox(width: 20),

              MaterialButton(
                height: 40,
                minWidth: 200,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(S.of(context).confirmDelete),
                        content: Text(S.of(context).confirmDeleteMessage),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.deleteProperty(propertyId);
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).reject),
                          ),
                        ],
                      );
                    },
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColors.red,
                child: Text(
                  S.of(context).reject,
                  style: AppTextStyles.buttonLarge20pxRegular(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
