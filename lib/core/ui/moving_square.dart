import 'package:draggable_square_dock_view/config/router.dart';
import 'package:draggable_square_dock_view/constants/enums.dart';
import 'package:draggable_square_dock_view/widgets/movement_button.dart';
import 'package:draggable_square_dock_view/widgets/square_widget.dart';
import 'package:flutter/material.dart';

class MovingSquareScreen extends StatefulWidget {
  const MovingSquareScreen({super.key});
  static const String routeName = '/moving_square';
  @override
  State<MovingSquareScreen> createState() => _MovingSquareScreenState();
}

class _MovingSquareScreenState extends State<MovingSquareScreen>
    with TickerProviderStateMixin, SquareMovementState {
  @override
  void initState() {
    super.initState();
    _initMovementController(this);
  }

  @override
  void dispose() {
    movementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            Expanded(
              child: Center(
                child: AnimatedBuilder(
                  animation: movementController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(currentPosition, 0),
                      child: child,
                    );
                  },
                  child: const SquareWidget(),
                ),
              ),
            ),
            _buildControlButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MovementButton(
            direction: MovementDirection.left,
            isDisabled: isLeftDisabled || isMoving,
            onPressed: moveLeft,
          ),
          MovementButton(
            direction: MovementDirection.right,
            isDisabled: isRightDisabled || isMoving,
            onPressed: moveRight,
          ),
        ],
      ),
    );
  }
}

mixin SquareMovementState<T extends StatefulWidget> on State<T> {
  late AnimationController movementController;
  late double screenWidth;
  double currentPosition = 0;
  bool get isMoving => movementController.isAnimating;
  bool get isLeftDisabled => currentPosition <= -screenWidth / 2 + 50;
  bool get isRightDisabled => currentPosition >= screenWidth / 2 - 50;

  void _initMovementController(TickerProvider tickerProvider) {
    movementController = AnimationController(
      vsync: tickerProvider,
      duration: const Duration(seconds: 1),
    )..addListener(_handleAnimationUpdate);
  }

  void _handleAnimationUpdate() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
  }

  void moveLeft() {
    if (isMoving || isLeftDisabled) return;

    final animation = Tween<double>(
      begin: currentPosition,
      end: -screenWidth / 2 + 50,
    ).animate(
      CurvedAnimation(parent: movementController, curve: Curves.easeInOut),
    );

    animation.addListener(() {
      setState(() => currentPosition = animation.value);
    });

    movementController.forward(from: 0);
  }

  void moveRight() {
    if (isMoving || isRightDisabled) return;

    final animation = Tween<double>(
      begin: currentPosition,
      end: screenWidth / 2 - 50,
    ).animate(
      CurvedAnimation(parent: movementController, curve: Curves.easeInOut),
    );

    animation.addListener(() {
      setState(() => currentPosition = animation.value);
    });

    movementController.forward(from: 0);
  }
}
