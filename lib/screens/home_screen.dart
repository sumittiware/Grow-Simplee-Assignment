import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/screens/add_data_screen.dart';
import 'package:grow_simplee_assignment/screens/widgets/raider_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Riders'),
    );
  }

  Widget _buildBody() {
    return Consumer<AppState>(builder: (_, appState, __) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return RiderTile(rider: appState.riders[index]);
        },
        itemCount: appState.riders.length,
      );
    });
  }

  Widget _buildFloatingButton() {
    return SizedBox(
      width: 120,
      child: FloatingActionButton(
        heroTag: 'add-raider',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return const AddRaiderDataScreen();
              },
            ),
          );
        },
        child: const Text(
          'Add Rider',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
