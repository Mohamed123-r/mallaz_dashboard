class DashboardStatsModel {
  final int totalUnits;
  final int rentedUnits;
  final int soldUnits;
  final int totalUsers;
  final int blockedUsers;

  DashboardStatsModel({
    required this.totalUnits,
    required this.rentedUnits,
    required this.soldUnits,
    required this.totalUsers,
    required this.blockedUsers,
  });

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) {
    return DashboardStatsModel(
      totalUnits: json['totalUnits'] ?? 0,
      rentedUnits: json['rentedUnits'] ?? 0,
      soldUnits: json['soldUnits'] ?? 0,
      totalUsers: json['totalUsers'] ?? 0,
      blockedUsers: json['blockedUsers'] ?? 0,
    );
  }
}

class DashboardStatsResponse {
  final bool success;
  final String message;
  final DashboardStatsModel data;

  DashboardStatsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DashboardStatsResponse.fromJson(Map<String, dynamic> json) {
    return DashboardStatsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: DashboardStatsModel.fromJson(json['data'] ?? {}),
    );
  }
}