import 'package:logger/logger.dart';
import 'core/database/cache/cache_helper.dart';


//const isOnboardingViewSeen = 'isOnboardingViewSeen';
const isSuccessLogin = 'isSuccessLogin';
const userData = 'userData';
var logger = Logger(printer: PrettyPrinter(), level: Level.debug);

// const SizedBox(height: 16),
// _sectionTitle(context, isDark, S.of(context).contactData),
// const SizedBox(height: 8),
// _contactRow(context, isDark),
// Widget _contactRow(BuildContext context, bool isDark) {
// return Row(
// children: [
// _contactCard(context, isDark, S.of(context).ownerName, '010101010100'),
// const SizedBox(width: 16),
// _contactCard(context, isDark, S.of(context).clientName, '010101010100'),
// Expanded(child: _noteCard(context, isDark)),
// ],
// );
// }
//
// Widget _contactCard(
// BuildContext context,
// bool isDark,
// String name,
// String phone,
// ) {
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// side: BorderSide(width: 1, color: AppColors.graysGray4),
// ),
// color:
// isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
// child: Column(
// children: [
// CircleAvatar(
// radius: 35,
// backgroundColor:
// isDark
// ? AppColors.darkModeButtonsPrimary
//     : AppColors.lightModeButtonsPrimary,
// ),
// const SizedBox(height: 4),
// Text(name, style: AppTextStyles.text14pxRegular(context)),
// const SizedBox(height: 4),
// Text(phone, style: AppTextStyles.text14pxRegular(context)),
// ],
// ),
// ),
// );
// }
//
// Widget _noteCard(BuildContext context, bool isDark) {
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// side: BorderSide(width: 1, color: AppColors.graysGray4),
// ),
// color:
// isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
// child: Column(
// children: [
// Row(
// children: [
// SizedBox(
// width: 150,
// child: DropdownButton(
// value: S.of(context).mohamed,
// items:
// [S.of(context).mohamed, S.of(context).ahmed].map((
// String dropDownStringItem,
// ) {
// return DropdownMenuItem<String>(
// value: dropDownStringItem,
// child: Text(dropDownStringItem),
// );
// }).toList(),
// onChanged: (value) {},
// icon: Icon(
// Icons.arrow_drop_down,
// color:
// isDark
// ? AppColors.darkModeText
//     : AppColors.lightModeText,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: Container(
// width: 1,
// height: 40,
// color: AppColors.graysGray4,
// ),
// ),
// SizedBox(
// width: 360,
// child: TextFormField(
// decoration: InputDecoration(
// hintText: S.of(context).addNoteHere,
// hintStyle: AppTextStyles.text14pxRegular(
// context,
// ).copyWith(
// color:
// isDark
// ? AppColors.darkModeGrayText
//     : AppColors.lightModeGrayText,
// ),
// border: InputBorder.none,
// ),
// style: AppTextStyles.text14pxRegular(context),
// ),
// ),
// ],
// ),
// MaterialButton(
// height: 50,
// minWidth: 200,
// onPressed: () {},
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// child: Text(
// S.of(context).save,
// style: AppTextStyles.buttonLarge20pxRegular(
// context,
// ).copyWith(color: AppColors.black),
// ),
// color: AppColors.graysGray3,
// ),
// ],
// ),
// ),
// );
// }