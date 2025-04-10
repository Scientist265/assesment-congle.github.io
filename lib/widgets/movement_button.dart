import 'package:draggable_square_dock_view/constants/enums.dart';
import 'package:flutter/material.dart';

class MovementButton extends StatelessWidget {
  final MovementDirection direction;
  final bool isDisabled;
  final VoidCallback onPressed;

  const MovementButton({
    super.key,
    required this.direction,
    required this.isDisabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      child: Text(
        direction == MovementDirection.left ? 'To Left' : 'To Right',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
