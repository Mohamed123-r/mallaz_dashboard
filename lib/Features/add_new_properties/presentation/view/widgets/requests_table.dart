import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_data_cell.dart';
import '../../../../../core/widgets/custom_header_call.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/add_new_properties_model.dart';
import '../../cubit/add_new_properties_cubit.dart';
import '../../cubit/add_new_properties_stats.dart';

class RequestsTable extends StatelessWidget {
  const RequestsTable({required this.onTapSeeDetails});

  final void Function(int id) onTapSeeDetails;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyRequestCubit, PropertyRequestState>(
      builder: (context, state) {
        if (state is PropertyRequestLoading) {
          return Expanded(child: CustomLoading());
        }
        if (state is PropertyRequestFailure) {
          return Center(child: Text(state.error));
        }
        final List<PropertyRequestModel> requests =
        state is PropertyRequestSuccess ? state.requests : [];
        return Table(
          border: TableBorder.all(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.graysGray2,
          ),
          columnWidths: const {
            0: FlexColumnWidth(1.2), // id column
            1: FlexColumnWidth(2.1),
            2: FlexColumnWidth(2.1),
            3: FlexColumnWidth(2.1),
            4: FlexColumnWidth(2.1),
            5: FlexColumnWidth(1.7),
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Colors.transparent),
              children: [
                CustomHeaderCall(
                  text: "ID",
                  context: context,
                ),
                CustomHeaderCall(
                  text: S.of(context).propertyType,
                  context: context,
                ),
                CustomHeaderCall(
                    text: S.of(context).governorate, context: context),
                CustomHeaderCall(
                    text: S.of(context).addedDate, context: context),
                CustomHeaderCall(
                    text: S.of(context).ownerName, context: context),
                CustomHeaderCall(
                    text: S.of(context).actions, context: context),
              ],
            ),
            ...requests.map((item) => TableRow(
              children: [
                CustomDataCell(
                  text: item.id.toString(),
                  context: context,
                ),
                CustomDataCell(
                  text: item.propertyType,
                  context: context,
                ),
                CustomDataCell(
                  text: item.governorate,
                  context: context,
                ),
                CustomDataCell(
                  text:
                  "${item.createdAt.day}-${item.createdAt.month}-${item.createdAt.year}",
                  context: context,
                ),
                CustomDataCell(
                  text: item.userFullName,
                  context: context,
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MaterialButton(
                        height: 40,
                        minWidth: 100,
                        onPressed: () => onTapSeeDetails(item.id),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: AppColors.graysGray3,
                        child: Text(
                          S.of(context).showMore,
                          style: AppTextStyles.buttonLarge20pxRegular(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        );
      },
    );
  }
}