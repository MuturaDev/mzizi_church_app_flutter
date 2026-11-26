import 'package:flutter/material.dart';

/// Replacement for the abandoned `sweetalert` package, with the same call
/// shape: `SweetAlert.show(context, title: ..., subtitle: ..., style: ...)`.
enum SweetAlertStyle { success, error, confirm, loading }

class SweetAlert {
  SweetAlert._();

  static Future<void> show(
    BuildContext context, {
    String? title,
    String? subtitle,
    SweetAlertStyle style = SweetAlertStyle.success,
    Color confirmButtonColor = const Color(0xFF487890),
    String confirmButtonText = 'OK',
  }) {
    final IconData icon;
    final Color iconColor;
    switch (style) {
      case SweetAlertStyle.success:
        icon = Icons.check_circle_outline;
        iconColor = Colors.green;
      case SweetAlertStyle.error:
        icon = Icons.highlight_off;
        iconColor = Colors.red;
      case SweetAlertStyle.confirm:
        icon = Icons.help_outline;
        iconColor = Colors.orange;
      case SweetAlertStyle.loading:
        icon = Icons.hourglass_empty;
        iconColor = Colors.grey;
    }
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(icon, color: iconColor, size: 64),
        title: title == null ? null : Text(title, textAlign: TextAlign.center),
        content: subtitle == null
            ? null
            : Text(subtitle, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: confirmButtonColor),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(confirmButtonText),
          ),
        ],
      ),
    );
  }
}
