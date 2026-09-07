class Contact {
  String nama;
  String email;
  String nomor;
  bool favorite;

  Contact({
    required this.nama,
    required this.email,
    required this.nomor,
    this.favorite = false,
  });
}