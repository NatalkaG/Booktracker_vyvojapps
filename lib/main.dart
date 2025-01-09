import 'package:flutter/material.dart';

void main() {
  runApp(BookTrackerApp());
}

class BookTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  // List of books
  List<Book> books = [];

  // Text controllers to manage the input fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Function to add a book to the list
  void addBook() {
    setState(() {
      books.add(
        Book(
          title: titleController.text,
          pages: int.tryParse(pagesController.text) ?? 0,
          dateRead: dateController.text,
        ),
      );
    });
    // Clear the text fields after adding a book
    titleController.clear();
    pagesController.clear();
    dateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input fields
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Book Title'),
            ),
            TextField(
              controller: pagesController,
              decoration: InputDecoration(labelText: 'Number of Pages'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date Read (YYYY-MM-DD)'),
            ),
            SizedBox(height: 20),
            // Button to add book
            ElevatedButton(
              onPressed: addBook,
              child: Text('Add Book'),
            ),
            SizedBox(height: 20),
            // Displaying the list of books
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                    title: Text(book.title),
                    subtitle: Text('${book.pages} pages - ${book.dateRead}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final int pages;
  final String dateRead;

  Book({
    required this.title,
    required this.pages,
    required this.dateRead,
  });
}


