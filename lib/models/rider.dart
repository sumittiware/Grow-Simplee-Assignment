import 'package:grow_simplee_assignment/models/user_details.dart';
import 'package:grow_simplee_assignment/models/documents.dart';

class Rider {
  String? uid;
  UserDetails? userDetails;
  List<Document>? documents;
  bool verified;

  Rider({
    this.uid,
    this.userDetails,
    this.documents,
    this.verified = false,
  });
}
