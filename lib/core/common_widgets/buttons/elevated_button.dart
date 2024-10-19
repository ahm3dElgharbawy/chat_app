import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.prefix,
    this.onTap,
    this.width = double.infinity,
    this.height,
    this.color = AppColors.primary,
    this.margin,
    this.isLoading = false,
    this.loadingIndicatorColor = Colors.white,
    this.shape,
  });
  final String title;
  final Widget? prefix;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final Color loadingIndicatorColor;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: Colors.grey,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                  height: 25,
                  child: FittedBox(
                    child:
                        CircularProgressIndicator(color: loadingIndicatorColor),
                  ),
                ),
              )
            : Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefix != null) Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: prefix!,
                ),
                Text(
                  title,
                  style: TextStyles.bold34.copyWith(color: Colors.white),
                ),
              ],
            ),
      ),
    );
  }
}
