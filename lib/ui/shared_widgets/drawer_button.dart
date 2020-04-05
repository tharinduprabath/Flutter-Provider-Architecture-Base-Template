import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  DrawerButton({this.icon, this.text, this.onPressed, this.isSelected});

  final IconData icon;
  final String text;
  final Function onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.black45,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
