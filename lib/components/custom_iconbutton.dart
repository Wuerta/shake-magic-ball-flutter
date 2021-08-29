import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final String tooltip;

  const CustomIconButton({required this.tooltip, required this.icon});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: tooltip,
      child: IconButton(
        onPressed: () => _onPressed(key),
        icon: icon,
      ),
    );
  }

  void _onPressed(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}