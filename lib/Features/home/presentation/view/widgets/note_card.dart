import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/appointment_cubit.dart';
import '../../cubit/edit_note_cubit.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.context,
    required this.isDark,
    required this.note,
    required this.appointmentId,
  });

  final BuildContext context;
  final bool isDark;
  final String? note;
  final int appointmentId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: 1, color: AppColors.graysGray4),
        ),
        color:
            isDark
                ? AppColors.darkModeBackground
                : AppColors.lightModeBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  const Spacer(),
                  SectionTitle(
                    context: context,
                    isDark: isDark,
                    text: S.of(context).notes,
                  ),
                  const Spacer(),
                  BlocListener<EditNoteCubit, EditNoteState>(
                    listener: (context, state) {
                      if (state is EditNoteSuccess) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                        context
                            .read<AppointmentDetailsCubit>()
                            .fetchAppointmentDetails(
                              appointmentId: appointmentId,
                            );
                      } else if (state is EditNoteFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        String? updatedNote = await showDialog<String>(
                          context: context,
                          builder: (_) {
                            final controller = TextEditingController(
                              text: note ?? "",
                            );
                            return AlertDialog(
                              title: Text("تعديل الملاحظة"),
                              content: SizedBox(
                                height: 100,
                                width: 300,
                                child: TextField(
                                  maxLines: 2,
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: "أدخل الملاحظة الجديدة",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: AppColors.graysGray4,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text(S.of(context).cancel),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                ElevatedButton(
                                  child: Text(S.of(context).save),
                                  onPressed:
                                      () => Navigator.pop(
                                        context,
                                        controller.text,
                                      ),
                                ),
                              ],
                            );
                          },
                        );
                        if (updatedNote != null &&
                            updatedNote.trim().isNotEmpty) {
                          context.read<EditNoteCubit>().editNote(
                            appointmentId: appointmentId,
                            note: updatedNote,
                          );
                        }
                      },
                      child: Icon(Icons.edit, size: 20),
                    ),
                  ),
                ],
              ),
              Text(
                note ?? " لا يوجد ملاحظات",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.buttonLarge20pxRegular(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
