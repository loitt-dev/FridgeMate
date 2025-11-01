import 'package:flutter/material.dart';

/// FridgeMate icon system
///
/// This class defines all icons used throughout the FridgeMate app
/// for consistent iconography and visual communication.
class AppIcons {
  // Storage icons
  static const IconData fridge = Icons.kitchen;
  static const IconData medicine = Icons.medication;
  static const IconData addItem = Icons.add_circle;
  static const IconData editItem = Icons.edit;
  static const IconData deleteItem = Icons.delete;
  static const IconData search = Icons.search;
  static const IconData filter = Icons.filter_list;
  static const IconData sort = Icons.sort;

  // Category icons
  static const IconData meat = Icons.restaurant;
  static const IconData vegetable = Icons.eco;
  static const IconData fruit = Icons.apple;
  static const IconData dairy = Icons.local_drink;
  static const IconData grain = Icons.grain;
  static const IconData spice = Icons.spa;
  static const IconData beverage = Icons.local_bar;
  static const IconData snack = Icons.cookie;

  // Recipe icons
  static const IconData recipe = Icons.menu_book;
  static const IconData cooking = Icons.restaurant_menu;
  static const IconData timer = Icons.timer;
  static const IconData servings = Icons.people;
  static const IconData favorite = Icons.favorite;
  static const IconData share = Icons.share;
  static const IconData rating = Icons.star;

  // Shopping icons
  static const IconData shopping = Icons.shopping_cart;
  static const IconData shoppingList = Icons.list;
  static const IconData budget = Icons.account_balance_wallet;
  static const IconData price = Icons.attach_money;
  static const IconData store = Icons.store;
  static const IconData delivery = Icons.local_shipping;

  // User icons
  static const IconData user = Icons.person;
  static const IconData profile = Icons.account_circle;
  static const IconData settings = Icons.settings;
  static const IconData logout = Icons.logout;
  static const IconData login = Icons.login;
  static const IconData register = Icons.person_add;

  // Social icons
  static const IconData post = Icons.post_add;
  static const IconData comment = Icons.comment;
  static const IconData like = Icons.thumb_up;
  static const IconData follow = Icons.person_add;
  static const IconData challenge = Icons.emoji_events;
  static const IconData achievement = Icons.military_tech;

  // AI icons
  static const IconData camera = Icons.camera_alt;
  static const IconData barcode = Icons.qr_code_scanner;
  static const IconData ai = Icons.psychology;
  static const IconData chat = Icons.chat;

  // Notification icons
  static const IconData notification = Icons.notifications;
  static const IconData expiry = Icons.warning;
  static const IconData reminder = Icons.alarm;

  // Navigation icons
  static const IconData home = Icons.home;
  static const IconData dashboard = Icons.dashboard;
  static const IconData menu = Icons.menu;
  static const IconData back = Icons.arrow_back;
  static const IconData forward = Icons.arrow_forward;
  static const IconData up = Icons.keyboard_arrow_up;
  static const IconData down = Icons.keyboard_arrow_down;

  // Action icons
  static const IconData add = Icons.add;
  static const IconData remove = Icons.remove;
  static const IconData edit = Icons.edit;
  static const IconData delete = Icons.delete;
  static const IconData save = Icons.save;
  static const IconData cancel = Icons.cancel;
  static const IconData confirm = Icons.check;
  static const IconData close = Icons.close;

  // Status icons
  static const IconData success = Icons.check_circle;
  static const IconData error = Icons.error;
  static const IconData warning = Icons.warning;
  static const IconData info = Icons.info;
  static const IconData loading = Icons.hourglass_empty;

  // Media icons
  static const IconData image = Icons.image;
  static const IconData video = Icons.videocam;
  static const IconData audio = Icons.audiotrack;
  static const IconData file = Icons.attach_file;

  // Time icons
  static const IconData calendar = Icons.calendar_today;
  static const IconData clock = Icons.access_time;
  static const IconData date = Icons.date_range;
  static const IconData time = Icons.schedule;

  // Location icons
  static const IconData location = Icons.location_on;
  static const IconData map = Icons.map;
  static const IconData gps = Icons.gps_fixed;

  // Communication icons
  static const IconData email = Icons.email;
  static const IconData phone = Icons.phone;
  static const IconData message = Icons.message;
  static const IconData call = Icons.call;

  // System icons
  static const IconData refresh = Icons.refresh;
  static const IconData sync = Icons.sync;
  static const IconData download = Icons.download;
  static const IconData upload = Icons.upload;
  static const IconData cloud = Icons.cloud;
  static const IconData wifi = Icons.wifi;
  static const IconData bluetooth = Icons.bluetooth;

  // ============================================
  // FRIDGEMATE SPECIFIC ICONS
  // ============================================

  // Expiry and freshness
  static const IconData expirySchedule = Icons.schedule;
  static const IconData expiryWarning = Icons.warning_amber;
  static const IconData expiryCritical = Icons.error_outline;
  static const IconData fresh = Icons.check_circle;
  static const IconData spoiled = Icons.cancel;

  // Quantity and measurement
  static const IconData quantity = Icons.scale;
  static const IconData weight = Icons.monitor_weight;
  static const IconData volume = Icons.local_drink;
  static const IconData pieces = Icons.looks_one;
  static const IconData grams = Icons.grain;
  static const IconData kilograms = Icons.scale;
  static const IconData liters = Icons.local_drink;
  static const IconData milliliters = Icons.water_drop;

  // Storage locations
  static const IconData freezer = Icons.ac_unit;
  static const IconData refrigerator = Icons.kitchen;
  static const IconData pantry = Icons.store;
  static const IconData counter = Icons.countertops;
  static const IconData cabinet = Icons.kitchen;
  static const IconData medicineCabinet = Icons.medication;

  // Food preparation
  static const IconData prep = Icons.restaurant_menu;
  static const IconData cookingMethod = Icons.local_fire_department;
  static const IconData baking = Icons.cake;
  static const IconData grilling = Icons.outdoor_grill;
  static const IconData frying = Icons.whatshot;
  static const IconData boiling = Icons.water;
  static const IconData steaming = Icons.air;

  // Nutrition and health
  static const IconData nutrition = Icons.eco;
  static const IconData calories = Icons.local_fire_department;
  static const IconData protein = Icons.fitness_center;
  static const IconData carbs = Icons.grain;
  static const IconData fat = Icons.opacity;
  static const IconData fiber = Icons.eco;
  static const IconData vitamins = Icons.medication;
  static const IconData minerals = Icons.diamond;

  // Shopping and purchasing
  static const IconData priceTag = Icons.attach_money;
  static const IconData discount = Icons.local_offer;
  static const IconData sale = Icons.sell;
  static const IconData coupon = Icons.receipt;
  static const IconData receipt = Icons.receipt_long;
  static const IconData barcodeScan = Icons.qr_code;
  static const IconData qrCode = Icons.qr_code_scanner;

  // Meal planning
  static const IconData mealPlan = Icons.calendar_month;
  static const IconData breakfast = Icons.wb_sunny;
  static const IconData lunch = Icons.wb_sunny_outlined;
  static const IconData dinner = Icons.nights_stay;
  static const IconData snackTime = Icons.cookie;
  static const IconData dessert = Icons.cake;

  // Family and sharing
  static const IconData family = Icons.family_restroom;
  static const IconData shareContent = Icons.share;
  static const IconData invite = Icons.person_add;
  static const IconData group = Icons.group;
  static const IconData userProfile = Icons.person;
  static const IconData avatar = Icons.account_circle;

  // Analytics and insights
  static const IconData analytics = Icons.analytics;
  static const IconData chart = Icons.bar_chart;
  static const IconData graph = Icons.show_chart;
  static const IconData trend = Icons.trending_up;
  static const IconData report = Icons.assessment;
  static const IconData insights = Icons.lightbulb;

  // Settings and preferences
  static const IconData preferences = Icons.tune;
  static const IconData theme = Icons.palette;
  static const IconData language = Icons.language;
  static const IconData notifications = Icons.notifications_active;
  static const IconData privacy = Icons.privacy_tip;
  static const IconData security = Icons.security;

  // Help and support
  static const IconData help = Icons.help_outline;
  static const IconData support = Icons.support_agent;
  static const IconData feedback = Icons.feedback;
  static const IconData bug = Icons.bug_report;
  static const IconData feature = Icons.star;
  static const IconData tutorial = Icons.school;

  // Accessibility
  static const IconData accessibility = Icons.accessibility;
  static const IconData highContrast = Icons.contrast;
  static const IconData largeText = Icons.text_increase;
  static const IconData voiceOver = Icons.record_voice_over;
  static const IconData screenReader = Icons.visibility_off;
}
