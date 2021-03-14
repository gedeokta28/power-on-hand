class ApiResponseModel<T> {
  ApiResponseModel({
    this.status,
    this.data,
    this.errors,
    this.message,
  });

  int status;
  T errors;
  T data;
  String message;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) => ApiResponseModel(
        status: json["status"],
        message: json["message"] ?? "",
        data: json["data"] ?? "",
        errors: json["errors"] ?? "",
      );
}
