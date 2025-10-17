# FridgeMate - Phase 1 Sitemap
## Tính năng cơ bản offline 🏠

---

## **1. TRANG CHỦ / DASHBOARD**
```
📱 Home
├── 🧊 Tủ lạnh của tôi (số lượng sản phẩm)
├── ⏰ Sắp hết hạn (thông báo)
├── 🍽️ Gợi ý món hôm nay
└── 🛒 Danh sách mua sắm
```

---

## **2. QUẢN LÝ TỦ LẠNH**
```
🧊 Tủ lạnh
├── 📋 Danh sách sản phẩm
│   ├── 🔍 Tìm kiếm sản phẩm
│   ├── 🏷️ Lọc theo danh mục
│   │   ├── 🥩 Thịt
│   │   ├── 🐟 Cá
│   │   ├── 🥬 Rau quả
│   │   ├── 🧂 Gia vị
│   │   └── 🥫 Sản phẩm chế biến sẵn
│   └── 📊 Sắp xếp (hạn sử dụng, tên, ngày thêm)
│
├── ➕ Thêm sản phẩm mới
│   ├── 📝 Nhập thông tin thủ công
│   │   ├── Tên sản phẩm
│   │   ├── Danh mục
│   │   ├── Số lượng
│   │   ├── Đơn vị (kg, gói, hộp...)
│   │   ├── Ngày mua
│   │   ├── Hạn sử dụng
│   │   └── Ghi chú
│   └── 💡 Gợi ý thời gian bảo quản
│
├── ✏️ Chỉnh sửa sản phẩm
│   ├── Cập nhật thông tin
│   ├── Thay đổi số lượng
│   └── Gia hạn sử dụng
│
├── 🗑️ Xóa/Sử dụng hết sản phẩm
└── ⚠️ Cảnh báo hết hạn
    ├── Hôm nay
    ├── 3 ngày tới
    └── 1 tuần tới
```

---

## **3. THỰC ĐƠN & GỢI Ý**
```
🍽️ Thực đơn
├── 🤖 Gợi ý tự động
│   ├── Dựa trên nguyên liệu có sẵn
│   ├── Ưu tiên sản phẩm sắp hết hạn
│   └── Hiển thị % phù hợp nguyên liệu
│
├── 🔍 Tìm kiếm theo yêu cầu
│   ├── 🌅 Bữa sáng
│   ├── 🌞 Bữa trưa  
│   ├── 🌙 Bữa tối
│   ├── 🥗 Ăn chay
│   ├── 🏃‍♂️ Ít calo
│   ├── 👶 Cho trẻ em
│   └── 🍲 Món nước/Món khô
│
├── 💾 Thực đơn đã lưu
│   ├── ⭐ Yêu thích
│   ├── 📅 Lịch sử đã nấu
│   └── 📝 Ghi chú cá nhân
│
└── 📖 Chi tiết công thức
    ├── 🥘 Nguyên liệu cần thiết
    ├── 👨‍🍳 Cách chế biến
    ├── ⏱️ Thời gian nấu
    ├── 👥 Khẩu phần
    ├── ✅ Nguyên liệu có sẵn
    ├── ❌ Nguyên liệu cần mua
    └── 💾 Lưu vào yêu thích
```

---

## **4. MUA SẮM**
```
🛒 Mua sắm
├── 📝 Danh sách mua sắm
│   ├── ➕ Thêm sản phẩm thủ công
│   ├── 🍽️ Thêm từ thực đơn
│   └── 🤖 Gợi ý từ tủ lạnh (sản phẩm hết)
│
├── 🏷️ Phân loại danh sách
│   ├── 🥩 Thịt & Cá
│   ├── 🥬 Rau củ quả
│   ├── 🥛 Sữa & Trứng
│   ├── 🧂 Gia vị & Đồ khô
│   ├── 🥫 Đồ đóng hộp
│   └── 🧽 Đồ dùng khác
│
├── 💰 Quản lý ngân sách
│   ├── 💵 Ước tính giá
│   ├── 📊 Tổng chi phí dự kiến
│   ├── 💳 Ngân sách đặt ra
│   └── 📈 So sánh với lần mua trước
│
└── ✅ Đánh dấu đã mua
    ├── Tick từng sản phẩm
    ├── 💰 Nhập giá thực tế
    └── 🧊 Thêm vào tủ lạnh
```

---

## **5. CÀI ĐẶT & TIỆN ÍCH**
```
⚙️ Cài đặt
├── 🔔 Thông báo
│   ├── Bật/tắt nhắc nhở hết hạn
│   ├── Thời gian nhắc nhở (sáng/tối)
│   └── Số ngày cảnh báo trước
│
├── 🏠 Tùy chỉnh tủ lạnh
│   ├── Tên tủ lạnh
│   ├── Đơn vị mặc định
│   └── Danh mục tùy chỉnh
│
├── 📊 Thống kê
│   ├── Số sản phẩm hiện tại
│   ├── Sản phẩm đã sử dụng
│   ├── Sản phẩm bị hỏng/hết hạn
│   └── Tiết kiệm ước tính
│
├── 💾 Sao lưu dữ liệu
│   ├── Xuất dữ liệu (JSON/CSV)
│   ├── Nhập dữ liệu
│   └── Xóa toàn bộ dữ liệu
│
└── ℹ️ Thông tin ứng dụng
    ├── Phiên bản
    ├── Hướng dẫn sử dụng
    └── Liên hệ hỗ trợ
```

---

## **6. NAVIGATION FLOW**

### **Bottom Navigation (Chính)**
```
🏠 Trang chủ | 🧊 Tủ lạnh | 🍽️ Thực đơn | 🛒 Mua sắm | ⚙️ Cài đặt
```

### **Quick Actions (Floating Button)**
```
➕ Thêm nhanh
├── 🧊 Thêm vào tủ lạnh
├── 🍽️ Tìm công thức
└── 🛒 Thêm vào danh sách mua sắm
```

### **User Journey Examples**

**Journey 1: Thêm sản phẩm mới**
```
Trang chủ → Tủ lạnh → ➕ Thêm sản phẩm → Nhập thông tin → 💾 Lưu
```

**Journey 2: Tìm món ăn**
```
Trang chủ → Thực đơn → 🤖 Gợi ý tự động → Chọn món → Xem công thức → 🛒 Thêm nguyên liệu thiếu
```

**Journey 3: Đi chợ**
```
Trang chủ → Mua sắm → 📝 Xem danh sách → ✅ Đánh dấu đã mua → 🧊 Thêm vào tủ lạnh
```

---

## **7. TÍNH NĂNG ĐẶC BIỆT PHASE 1**

### **Offline First**
- ✅ Hoạt động hoàn toàn không cần internet
- ✅ Dữ liệu lưu trữ local (SQLite/IndexedDB)
- ✅ Thông báo local notifications

### **Smart Suggestions**
- ✅ Gợi ý thời gian bảo quản dựa trên loại thực phẩm
- ✅ Thực đơn thông minh dựa trên nguyên liệu có sẵn
- ✅ Ưu tiên sử dụng sản phẩm sắp hết hạn

### **User Experience**
- ✅ Interface đơn giản, dễ sử dụng
- ✅ Thao tác nhanh với các quick actions
- ✅ Phân loại rõ ràng theo nhóm thực phẩm
