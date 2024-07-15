import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_generator_mobile_app/core/utlis/colors.dart';
import 'package:quote_generator_mobile_app/core/utlis/constants.dart';
import 'package:quote_generator_mobile_app/core/utlis/text_styles.dart';
import 'package:quote_generator_mobile_app/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        style: TextStyles.normal.copyWith(
          color: ThemeColors.mainTextColor,
        ),
        expands: true,
        maxLines: null,
        minLines: null,
        onChanged: (value) => setState(() {}),
        onSubmitted: (value) => context.read<FavoritesCubit>().search(value),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Type Something Here To Search..',
          fillColor: ThemeColors.whiteColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.mainRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Constants.mainRadius),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyles.normal.copyWith(
            color: ThemeColors.mainTextColor.withOpacity(0.7),
          ),
          suffixIcon: (widget.controller.text.isNotEmpty)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.text = '';
                    });
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: ThemeColors.cancelBtnColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
