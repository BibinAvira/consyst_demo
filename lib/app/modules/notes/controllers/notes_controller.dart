import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime timestamp;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  factory Note.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
        'timestamp': Timestamp.fromDate(timestamp),
      };
}

class NotesController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<Note> notes = <Note>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    isLoading.value = true;

    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw 'User not logged in';

      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .orderBy('timestamp', descending: true)
          .get();

      notes.value =
          snapshot.docs.map((doc) => Note.fromFirestore(doc)).toList();
    } catch (e) {
      // Get.snackbar('Error', 'Failed to fetch notes: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addNote(String title, String content) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw 'User not logged in';

      final docRef = await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .add({
        'title': title,
        'content': content,
        'timestamp': Timestamp.now(),
      });

      notes.insert(
          0,
          Note(
            id: docRef.id,
            title: title,
            content: content,
            timestamp: DateTime.now(),
          ));

      Get.back();
      Get.snackbar('Success', 'Note added');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add note: $e');
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw 'User not logged in';

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(note.id)
          .update(note.toMap());

      final index = notes.indexWhere((n) => n.id == note.id);
      if (index != -1) notes[index] = note;

      Get.back();
      Get.snackbar('Updated', 'Note updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update note: $e');
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) throw 'User not logged in';

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('notes')
          .doc(id)
          .delete();

      notes.removeWhere((n) => n.id == id);
      Get.snackbar('Deleted', 'Note deleted');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note: $e');
    }
  }
}
