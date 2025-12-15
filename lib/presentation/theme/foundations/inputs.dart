import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_template/l10n/gen/app_localizations.dart';
import '../spacing.dart';
import '../radii.dart';

/// Text field wrapper for password input with visibility toggle.
class AppPasswordField extends StatefulWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the field is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Label text.
  final String? labelText;

  /// Hint text.
  final String? hintText;

  /// Error text (shows error state when non-null).
  final String? errorText;

  /// Helper text shown below the field.
  final String? helperText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Input validation.
  final String? Function(String?)? validator;

  /// Focus node.
  final FocusNode? focusNode;

  /// Text input action.
  final TextInputAction? textInputAction;

  /// Auto-fill hints.
  final Iterable<String>? autofillHints;

  const AppPasswordField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.autofillHints,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      obscureText: _obscureText,
      enabled: widget.enabled,
      validator: widget.validator,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints ?? [AutofillHints.password],
      decoration: InputDecoration(
        labelText: widget.labelText ?? l10n.inputPasswordLabel,
        hintText: widget.hintText,
        errorText: widget.errorText,
        helperText: widget.helperText,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: colorScheme.onSurfaceVariant,
          ),
          onPressed: () => setState(() => _obscureText = !_obscureText),
          tooltip: _obscureText
              ? l10n.inputShowPassword
              : l10n.inputHidePassword,
        ),
      ),
    );
  }
}

/// Text field wrapper for search input.
class AppSearchField extends StatefulWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the search is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Called when the clear button is pressed.
  final VoidCallback? onClear;

  /// Hint text.
  final String? hintText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Focus node.
  final FocusNode? focusNode;

  /// Whether to autofocus.
  final bool autofocus;

  /// Debounce duration for onChanged.
  final Duration? debounceDuration;

  const AppSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.hintText,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.debounceDuration,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late TextEditingController _controller;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateClearButton);
    _showClear = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _updateClearButton() {
    final show = _controller.text.isNotEmpty;
    if (show != _showClear) {
      setState(() => _showClear = show);
    }
  }

  void _clear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hintText ?? l10n.inputSearchHint,
        prefixIcon: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
        suffixIcon: _showClear
            ? IconButton(
                icon: Icon(Icons.clear, color: colorScheme.onSurfaceVariant),
                onPressed: _clear,
                tooltip: l10n.inputClear,
              )
            : null,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.input),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}

/// Text field wrapper for phone number input with mask.
class AppPhoneField extends StatefulWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the field is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Label text.
  final String? labelText;

  /// Hint text.
  final String? hintText;

  /// Error text.
  final String? errorText;

  /// Helper text.
  final String? helperText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Input validation.
  final String? Function(String?)? validator;

  /// Focus node.
  final FocusNode? focusNode;

  /// Text input action.
  final TextInputAction? textInputAction;

  /// Country code prefix (e.g., '+1', '+998').
  final String countryCode;

  const AppPhoneField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.countryCode = '+998',
  });

  @override
  State<AppPhoneField> createState() => _AppPhoneFieldState();
}

class _AppPhoneFieldState extends State<AppPhoneField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  String _formatPhoneNumber(String value) {
    // Remove all non-digit characters
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');

    // Format as (XX) XXX-XX-XX
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length && i < 9; i++) {
      if (i == 0) buffer.write('(');
      buffer.write(digits[i]);
      if (i == 1) buffer.write(') ');
      if (i == 4 || i == 6) buffer.write('-');
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        final formatted = _formatPhoneNumber(value);
        if (formatted != value) {
          _controller.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        }
        widget.onChanged?.call(widget.countryCode + formatted);
      },
      onFieldSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      validator: widget.validator,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d\s\(\)\-]')),
        LengthLimitingTextInputFormatter(15),
      ],
      autofillHints: const [AutofillHints.telephoneNumber],
      decoration: InputDecoration(
        labelText: widget.labelText ?? l10n.inputPhoneLabel,
        hintText: widget.hintText ?? '(XX) XXX-XX-XX',
        errorText: widget.errorText,
        helperText: widget.helperText,
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.phone_outlined),
              AppSpacing.horizontalGapSm,
              Text(
                widget.countryCode,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0),
      ),
    );
  }
}

/// Text field wrapper for email input.
class AppEmailField extends StatelessWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the field is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Label text.
  final String? labelText;

  /// Hint text.
  final String? hintText;

  /// Error text.
  final String? errorText;

  /// Helper text.
  final String? helperText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Input validation.
  final String? Function(String?)? validator;

  /// Focus node.
  final FocusNode? focusNode;

  /// Text input action.
  final TextInputAction? textInputAction;

  const AppEmailField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.validator,
    this.focusNode,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      enabled: enabled,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return l10n.inputEmailRequired;
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return l10n.inputEmailInvalid;
            }
            return null;
          },
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        labelText: labelText ?? l10n.inputEmailLabel,
        hintText: hintText ?? l10n.inputEmailHint,
        errorText: errorText,
        helperText: helperText,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}

/// Text field wrapper for multi-line text area.
class AppTextArea extends StatelessWidget {
  /// Text editing controller.
  final TextEditingController? controller;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Label text.
  final String? labelText;

  /// Hint text.
  final String? hintText;

  /// Error text.
  final String? errorText;

  /// Helper text.
  final String? helperText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Input validation.
  final String? Function(String?)? validator;

  /// Focus node.
  final FocusNode? focusNode;

  /// Maximum number of lines.
  final int maxLines;

  /// Minimum number of lines.
  final int minLines;

  /// Maximum length (shows counter when set).
  final int? maxLength;

  const AppTextArea({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.validator,
    this.focusNode,
    this.maxLines = 5,
    this.minLines = 3,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      validator: validator,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        helperText: helperText,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.all(AppSpacing.lg),
      ),
    );
  }
}
