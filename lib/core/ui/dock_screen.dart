import '/export.dart';

class DockScreen extends StatefulWidget {
  const DockScreen({super.key});
  static const String routeName = '/dock-screen';

  @override
  State<DockScreen> createState() => _DockScreenState();
}

class _DockScreenState extends State<DockScreen> with TickerProviderStateMixin {
  late List<DockItem> dockItems;
  int? hoveredIndex;
  int? draggedIndex;
  Offset? floatingIconPosition;
  int? floatingIconIndex;
  late AnimationController bounceController;

  @override
  void initState() {
    super.initState();
    dockItems = [
      DockItem(icon: Icons.home, label: 'Home'),
      DockItem(icon: Icons.settings, label: 'Setting'),
      DockItem(icon: Icons.mail, label: 'Mail'),
      DockItem(icon: Icons.music_note, label: 'Music'),
      DockItem(icon: Icons.camera_alt, label: 'Photos'),
    ];

    bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    bounceController.dispose();
    super.dispose();
  }

  void _handleItemHover(int index, bool isHovering) {
    if (isHovering) {
      setState(() => hoveredIndex = index);
      bounceController.forward(from: 0.0);
    } else if (hoveredIndex == index) {
      setState(() => hoveredIndex = null);
    }
  }

  void _handleItemDragUpdate(int index, DragUpdateDetails details) {
    setState(() {
      floatingIconPosition = details.globalPosition;
      floatingIconIndex = index;
    });
  }

  void _handleItemDragEnd() {
    setState(() {
      draggedIndex = null;
      floatingIconPosition = null;
      floatingIconIndex = null;
    });
  }

  void _handleItemAccept(int fromIndex, int toIndex) {
    if (fromIndex != toIndex) {
      setState(() {
        final item = dockItems.removeAt(fromIndex);
        dockItems.insert(toIndex, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dockWidth = screenWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          children: [
            if (floatingIconPosition != null && floatingIconIndex != null)
              FloatingDockIcon(
                item: dockItems[floatingIconIndex!],
                position: floatingIconPosition!,
              ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DockContainer(
                width: dockWidth,
                children: List.generate(dockItems.length, (index) {
                  return DragTarget<int>(
                    onWillAcceptWithDetails: (details) => details.data != index,
                    onAcceptWithDetails:
                        (details) => _handleItemAccept(details.data, index),
                    builder: (context, candidateData, rejectedData) {
                      return LongPressDraggable<int>(
                        data: index,
                        feedback: Material(
                          color: Colors.transparent,
                          child: DockIcon(
                            item: dockItems[index],
                            isHovered: false,
                            isDragging: true,
                            scale: 1.0,
                            offset: 0.0,
                            onEnter: () {},
                            onExit: () {},
                          ),
                        ),
                        childWhenDragging: const SizedBox(
                          width: 60,
                          height: 110,
                        ),
                        onDragStarted: () {
                          setState(() {
                            draggedIndex = index;
                            hoveredIndex = null;
                          });
                        },
                        onDragUpdate:
                            (details) => _handleItemDragUpdate(index, details),
                        onDragEnd: (_) => _handleItemDragEnd(),
                        child: DockIcon(
                          item: dockItems[index],
                          isHovered:
                              hoveredIndex == index && draggedIndex != index,
                          isDragging: false,
                          scale:
                              hoveredIndex == index && draggedIndex != index
                                  ? 1.0 + bounceController.value * 0.3
                                  : 1.0,
                          offset:
                              hoveredIndex == index && draggedIndex != index
                                  ? -20.0 * bounceController.value
                                  : 0.0,
                          onEnter: () => _handleItemHover(index, true),
                          onExit: () => _handleItemHover(index, false),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
