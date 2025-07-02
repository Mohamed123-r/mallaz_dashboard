import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_header_call.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_pagination.dart';
import '../../../../generated/l10n.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

class UserManagementView extends StatefulWidget {
  const UserManagementView({super.key});

  @override
  State<UserManagementView> createState() => _UserManagementViewState();
}

class _UserManagementViewState extends State<UserManagementView> {
  int currentPage = 1;
  final int rowsPerPage = 7;

  @override
  void initState() {
    super.initState();
    _fetchPage(currentPage);
  }

  void _fetchPage(int page) {
    context.read<UserCubit>().fetchUsers(page: page);
  }

  void _onPageChanged(int page) {
    setState(() => currentPage = page);
    _fetchPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCountHeader(),
          const SizedBox(height: 16),
          Expanded(child: _buildTableWithPagination()),
        ],
      ),
    );
  }

  Widget _buildTableWithPagination() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) return CustomLoading();
        if (state is UserFailure) {
          return Center(
            child: Text(
              state.error,
              style: AppTextStyles.text14pxRegular(
                context,
              ).copyWith(color: Colors.red),
            ),
          );
        }
        if (state is! UserSuccess) return const SizedBox.shrink();

        final users = state.users.data ?? [];
        final totalCount = state.users.totalCount ?? 0;
        final int pageCount = (totalCount / rowsPerPage).ceil();

        return Column(
          children: [
            Expanded(child: _buildUserTable(users)),
            const SizedBox(height: 12),
            CustomPagination(
              currentPage: currentPage,
              pageCount: pageCount,
              onPageChanged: _onPageChanged,
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserTable(List users) {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.graysGray2,
        ),
        columnWidths: const {
          0: FlexColumnWidth(2.1),
          1: FlexColumnWidth(1.7),
          2: FlexColumnWidth(2.1),
          3: FlexColumnWidth(1.3),
          4: FlexColumnWidth(1.9),
        },
        children: [
          _buildHeaderRow(),
          ...users.map<TableRow>((user) => _buildUserRow(user)),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.transparent),
      children: [
        CustomHeaderCall(text: S.of(context).userName, context: context),
        CustomHeaderCall(text: S.of(context).mobileNumber, context: context),
        CustomHeaderCall(text: S.of(context).email, context: context),
        CustomHeaderCall(text: S.of(context).accountStatus, context: context),
        CustomHeaderCall(text: S.of(context).actions, context: context),
      ],
    );
  }

  TableRow _buildUserRow(dynamic user) {
    final isActive = !(user.isBlocked ?? false);
    return TableRow(
      children: [
        CustomDataCell(text: user.userName ?? '', context: context),
        CustomDataCell(text: user.phoneNumber ?? '-', context: context),
        CustomDataCell(text: user.email ?? '', context: context),
        CustomDataCell(
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
                onPressed: () {
                  // TODO: Add block/unblock action
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: isActive ? AppColors.red : AppColors.green,
                child: Text(
                  isActive ? S.of(context).blockUser : S.of(context).unblock,
                  style: AppTextStyles.buttonLarge20pxRegular(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BuildCountHeader extends StatelessWidget {
  const BuildCountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
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

