import '/export.dart';

class DockIcon extends StatelessWidget {
  final DockItem item;
  final bool isHovered;
  final bool isDragging;
  final double scale;
  final double offset;
  final VoidCallback onEnter;
  final VoidCallback onExit;

  const DockIcon({
    super.key,
    required this.item,
    required this.isHovered,
    required this.isDragging,
    required this.scale,
    required this.offset,
    required this.onEnter,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 130,
      child: MouseRegion(
        onEnter: (_) => onEnter(),
        onExit: (_) => onExit(),
        child: Transform(
          transform:
              Matrix4.identity()
                ..translate(0.0, offset)
                ..scale(scale),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isHovered)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.label,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade400, Colors.blue.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(item.icon, color: Colors.white, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
