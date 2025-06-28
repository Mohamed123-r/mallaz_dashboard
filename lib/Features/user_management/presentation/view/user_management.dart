import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/presentation/view/requests_to_add_new_properties.dart';

class UserManagementView extends StatefulWidget {
  const UserManagementView({super.key});

  @override
  State<UserManagementView> createState() => _UserManagementViewState();
}

class _UserManagementViewState extends State<UserManagementView> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).newUsersCount,
                style: AppTextStyles.buttonLarge20pxRegular(context),
              ),
              const SizedBox(width: 8),
              Text("555", style: AppTextStyles.buttonLarge20pxRegular(context)),
            ],
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.graysGray2,
            ),
            columnWidths: const {
              0: FlexColumnWidth(2.1),
              1: FlexColumnWidth(2.1),
              2: FlexColumnWidth(2.1),
              3: FlexColumnWidth(2.1),
              4: FlexColumnWidth(2.1),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.transparent),
                children: [
                  HeaderCall(text: S.of(context).userName, context: context),
                  HeaderCall(text: S.of(context).mobileNumber, context: context),
                  HeaderCall(text: S.of(context).email, context: context),
                  HeaderCall(text: S.of(context).accountStatus, context: context),
                  HeaderCall(text: S.of(context).actions, context: context),
                ],
              ),
              ...List.generate(5, (index) {
                isActive = index == 2 || index == 3;
                return TableRow(
                  children: [
                    DataCell(text: 'هناء محمد', context: context),
                    DataCell(text: '+201111111111', context: context),
                    DataCell(text: 'hana@gmail.com', context: context),
                    DataCell(
                      text: isActive ? S.of(context).active : S.of(context).inactive,
                      context: context,
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: MaterialButton(
                            height: 40,
                            minWidth: 180,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              isActive ? S.of(context).unblock : S.of(context).blockUser,
                              style: AppTextStyles.buttonLarge20pxRegular(
                                context,
                              ).copyWith(color: AppColors.black),
                            ),
                            color: isActive ? AppColors.green : AppColors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class DataCell extends StatelessWidget {
  const DataCell({super.key, required this.text, required this.context});

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.text14pxRegular(context)),
      ),
    ),
  );
}

class HeaderCall extends StatelessWidget {
  const HeaderCall({super.key, required this.text, required this.context});

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.buttonLarge20pxRegular(context)),
      ),
    ),
  );
}