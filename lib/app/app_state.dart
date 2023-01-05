import 'package:flutter/material.dart';
import 'package:grow_simplee_assignment/models/documents.dart';
import 'package:grow_simplee_assignment/models/rider.dart';
import 'package:grow_simplee_assignment/models/user_details.dart';

class AppState with ChangeNotifier {
  final List<Rider> _riders = [];
  Rider? _currentRider;
  int _currentDocsIndex = 0;
  Rider? _editingRider;

  List<Rider> get riders => [..._riders];
  Rider get currentRider => _currentRider!;
  int get currentDocsIndex => _currentDocsIndex;
  Rider get editingRider => _editingRider!;

  void setCurrentRider(Rider value) {
    _currentRider = value;
    notifyListeners();
  }

  void setEditingRider() {
    _editingRider = Rider();
    notifyListeners();
  }

  void clearEditingRider() {
    _editingRider = null;
    notifyListeners();
  }

  void addUserDocument(Document document) {
    List<Document> docs = _editingRider!.documents ?? [];
    docs.add(document);
    _editingRider!.documents = docs;
    notifyListeners();
  }

  void addUserDetails(UserDetails details) {
    _editingRider!.userDetails = details;
    notifyListeners();
  }

  void addNewRider() {
    _editingRider!.uid = DateTime.now().toString();
    _riders.add(_editingRider!);
    _editingRider = null;
    notifyListeners();
  }

  void approveCurrentRider({Rider? rider}) {
    final currRider = rider ?? _currentRider;
    _riders.removeWhere((rider) => rider.uid == currRider!.uid);
    currRider!.verified = true;
    _riders.add(currRider);
    notifyListeners();
  }

  void rejectCurrentRider({Rider? rider}) {
    final currRider = rider ?? _currentRider;
    _riders.removeWhere((rider) => rider.uid == currRider!.uid);
    notifyListeners();
  }

  void decrementDocsIndex() {
    if (_currentDocsIndex == 0) {
      return;
    }
    _currentDocsIndex--;
    notifyListeners();
  }

  void incrementDocsIndex() {
    if (_currentDocsIndex == _currentRider!.documents!.length - 1) {
      return;
    }
    _currentDocsIndex++;
    notifyListeners();
  }
}
