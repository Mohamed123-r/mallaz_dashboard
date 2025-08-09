import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:book_apartment_dashboard/generated/l10n.dart';
import 'package:book_apartment_dashboard/core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../add_new_properties/data/models/property_details_model.dart';
import '../../../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../../../add_new_properties/presentation/cubit/property_details_state.dart';

class EditPropertiesDeteils extends StatefulWidget {
  final VoidCallback onTapBack;
  final int propertyId;

  const EditPropertiesDeteils({
    super.key,
    required this.onTapBack,
    required this.propertyId,
  });

  @override
  State<EditPropertiesDeteils> createState() => _EditPropertyScreenState();
}

class _EditPropertyScreenState extends State<EditPropertiesDeteils> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _typeController;
  late TextEditingController _roomsController;
  late TextEditingController _bathroomsController;
  late TextEditingController _areaController;
  late TextEditingController _priceController;
  late TextEditingController _floorController;
  late TextEditingController _governorateController;
  late TextEditingController _cityController;
  late TextEditingController _rentTypeController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _typeController = TextEditingController();
    _roomsController = TextEditingController();
    _bathroomsController = TextEditingController();
    _areaController = TextEditingController();
    _priceController = TextEditingController();
    _floorController = TextEditingController();
    _governorateController = TextEditingController();
    _cityController = TextEditingController();
    _rentTypeController = TextEditingController();
    context.read<PropertyDetailsCubit>().fetchPropertyDetails(
      widget.propertyId,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _roomsController.dispose();
    _bathroomsController.dispose();
    _areaController.dispose();
    _priceController.dispose();
    _floorController.dispose();
    _governorateController.dispose();
    _cityController.dispose();
    _rentTypeController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final property = PropertyDetailsModel(
      id: widget.propertyId,
      title: _titleController.text,
      description: _descriptionController.text,
      type: _typeController.text,
      rooms: _roomsController.text,
      bathrooms: _bathroomsController.text,
      area: int.tryParse(_areaController.text) ?? 0,
      price: int.tryParse(_priceController.text) ?? 0,
      floor: _floorController.text,
      propertyType: "Sale",
      governorate: _governorateController.text,
      city: _cityController.text,
      rentType:
          _rentTypeController.text.isEmpty ? null : _rentTypeController.text,
      isFurnished: true,
    );
    context.read<PropertyDetailsCubit>().updatePropertyDetails(property);
    logger.w("Saving changes for propertyId: ${property.id}");
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(S.of(context).changesSaved)));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    logger.i(
      "EditPropertiesDeteils: Building with propertyId: ${widget.propertyId}",
    );

    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoading) return CustomLoading();
        if (state is PropertyDetailsFailure) return Text(state.error);
        if (state is PropertyDetailsSuccess) {
          final details = state.details;
          _titleController.text = details.title ?? '';
          _descriptionController.text = details.description ?? '';
          _typeController.text = details.type ?? '';
          _roomsController.text = details.rooms ?? '';
          _bathroomsController.text = details.bathrooms ?? '';
          _areaController.text = details.area?.toString() ?? '';
          _priceController.text = details.price?.toString() ?? '';
          _floorController.text = details.floor ?? '';
          _governorateController.text = details.governorate ?? '';
          _cityController.text = details.city ?? '';
          _rentTypeController.text = details.rentType ?? '';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: widget.onTapBack,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color:
                        isDark
                            ? AppColors.darkModeText
                            : AppColors.lightModeText,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      children: [
                        SizedBox(),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: S.of(context).title,

                            border: buildOutlineInputBorder(isDark),
                          ),
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: S.of(context).description,
                            border: buildOutlineInputBorder(isDark),
                          ),
                          maxLines: 3,
                        ),
                        TextFormField(
                          controller: _priceController,
                          decoration: InputDecoration(
                            labelText: S.of(context).price,
                            border: buildOutlineInputBorder(isDark),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _typeController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).type,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _areaController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).area,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _roomsController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).rooms,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _bathroomsController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).bathrooms,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),

                        TextFormField(
                          controller: _floorController,
                          decoration: InputDecoration(
                            labelText: S.of(context).floor,
                            border: buildOutlineInputBorder(isDark),
                          ),
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _governorateController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).governorate,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _cityController,
                                decoration: InputDecoration(
                                  labelText: S.of(context).city,
                                  border: buildOutlineInputBorder(isDark),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _rentTypeController,
                          decoration: InputDecoration(
                            labelText: S.of(context).rentType,
                            border: buildOutlineInputBorder(isDark),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 200,
                          height: 56,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color:
                              isDark
                                  ? AppColors.darkModeButtonsPrimary
                                  : AppColors.lightModeButtonsPrimary,
                          onPressed: _saveChanges,
                          child: Text(
                            S.of(context).save,
                            style: TextStyle(
                              fontSize: 22,
                              color:
                                  isDark
                                      ? AppColors.darkModeText
                                      : AppColors.lightModeText,
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return CustomLoading();
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder(bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
        width: 1.0,
      ),
    );
  }
}
