import 'package:drift/drift.dart';

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'custom_repo.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class Repos extends Table {
  TextColumn get name => text().withLength(min: 2, max: 32)();
  TextColumn get owner => text().withLength(min: 2, max: 32)();
  BoolColumn get enabled => boolean()();
}

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Repos])
class MyDatabase extends _$MyDatabase {

  Future<List<Repo>> get allTodoEntries => select(repos).get();
  Future deleteEntry(Repo entry) {
    // using replace will update all fields from the entry that are not marked as a primary key.
    // it will also make sure that only the entry with the same primary key will be updated.
    // Here, this means that the row that has the same id as entry will be updated to reflect
    // the entry's title, content and category. As its where clause is set automatically, it
    // cannot be used together with where.
    return delete(repos).    (entry);
  }
}