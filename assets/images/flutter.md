# Ngữ cảnh dự án và Công nghệ chính

Đây là một dự án phát triển ứng dụng di động sử dụng **Flutter**. Mục tiêu là xây dựng một ứng dụng có kiến trúc vững chắc, dễ bảo trì và mở rộng. Toàn bộ code được viết bằng ngôn ngữ **Dart**.

# Quy tắc và Nguyên tắc Code

## 1. Nguyên tắc SOLID

Luôn tuân thủ 5 nguyên tắc SOLID trong mọi gợi ý code:
- **Single Responsibility Principle (SRP)**: Mỗi class hoặc hàm chỉ nên chịu trách nhiệm cho một nhiệm vụ duy nhất.
- **Open/Closed Principle (OCP)**: Code nên dễ dàng mở rộng (thêm chức năng mới) nhưng không cần sửa đổi code hiện có. Ưu tiên sử dụng abstract class và interface.
- **Liskov Substitution Principle (LSP)**: Các class con có thể thay thế class cha của chúng mà không làm thay đổi tính đúng đắn của chương trình.
- **Interface Segregation Principle (ISP)**: Tạo ra các interface nhỏ, chuyên biệt thay vì một interface lớn và chung chung.
- **Dependency Inversion Principle (DIP)**: Các module cấp cao không nên phụ thuộc vào các module cấp thấp. Cả hai nên phụ thuộc vào abstraction (ví dụ: abstract class). Sử dụng Dependency Injection (DI) để quản lý các dependency.

## 2. Tái sử dụng Code và Widget

- **Ưu tiên tái sử dụng**: Trước khi tạo một widget mới, hãy kiểm tra xem đã có widget nào trong dự án có thể đáp ứng yêu cầu chưa. Luôn ưu tiên sử dụng lại các widget có sẵn.
- **Thiết kế widget có tính tái sử dụng cao**: Khi tạo widget mới, hãy thiết kế chúng một cách linh hoạt và có khả năng tùy biến cao. Tách riêng phần giao diện (UI) và logic. Tham số hóa các giá trị như màu sắc, văn bản, và các hàm callback để widget có thể được sử dụng ở nhiều nơi khác nhau.
    - **Ví dụ**: Thay vì hard-code `Text('Submit')`, hãy dùng `final String buttonText;` và truyền giá trị từ bên ngoài.

## 3. Quy tắc Thiết kế Giao diện (UI Design Rules)

- **Tuân thủ tuyệt đối yêu cầu input**: Code giao diện phải chính xác theo các yêu cầu được mô tả trong task, design, hoặc input đã cho. Điều này bao gồm màu sắc, font chữ, kích thước, khoảng cách (padding, margin), và bố cục.
- **Tách biệt UI và Logic**: Không viết logic xử lý nghiệp vụ (business logic) trực tiếp trong file UI (widget). Sử dụng các state management solution (như BLoC, Provider, Riverpod) để quản lý state và logic.
- **Sử dụng Theme của Flutter**: Tận dụng `ThemeData` để quản lý các thuộc tính chung như màu sắc, kiểu chữ, và style của button. Tránh hard-code giá trị màu sắc hoặc font chữ trực tiếp trong widget.
    - **Ví dụ**: Sử dụng `Theme.of(context).primaryColor` thay vì `Colors.blue`.
    - Sử dụng `Theme.of(context).textTheme.headline6` thay vì `TextStyle(fontSize: 20)`.

# Phong cách Phản hồi

- **Ngôn ngữ**: Luôn phản hồi và giải thích bằng **tiếng Việt**.
- **Chất lượng gợi ý**: Cung cấp các đoạn code hoàn chỉnh, sạch sẽ, và dễ đọc. Kèm theo giải thích ngắn gọn về lý do lựa chọn giải pháp đó nếu cần.
- **Tập trung vào giải pháp**: Khi được yêu cầu giải quyết một vấn đề, hãy đưa ra giải pháp trực tiếp và hiệu quả nhất theo các quy tắc đã nêu trên.