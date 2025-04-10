import '/export.dart';

class FloatingDockIcon extends StatelessWidget {
  final DockItem item;
  final Offset position;

  const FloatingDockIcon({
    super.key,
    required this.item,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - 30,
      top: position.dy - 30,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -0.1),
            ),
          ],
        ),
        child: Icon(item.icon, color: Colors.white, size: 30),
      ),
    );
  }
}
