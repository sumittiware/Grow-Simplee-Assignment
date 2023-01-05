import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/screens/widgets/button.dart';
import 'package:provider/provider.dart';

class RiderDataScreen extends StatefulWidget {
  const RiderDataScreen({super.key});

  @override
  State<RiderDataScreen> createState() => _RiderDataScreenState();
}

class _RiderDataScreenState extends State<RiderDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('View Rider'),
    );
  }

  Widget _buildBody() {
    return Consumer<AppState>(builder: (_, appState, __) {
      final user = appState.currentRider.userDetails;
      return Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildDocumentCrousel(),
                const SizedBox(
                  height: 16,
                ),
                _buildDetail('Name', user!.name!),
                _buildDetail('Phone', user.phoneNumber!),
                _buildDetail('Address', user.address!),
                _buildDetail('Pincode', user.pincode!),
                _buildDetail('Bank Account Details', user.bankAccountNumber!),
                _buildDetail('IFSC code', user.ifcsNumber!),
              ],
            ),
          ),
          _buildButtonBar()
        ],
      );
    });
  }

  Widget _buildDocumentCrousel() {
    return Consumer<AppState>(
      builder: (_, appState, __) {
        final index = appState.currentDocsIndex;
        final document = appState.currentRider.documents![index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  appState.decrementDocsIndex();
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.file(
                      document.documentFile!,
                      height: 400,
                      width: MediaQuery.of(context).size.width * 0.6,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(document.title!)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  appState.incrementDocsIndex();
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonBar() {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              title: 'Reject',
              onTap: () {
                appState.rejectCurrentRider();
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              title: 'Approve',
              onTap: () {
                appState.approveCurrentRider();
                Navigator.pop(context);
              },
            ),
          )
        ],
      );
    });
  }
}
