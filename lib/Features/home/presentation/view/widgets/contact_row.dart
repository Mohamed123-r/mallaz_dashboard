import 'package:flutter/material.dart';

import '../../../data/models/appointment_model.dart';
import 'contact_card.dart';
import 'note_card.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({
    super.key,
    required this.context,
    required this.isDark,
    required this.details,
  });

  final BuildContext context;
  final bool isDark;
  final AppointmentDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContactCard(
          context: context,
          isDark: isDark,
          name: details.data.ownerName,
          phone: details.data.ownerPhone,
          image: details.data.ownerImage,
        ),
        const SizedBox(width: 16),
        ContactCard(
          context: context,
          isDark: isDark,
          name: details.data.requesterName,
          phone: details.data.requesterPhone,
          image: details.data.requesterImage,
        ),
        Expanded(
          child: NoteCard(
            context: context,
            isDark: isDark,
            note: details.data.notes,
          ),
        ),
      ],
    );
  }
}
