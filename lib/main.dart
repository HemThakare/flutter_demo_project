import 'package:first_first_project/res/routes/routes.dart';
import 'package:first_first_project/src/screens/login_screen.dart';
import 'package:first_first_project/src/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      getPages: Routes.appRoutes(),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? environment = "http://";
  String? selectedItem;

  void _handleRadioValueChange(String? value) {
    setState(() {
      environment = value;
    });
  }

  void _handleCustomDropDownChange(String value) {
    setState(() {
      selectedItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Environment',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              children: [
                Radio<String>(
                    value: "prod",
                    groupValue: environment,
                    onChanged: _handleRadioValueChange),
                const Text("Production")
              ],
            ),
            Row(
              children: [
                Radio<String>(
                    value: "Staging",
                    groupValue: environment,
                    onChanged: _handleRadioValueChange),
                const Text("Staging")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: CustomDropdown(
              onSelected: _handleCustomDropDownChange,
            )),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Background color
                ),
                onPressed: selectedItem == null
                    ? null
                    : () {
                        // Action to perform when the button is pressed
                        print('ElevatedButton pressed');
                      },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    'Build Store',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final Function(String) onSelected;

  const CustomDropdown({super.key, required this.onSelected});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> _items = [
    'Flipkart',
    'Amazon',
    'Myntra',
    'Nyka',
    'Meesho',
    'Blinkit',
    'Zepto',
    'Porter',
    'Decathlon',
    'Home Decor',
    'Market 99'
  ];

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
              constraints: BoxConstraints(
                maxHeight: availableHeight
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: _items.map((value) {
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
}*/
