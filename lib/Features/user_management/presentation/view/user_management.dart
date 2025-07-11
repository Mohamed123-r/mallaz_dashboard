import 'package:book_apartment_dashboard/Features/user_management/presentation/view/widgets/build_count_header.dart';
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
import '../cubit/user_search_cubit.dart';

class UserManagementView extends StatefulWidget {
  const UserManagementView({super.key, required this.onPressedBack});

  final VoidCallback onPressedBack;

  @override
  State<UserManagementView> createState() => _UserManagementViewState();
}

class _UserManagementViewState extends State<UserManagementView> {
  int currentPage = 1;
  final int rowsPerPage = 7;

  // لحفظ آخر داتا ناجحة (لضمان الجدول لا يختفي أثناء عمليات البلوك/أنلوك)
  List<dynamic> _lastUsers = [];
  num _lastTotalCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchPage(currentPage);
  }

  void _fetchPage(int page) {
    if (!mounted) return;
    context.read<UserCubit>().fetchUsers(page: page);
  }

  void _onPageChanged(int page) {
    if (!mounted) return;
    setState(() => currentPage = page);
    _fetchPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserBlockOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          _fetchPage(currentPage); // تحديث الداتا بعد العملية
        }
        if (state is UserBlockOperationError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildCountHeader(),
            const SizedBox(height: 16),
            Expanded(child: buildTableWithPagination()),
          ],
        ),
      ),
    );
  }

  Widget buildTableWithPagination() {
    return BlocBuilder<UserSearchCubit, UserSearchState>(
      builder: (context, searchState) {
        return BlocBuilder<UserCubit, UserState>(
          buildWhen: (previous, current) =>
          current is UserSuccess ||
              current is UserLoading ||
              current is UserFailure ||
              current is UserBlockOperationInProgress,
          builder: (context, state) {
            String? blockingUserId;
            bool? isBlocking;

            if (state is UserBlockOperationInProgress) {
              blockingUserId = state.userId;
              isBlocking = state.isLock;
              state = context.read<UserCubit>().state; // نحتفظ بآخر حالة داتا ناجحة
            }

            if (state is UserLoading) return CustomLoading(); // حالة التحميل مكان الجدول
            if (state is UserFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyles.text14pxRegular(context).copyWith(color: Colors.red),
                ),
              );
            }
            if (state is UserSuccess) {
              _lastUsers = state.users.data ?? [];
              _lastTotalCount = state.users.totalCount ?? 0;
            }

            // استخدام بيانات البحث إذا كانت موجودة وغير فارغة، وإلا استخدم البيانات الأساسية
            List<dynamic> users = _lastUsers;
            num totalCount = _lastTotalCount;
            if (searchState is UserSearchSuccess) {
              if (searchState.userSearchModel.data != null && searchState.userSearchModel.data!.isNotEmpty) {
                users = searchState.userSearchModel.data!;
                totalCount = searchState.userSearchModel.data!.length ?? users.length;
              } else {
                return Center(
                  child: Text('البيانات غير موجودة', style: TextStyle(fontSize: 16)),
                ); // إظهار رسالة عندما لا تكون هناك نتائج بحث
              }
            }

            if (users.isEmpty && searchState is! UserSearchSuccess) {
              return Center(
                child: Text('لا يوجد بيانات', style: TextStyle(fontSize: 16)),
              ); // عرض "لا يوجد بيانات" للبيانات الأساسية إذا كانت فارغة
            }

            if (searchState is UserSearchLoading) {
              return Center(child: CustomLoading()); // عرض مؤشر التحميل أثناء البحث
            }

            final int pageCount = (totalCount / rowsPerPage).ceil();

            return Column(
              children: [
                Expanded(child: _buildUserTable(users, blockingUserId)),
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
      },
    );
  }

  Widget _buildUserTable(List users, String? blockingUserId) {
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
          ...users.map<TableRow>((user) => _buildUserRow(user, blockingUserId)),
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

  TableRow _buildUserRow(dynamic user, String? blockingUserId) {
    // التعامل مع isBlocked بشكل آمن
    final isBlocked = user is Map<String, dynamic> ? user['isBlocked'] ?? false : (user.isBlocked ?? false);
    final isActive = !isBlocked;
    final userId = user.id ?? (user is Map<String, dynamic> ? user['id'] ?? '' : '');
    final showLoading = blockingUserId == userId;

    return TableRow(
      children: [
        CustomDataCell(text: user.userName ?? (user is Map<String, dynamic> ? user['userName'] ?? '' : ''), context: context),
        CustomDataCell(text: user.phoneNumber ?? (user is Map<String, dynamic> ? user['phoneNumber'] ?? '-' : '-'), context: context),
        CustomDataCell(text: user.email ?? (user is Map<String, dynamic> ? user['email'] ?? '' : ''), context: context),
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
                onPressed: showLoading
                    ? null
                    : () {
                  final userCubit = context.read<UserCubit>();
                  if (isActive) {
                    userCubit.lockUser(userId); // يعمل لجميع الحالات
                  } else {
                    userCubit.unlockUser(userId); // يعمل لجميع الحالات
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: isActive ? AppColors.red : AppColors.green, // يتغير في جميع الحالات
                child: showLoading
                    ? const SizedBox(width: 24, height: 24, child: CustomLoading())
                    : Text(
                  isActive ? S.of(context).blockUser : S.of(context).unblock,
                  style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(color: AppColors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}