# Herfagy App (herfagy_v2)

**Herfagy** is a Flutter-based application connecting **crafters** with customers who need various services such as electrical work, carpentry, plumbing, painting, air conditioning, and more. The app allows crafters to manage orders and track progress, while customers can request and monitor services seamlessly.

---

## 📌 Features

### For Customers
- **User Authentication**
  - Standard login/signup
  - Google Sign-In (`google_sign_in`, `google_sign_in_android`)
  - Facebook login (`flutter_facebook_auth`)
- **Place and Track Orders**
  - Send service requests with details and dates
  - Track order status: New, In Progress, Completed, Rejected
- **History & Records**
  - View previous orders with full details
- **Responsive UI**
  - Adaptive design for different screen sizes
- **Localization**
  - Multi-language support (Arabic/English) (`intl`, `flutter_localizations`)

### For Crafters
- **Dashboard**
  - Shows new requests, in-progress orders, and completed orders
- **Order Management**
  - Accept, reject, or mark orders as completed (`OrderCard`, `BottomSheetActionButtons`)
- **Progress Tracking**
  - Visual progress indicator (`percent_indicator`)
  - Tracks ratio of completed vs pending orders dynamically
- **Service Management**
  - Add, edit, or remove offered services (`CrafterServicesBuilder`)
- **Notifications**
  - Deep link handling for login and password reset (`app_links`, `shared_preferences`)

### Common Features
- **Animations**
  - Lottie animations for better UI feedback (`lottie`)
- **Rating System**
  - Users can rate completed services (`flutter_rating_bar`)
- **Media Handling**
  - Upload & display images (`cached_network_image`, `image_picker`, `photo_view`)
- **Offline Storage**
  - Cache important data (`shared_preferences`)
- **Permissions & Location**
  - Geolocation support for services (`geolocator`, `geocoding`)
  - Permission handling (`permission_handler`)
- **App Branding**
  - Custom launcher icons and adaptive icons (`flutter_launcher_icons`)
- **State Management**
  - Provider (`provider`) for reactive UI updates
  - Bloc (`flutter_bloc`) and GetIt (`get_it`) for future enhancements

---

## 🗂️ Project Structure

- **models/**: Data models (`Order`, `Service`, `Profile`)  
- **viewmodels/**: Business logic and state management  
  - `OrderOperationViewModel`  
  - `ProfileOperationViewModel`  
  - `ProgressProvider`  
- **views/**: UI components
  - **crafter/home_for_crafter/**: Crafter dashboard, progress, requests  
  - **user/home_for_user/**: Customer screens  
  - **shared widgets**: Buttons, progress bars, cards  
- **utils/**: Helpers (`localization_extension`, `size_config`, `get_order_status_extension`)  

---

## 🗃️ Database Tables

Below is the ER diagram / structure of the main tables used in Supabase:

![Database Tables](assets/images/database_tables.png)

> **How to add your image:**  
> 1. Place the ERD or table diagram in your project folder, e.g., `assets/images/database_tables.png`.  
> 2. Make sure the path exists in `pubspec.yaml` under `flutter/assets`. Example:  
> ```yaml
> flutter:
>   assets:
>     - assets/images/database_tables.png
> ```  
> 3. Use Markdown `![Alt Text](path/to/image.png)` to show it in README.

---

## ⚙️ How It Works

### Order Lifecycle
1. Customer sends a service request
2. Crafter sees it in **New Requests**
3. Crafter can:
   - Accept → Status becomes **In Progress**
   - Reject → Status becomes **Rejected**
4. Crafter completes work → Status becomes **Completed**
5. **Progress Indicator** updates automatically

### Progress Indicator
- Shows ratio of completed vs total orders for the crafter
- Updates dynamically when order status changes
- Uses `Selector` from Provider for efficient UI updates

### Deep Link Handling
- Listens for password reset links and OAuth callbacks
- Opens appropriate screens automatically
- Uses `app_links` and `shared_preferences` to handle links only once

---

## 🛠️ Dependencies

| Dependency | Purpose |
|------------|---------|
| provider | State management for orders, progress, and profiles |
| supabase_flutter | Backend database & authentication |
| flutter_bloc | Optional state management for future features |
| get_it | Dependency injection |
| intl | Localization and number/date formatting |
| flutter_localizations | Flutter localization support |
| lottie | Animations in UI |
| flutter_rating_bar | Ratings for services |
| app_links | Handling deep links |
| flutter_web_auth_2 | OAuth authentication |
| percent_indicator | Progress bars for crafters |
| shared_preferences | Local storage for flags like link handling |
| google_sign_in | Google authentication |
| flutter_facebook_auth | Facebook authentication |
| cached_network_image | Optimized image loading |
| image_picker | Picking images from gallery/camera |
| photo_view | Image zoom and display |
| geolocator / geocoding | Location-based features |
| permission_handler | Runtime permissions |
| flutter_launcher_icons | Custom launcher icon generation |

---

## 🔧 How to Run
1. Clone the repository:  
   ```bash
   git clone <repo-url>
