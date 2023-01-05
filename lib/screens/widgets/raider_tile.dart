import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/models/rider.dart';
import 'package:grow_simplee_assignment/screens/rider_data_screen.dart';
import 'package:provider/provider.dart';

class RiderTile extends StatefulWidget {
  final Rider rider;

  const RiderTile({
    super.key,
    required this.rider,
  });

  @override
  State<RiderTile> createState() => _RiderTileState();
}

class _RiderTileState extends State<RiderTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Dismissible(
        key: Key(widget.rider.uid!),
        background: slideRightBackground(),
        secondaryBackground: slideLeftBackground(),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            appState.rejectCurrentRider(rider: widget.rider);
          } else {
            appState.approveCurrentRider(rider: widget.rider);
          }
          return true;
        },
        child: InkWell(
          onTap: () {
            appState.setCurrentRider(widget.rider);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) {
                  return const RiderDataScreen();
                },
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color:
                (widget.rider.verified) ? Colors.green.shade200 : Colors.white,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Text(widget.rider.userDetails!.name!),
            ),
          ),
        ),
      );
    });
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
