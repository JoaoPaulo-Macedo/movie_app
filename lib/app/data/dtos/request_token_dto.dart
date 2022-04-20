class RequestTokenDTO {
  RequestTokenDTO({
    required this.success,
    required this.requestToken,
    required this.expiresAt,
  });

  final bool success;
  final String requestToken;
  final String expiresAt;

  factory RequestTokenDTO.fromJson(Map<String, dynamic> json) {
    return RequestTokenDTO(
      success: json['success'],
      requestToken: json['request_token'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() => {'request_token': requestToken};

  @override
  String toString() => 'RequestTokenDTO(success: $success, requestToken: $requestToken, expiresAt: $expiresAt)';
}
