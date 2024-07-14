import 'package:quote_generator_mobile_app/core/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  final String? id;
  final String? author;
  final String? content;
  final List<String>? tags;
  final String? authorSlug;
  final int? length;
  final String? dateAdded;
  final String? dateModified;

  const QuoteModel({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  }) : super(
          quoteId: id ?? '',
          quoteContent: content ?? '',
          quoteAuthor: author ?? '',
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        id: json['_id'] as String?,
        author: json['author'] as String?,
        content: json['content'] as String?,
        tags: json['tags'] as List<String>?,
        authorSlug: json['authorSlug'] as String?,
        length: json['length'] as int?,
        dateAdded: json['dateAdded'] as String?,
        dateModified: json['dateModified'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'author': author,
        'content': content,
        'tags': tags,
        'authorSlug': authorSlug,
        'length': length,
        'dateAdded': dateAdded,
        'dateModified': dateModified,
      };
}
