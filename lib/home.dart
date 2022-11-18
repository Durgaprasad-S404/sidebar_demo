import 'package:flutter/material.dart';
import 'package:sidebar_demo/navigation_bar.dart';
import 'package:sidebar_demo/sidebar.dart';

enum CreateType { screen, component }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  String _selectedTab = '';
  late TabController _controller;
  final List<String> _screensList = [];
  final List<String> _componentsList = [];
  String _screenOrComponentName = '';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onTabChanged: (TabController tabController) {
              _controller = tabController;
              setState(() {});
            },
            onShareButtonPressed: () {},
            onAddButtonPressed: () {
              _showSelectionDialog(context);
            },
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SideBar(
                    onTapped: (String selectedTab) {
                      _selectedTab = selectedTab;
                      setState(() {});
                    },
                    tabController: _controller,
                    screensList: _screensList,
                    componentsList: _componentsList,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(_selectedTab),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showCreationDialog(
      BuildContext context, CreateType createType) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter ${createType.name} name'),
          content: Form(
            key: _formKey,
            child: _getNameField(),
          ),
          actions: <Widget>[
            _getCancelButton(),
            _getCreateButton(createType),
          ],
        );
      },
    );
  }

  TextFormField _getNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        label: Text("Enter name"),
      ),
      onChanged: (String name) {
        _screenOrComponentName = name;
      },
      validator: (name) {
        if (name == null || name == '') {
          return "Name can't be empty";
        }
        return null;
      },
    );
  }

  TextButton _getCancelButton() {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  TextButton _getCreateButton(CreateType createType) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: const Text('Create'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (createType == CreateType.screen) {
            _screensList.add(_screenOrComponentName);
          } else {
            _componentsList.add(_screenOrComponentName);
          }
          Navigator.of(context).pop();
          setState(() {});
        }
      },
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _showCreationDialog(context, CreateType.screen);
                },
                child: const Text('Create a screen'),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _showCreationDialog(context, CreateType.component);
                },
                child: const Text('Create a component'),
              ),
            ],
          ),
        );
      },
    );
  }
}
