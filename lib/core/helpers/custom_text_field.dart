/*external dependencies*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*local dependencies*/

class CustomTextField extends StatefulWidget {
  final bool autofocus;
  final EdgeInsets scrollPadding;
  final String? hintText;
  final String? errorText;
  final String? suffixText;
  final String? label;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Function()? onTap;
  final bool enabled;
  final bool dropDown;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function(String value)? onChanged;
  final bool canClear;
  final Function(String)? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final int? maxLenght;

  const CustomTextField({
    super.key,
    this.maxLenght,
    this.autofocus = false,
    this.scrollPadding = const EdgeInsets.all(20),
    this.label,
    this.hintText,
    required this.controller,
    this.canClear = true,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
    this.dropDown = false,
    this.readOnly = false,
    this.suffixText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.contentPadding,
    this.maxLines,
    this.minLines,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();

  refreshState(VoidCallback fn) {
    if (mounted) setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onInputFocusChange);
    widget.controller.addListener(() {
      refreshState(() {});
    });
  }

  void _onInputFocusChange() {
    refreshState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label == null ? const SizedBox() : const SizedBox(height: 16),
        widget.label == null ? const SizedBox() : const SizedBox(height: 8),
        TextFormField(
          maxLength: widget.maxLenght,
          enabled: widget.enabled,
          autofocus: widget.autofocus,
          scrollPadding: widget.scrollPadding,
          inputFormatters: const [],
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          controller: widget.controller,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            errorMaxLines: 3,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
            hintText: widget.hintText,
            suffixIcon: widget.readOnly && widget.onTap == null
                ? const SizedBox()
                : widget.dropDown
                    ? const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                      )
                    : widget.controller.text.isNotEmpty &&
                            _focusNode.hasFocus &&
                            widget.canClear
                        ? IconButton(
                            onPressed: () {
                              widget.controller.clear();
                            },
                            icon: const Icon(
                              Icons.cancel_sharp,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: widget.suffixIcon,
                          ),
            suffixText: widget.suffixText,
            contentPadding: widget.contentPadding,
            isDense: true,
            filled: true,
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
              ),
            ),
            errorStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
}
