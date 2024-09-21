class AuthToken {
  final String accessToken;
  final String tokenType;

  AuthToken({
    required this.accessToken,
    required this.tokenType,
  });

  // Factory constructor to create a model from JSON
  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
    );
  }

  // Method to convert the model into JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
    };
  }

  // Method to check if the token is expired (optional)
  bool isExpired() {
    // You might store the expiration time in the token and check it here
    // Example logic based on token expiry (this is not included in the example JSON).
    return false;  // Replace with actual expiration logic
  }
}
