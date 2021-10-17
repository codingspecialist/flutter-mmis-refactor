
class ServerRespDto {
  final int code;
  final String msg;
  final dynamic data;

  ServerRespDto({required this.code, required this.msg, required this.data});

  ServerRespDto.fromJson(Map<String,dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
  
  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data" : data,
      };
}