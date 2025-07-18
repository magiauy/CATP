import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/home_controller.dart';
import '../../constants/colors.dart';
import '../../constants/app_constants.dart';
import '../widgets/custom_button.dart';
import '../../data/local_data_provider.dart';
import '../../models/user.dart';
import '../../utils/date_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  Map<String, dynamic> settings = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final usersData = await LocalDataProvider.loadUsers();
      final settingsData = await LocalDataProvider.loadSettings();

      setState(() {
        users = usersData.map((userData) => User.fromJson(userData)).toList();
        settings = settingsData;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Lỗi tải dữ liệu: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestFlutter Demo'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Consumer<HomeController>(
        builder: (context, controller, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Card
                Card(
                  elevation: 4,
                  color: AppColors.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ứng dụng demo sử dụng cấu trúc dự án Flutter',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Controller Demo Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Controller Demo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (controller.isLoading)
                          const Center(child: CircularProgressIndicator())
                        else
                          Column(
                            children: [
                              CustomButton(
                                text: 'Về màn hình đăng nhập',
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/login'),
                                backgroundColor: AppColors.warning,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Demo Alert & Toast',
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/alert-demo'),
                                backgroundColor: AppColors.info,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Chọn độ tuổi',
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  '/age-selection',
                                ),
                                backgroundColor: AppColors.warning,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Tải dữ liệu',
                                onPressed: () => controller.loadData(),
                                backgroundColor: AppColors.secondary,
                              ),
                              const SizedBox(height: 12),
                              CustomButton(
                                text: 'Đổi tiêu đề',
                                onPressed: () => controller.setTitle(
                                  'Tiêu đề mới - ${DateTime.now().millisecondsSinceEpoch}',
                                ),
                                backgroundColor: AppColors.primary,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Users List Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Danh sách Users (từ Mock Data)',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (users.isEmpty)
                          const Center(child: Text('Chưa có dữ liệu'))
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              final user = users[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 8),
                                color: AppColors.surfaceVariant,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: AppColors.primary,
                                    child: Text(
                                      user.name.substring(0, 1).toUpperCase(),
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    user.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user.email),
                                      Text(
                                        'Tạo: ${DateHelper.timeAgo(user.createdAt)}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    Icons.person,
                                    color: AppColors.primary,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Settings Section
                if (settings.isNotEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cài đặt ứng dụng',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSettingItem(
                            'Phiên bản',
                            settings['app_version'] ?? 'N/A',
                            Icons.info,
                          ),
                          _buildSettingItem(
                            'API Version',
                            settings['api_version'] ?? 'N/A',
                            Icons.api,
                          ),
                          _buildSettingItem(
                            'Chế độ bảo trì',
                            settings['maintenance_mode'] == true
                                ? 'Bật'
                                : 'Tắt',
                            Icons.build,
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                // Constants Demo Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Constants Demo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildConstantItem('Base URL', AppConstants.baseUrl),
                        _buildConstantItem(
                          'Timeout',
                          '${AppConstants.requestTimeout}s',
                        ),
                        _buildConstantItem(
                          'Items per page',
                          '${AppConstants.itemsPerPage}',
                        ),
                        _buildConstantItem(
                          'Default language',
                          AppConstants.defaultLanguage,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Color Palette Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Color Palette',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            _buildColorChip('Primary', AppColors.primary),
                            _buildColorChip('Secondary', AppColors.secondary),
                            _buildColorChip('Success', AppColors.success),
                            _buildColorChip('Error', AppColors.error),
                            _buildColorChip('Warning', AppColors.warning),
                            _buildColorChip('Info', AppColors.info),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingItem(String title, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Text(value, style: const TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildConstantItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Text(value, style: const TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildColorChip(String name, Color color) {
    return Chip(
      avatar: CircleAvatar(backgroundColor: color, radius: 12),
      label: Text(name),
      backgroundColor: AppColors.surfaceVariant,
    );
  }
}
