import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final Function(String) onSelected;

  final List<String> items;

  const CustomDropdown({super.key, required this.onSelected, required this.items});

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {

  String? _selectedItem;
  bool _isDropdownExpanded = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    // _selectedItem = null; // No item is selected initially
  }

  void _toggleDropdown() {
    if (_isDropdownExpanded) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    // Get the screen height
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the available height for the dropdown
    final dropdownTop = offset.dy + size.height;
    final availableHeight = screenHeight - dropdownTop - 12;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
          child: Material(
            elevation: 5.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: availableHeight),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.items.map((value) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(value),
                        if (_selectedItem == value)
                          const Icon(
                            Icons.check,
                            color: Colors.purple, // Checkmark color
                          ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _selectedItem = value;
                        _closeDropdown();
                      });
                      widget.onSelected(value);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownExpanded = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    setState(() {
      _isDropdownExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_selectedItem ?? 'Select User Account'),
            // Show hint if no item is selected
            Icon(
              _isDropdownExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
