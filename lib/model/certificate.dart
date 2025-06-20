
class Certificate {
  final String title;
  final String issuer;
  final String date;
  final String? description; // optional
  final String? link; // optional

  Certificate({
    required this.title,
    required this.issuer,
    required this.date,
    this.description,
    this.link,
  });
}