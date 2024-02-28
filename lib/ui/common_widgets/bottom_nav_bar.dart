import 'package:flutter/material.dart';
import 'package:ranking_app/ui/02_history/history_screen.dart';
import 'package:ranking_app/ui/01_search/search_screen.dart';
import 'package:ranking_app/styles/app_styles.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final int selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppStyles.secondaryBackgroundColor,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: 1 == selectedMenu
                      ? Colors.white
                      : AppStyles.secondaryBackgroundColor,
                  size: 30,
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        SearchPage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.history_rounded,
                  color: 2 == selectedMenu
                      ? Colors.white
                      : AppStyles.secondaryBackgroundColor,
                  size: 30,
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        const HistoryScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
