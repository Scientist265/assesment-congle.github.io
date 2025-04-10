import 'package:draggable_square_dock_view/constants/sizing.dart';
import 'package:draggable_square_dock_view/core/ui/dock_screen.dart';
import 'package:draggable_square_dock_view/core/ui/moving_square.dart';

import '/export.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'Assignment',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            20.ht,
            ElevatedButton(
              onPressed: () {
                pushNamed(MovingSquareScreen.routeName);
              },
              child: const Text('Moving Square'),
            ),
            20.ht,
            ElevatedButton(
              onPressed: () {
                pushNamed(DockScreen.routeName);
              },
              child: const Text('Movable Dock'),
            ),
          ],
        ),
      ),
    );
  }
}
