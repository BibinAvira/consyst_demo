import 'package:flashcurrent/app/modules/notes/controllers/notes_controller.dart';
import 'package:flashcurrent/app/modules/notes/views/notes_detailed_view.dart';
import 'package:flashcurrent/app/modules/notes/views/notes_edit_view.dart';
import 'package:flashcurrent/app/modules/profile/controllers/profile_controller.dart';
import 'package:flashcurrent/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotesHomeView extends StatelessWidget {
  final NotesController controller = Get.put(NotesController());

  // List of light pastel colors for note backgrounds
  final List<Color> noteColors = [
    Color(0xFFF8EDEB), // Light pink
    Color(0xFFFFF1E6), // Light peach
    Color(0xFFE2ECE9), // Light mint
    Color(0xFFE2F0CB), // Light lime
    Color(0xFFE6F4F1), // Light cyan
    Color(0xFFEEF1FF), // Light lavender
    Color(0xFFFBE7C6), // Light yellow
    Color(0xFFE0F4FF), // Light blue
  ];

  // Get a random color from the list based on index
  Color getColorForIndex(int index) {
    return noteColors[index % noteColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Get.toNamed(Routes.PROFILE),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'My Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Notes'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(Routes.PROFILE);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                // Use the profile controller to handle logout
                final profileController = Get.put(ProfileController());
                await profileController.signOut();
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.notes.isEmpty) {
          return Center(
            child: Text(
              'No notes yet.\n Tap the + button to create one.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 16.0),
              //   child: Text(
              //     'List Notes',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.notes.length,
                  itemBuilder: (context, index) {
                    final note = controller.notes[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Material(
                        color: getColorForIndex(index),
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Get.to(() => NoteDetailView(note: note));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  note.content,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    DateFormat('yyyy/MM/dd')
                                        .format(note.timestamp),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => NoteEditView());
        },
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
}
