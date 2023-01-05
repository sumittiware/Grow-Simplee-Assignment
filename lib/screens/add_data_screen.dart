import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/app/app_state.dart';
import 'package:grow_simplee_assignment/models/user_details.dart';
import 'package:grow_simplee_assignment/screens/add_document_screen.dart';
import 'package:grow_simplee_assignment/screens/widgets/dialogs.dart';
import 'package:provider/provider.dart';

class AddRaiderDataScreen extends StatefulWidget {
  const AddRaiderDataScreen({super.key});

  @override
  State<AddRaiderDataScreen> createState() => _AddRaiderDataScreenState();
}

class _AddRaiderDataScreenState extends State<AddRaiderDataScreen> {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _banckAccountContoller = TextEditingController();
  final _ifscController = TextEditingController();

  void _submit() {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    final appState = Provider.of<AppState>(context, listen: false);
    appState.setEditingRider();
    appState.addUserDetails(
      UserDetails(
        name: _nameController.text,
        phoneNumber: _phoneNumberController.text,
        address: _addressController.text,
        localities: [],
        bankAccountNumber: _banckAccountContoller.text,
        ifcsNumber: _ifscController.text,
        pincode: _pincodeController.text,
      ),
    );

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return const AddDocumentsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showPopUpDialog(context);
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Container(),
      title: const Text('Add New Rider'),
    );
  }

  Widget _buildBody() {
    return Builder(builder: (context) {
      return Column(
        children: [
          Expanded(
            child: Form(
              key: _form,
              child: ListView(
                children: [
                  _buildTextField(
                    title: 'Name',
                    hintText: 'Robert',
                    controller: _nameController,
                    inputType: TextInputType.text,
                    fieldValidator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                  _buildTextField(
                      title: 'Phone Number',
                      hintText: '999999999',
                      controller: _phoneNumberController,
                      inputType: TextInputType.number,
                      maxLength: 10,
                      fieldValidator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return 'Phone number must contain 10 digits';
                        }
                        return null;
                      }),
                  _buildTextField(
                      title: 'Current Address',
                      hintText: 'Boys Hostel, Amravati',
                      controller: _addressController,
                      inputType: TextInputType.text,
                      fieldValidator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Address';
                        }
                        return null;
                      }),
                  _buildTextField(
                      title: 'Current Pincode',
                      hintText: '442306',
                      controller: _pincodeController,
                      inputType: TextInputType.text,
                      maxLength: 6,
                      fieldValidator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Pincode must contain 6 digits';
                        }
                        return null;
                      }),
                  _buildTextField(
                      title: 'Bank Account Number',
                      hintText: '123456789',
                      controller: _banckAccountContoller,
                      inputType: TextInputType.number,
                      fieldValidator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please enter Bank Account Number';
                        }
                        return null;
                      }),
                  _buildTextField(
                      title: 'IFCS Code',
                      hintText: '12324552134',
                      controller: _ifscController,
                      inputType: TextInputType.text,
                      fieldValidator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please enter IFSC code';
                        }
                        return null;
                      })
                ],
              ),
            ),
          ),
          _buildNextButton(),
        ],
      );
    });
  }

  Widget _buildTextField({
    required String title,
    required String hintText,
    required TextEditingController controller,
    required TextInputType inputType,
    required String? Function(String?) fieldValidator,
    int? maxLength,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            maxLength: maxLength,
            validator: fieldValidator,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 70,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: _submit,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          side: const BorderSide(color: Colors.deepPurple),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
