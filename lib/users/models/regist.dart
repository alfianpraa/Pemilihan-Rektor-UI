class Regist {
  int id;
  String fullname;
  String frontdegree;
  String backdegree;
  String email;
  String phone;
  String nik;
  String tempatlahir;
  String tanggallahir;
  String alamat;
  String pekerjaan;
  String unitkerja;
  String pangkatjabatan;
  String data;
  String name;
  String filedata;
  String filename;

  Regist(
    this.id,
    this.fullname,
    this.frontdegree,
    this.backdegree,
    this.email,
    this.phone,
    this.nik,
    this.tempatlahir,
    this.tanggallahir,
    this.alamat,
    this.pekerjaan,
    this.unitkerja,
    this.pangkatjabatan,
    this.data,
    this.name,
    this.filedata,
    this.filename,
  );

  factory Regist.fromJson(Map<String, dynamic> json) => Regist(
        int.parse(json["id"]),
        json["fullname"],
        json["frontdegree"],
        json["backdegree"],
        json["email"],
        json["phone"],
        json["nik"],
        json["tempatlahir"],
        json["tanggallahir"],
        json["alamat"],
        json["pekerjaan"],
        json["unitkerja"],
        json["pangkatjabatan"],
        json["data"],
        json["name"],
        json["filedata"],
        json["filename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "fullname": fullname,
        "frontdegree": frontdegree,
        "backdegree": backdegree,
        "email": email,
        "phone": phone,
        "nik": nik,
        "tempatlahir": tempatlahir,
        "tanggallahir": tanggallahir,
        "alamat": alamat,
        "pekerjaan": pekerjaan,
        "unitkerja": unitkerja,
        "pangkatjabatan": pangkatjabatan,
        "data": data,
        "name": name,
        "filedata": filedata,
        "filename": filename,
      };
}
