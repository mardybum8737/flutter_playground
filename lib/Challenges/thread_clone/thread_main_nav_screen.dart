import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_playground/Challenges/thread_clone/thread_empty_screen.dart';
import 'package:flutter_playground/Challenges/thread_clone/thread_home_screen.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_logo.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_nav_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadMainNavScreen extends StatefulWidget {
  const ThreadMainNavScreen({super.key});

  @override
  State<ThreadMainNavScreen> createState() => _ThreadMainNavScreenState();
}

class _ThreadMainNavScreenState extends State<ThreadMainNavScreen> {
  final ScrollController _scrollController = ScrollController();

  int _selectedIndex = 0;
  bool _showAppbar = true;

  void _onScroll() {
    if (_scrollController.offset > 50 &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      if (_showAppbar) {
        setState(() {
          _showAppbar = false;
        });
      }
    } else {
      if (!_showAppbar) {
        setState(() {
          _showAppbar = true;
        });
      }
    }
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        title: AnimatedOpacity(
          opacity: _showAppbar ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: const ThreadLogo(),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const ThreadHomeScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: const ThreadEmptyScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const ThreadEmptyScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const ThreadEmptyScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const ThreadEmptyScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ThreadNavTab(
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            ThreadNavTab(
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            ThreadNavTab(
              icon: FontAwesomeIcons.penToSquare,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTap(2),
            ),
            ThreadNavTab(
              icon: FontAwesomeIcons.heart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            ThreadNavTab(
              icon: FontAwesomeIcons.user,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
