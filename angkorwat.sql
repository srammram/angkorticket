-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2020 at 02:36 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `angkorwat`
--

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_api_logs`
--

CREATE TABLE `angkorwat_api_logs` (
  `id` bigint(20) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `authorized` varchar(255) NOT NULL,
  `is_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_countries`
--

CREATE TABLE `angkorwat_countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `phonecode` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `continent_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `is_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_countries`
--

INSERT INTO `angkorwat_countries` (`id`, `name`, `code`, `phonecode`, `flag`, `continent_id`, `status`, `is_delete`, `is_country`) VALUES
(1, 'India', '', '91', 'flag/df2aa8ca8094a8e28a6aae90c00b76e2.jpg', 1, 1, 0, ''),
(2, 'Pakistan', '', '92', 'flag/810bae568d2e89ebada4d0950c8d7c99.jpg', 1, 0, 0, ''),
(3, 'South Africa', '', '123', 'flag/cea0ce8f70ec99d52a94d0a34511637b.jpg', 2, 0, 0, ''),
(4, 'Cambodia', '', '855', 'flag/cbe823808f1872aace7ce4102cbc5f11.jpg', 1, 1, 0, ''),
(5, 'America', '', '44', 'flag/47c9cd079e8de7b78a6bdea27d4102dd.jpg', 4, 1, 0, ''),
(6, 'Bahrain', '', '+973', 'flag/4f6772b2909edf3e7d64c92a51b0af6a.png', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_date_format`
--

CREATE TABLE `angkorwat_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  `is_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `angkorwat_date_format`
--

INSERT INTO `angkorwat_date_format` (`id`, `js`, `php`, `sql`, `is_country`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y', ''),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y', ''),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y', ''),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y', ''),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y', ''),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y', '');

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_groups`
--

CREATE TABLE `angkorwat_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `is_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_groups`
--

INSERT INTO `angkorwat_groups` (`id`, `name`, `description`, `is_delete`, `is_country`) VALUES
(1, 'owner', 'Owner', 0, ''),
(2, 'admin', 'Admin', 0, ''),
(3, 'customer', 'Customer', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_notification`
--

CREATE TABLE `angkorwat_notification` (
  `id` int(11) NOT NULL,
  `user_type` tinyint(4) NOT NULL COMMENT '1-Customer, 2-Driver, 3-Owner',
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `is_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_sessions`
--

CREATE TABLE `angkorwat_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_settings`
--

CREATE TABLE `angkorwat_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `timezone_gmt` varchar(255) NOT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `srampos_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,6) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,6) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `dine_in` tinyint(1) NOT NULL,
  `take_away` tinyint(1) NOT NULL,
  `door_delivery` tinyint(1) NOT NULL,
  `first_level` bigint(20) NOT NULL,
  `second_level` bigint(20) NOT NULL,
  `qsr` tinyint(4) NOT NULL,
  `customer_discount_request` tinyint(1) NOT NULL,
  `nagative_stock_production` tinyint(1) NOT NULL,
  `excel_header_color` varchar(7) NOT NULL,
  `excel_footer_color` varchar(7) NOT NULL,
  `installed_date` datetime NOT NULL,
  `billnumber_reset` int(11) NOT NULL DEFAULT '0' COMMENT '0-none,1-daily,2-weekly,3-monthly',
  `recipe_time_management` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-OFF,1- ON',
  `default_preparation_time` int(11) NOT NULL,
  `night_audit_rights` tinyint(1) NOT NULL,
  `driver_ride_accept` tinyint(4) NOT NULL,
  `search_kilometer` bigint(20) NOT NULL DEFAULT '5',
  `support_email` varchar(255) NOT NULL,
  `support_mobile` varchar(255) NOT NULL,
  `support_whatsapp` varchar(255) NOT NULL,
  `camera_enable` tinyint(4) NOT NULL,
  `outstation_min_kilometer` int(11) NOT NULL DEFAULT '50',
  `cityride_max_kilometer` varchar(255) NOT NULL DEFAULT '50',
  `rental_max_kilometer` varchar(255) NOT NULL DEFAULT '50',
  `due_month` int(11) NOT NULL,
  `due_year` int(11) NOT NULL,
  `driver_admin_payment_option` tinyint(4) NOT NULL COMMENT '1-Day, 2-Week, 3-Month',
  `driver_admin_payment_percentage` int(11) NOT NULL,
  `vendor_admin_payment_option` tinyint(4) NOT NULL COMMENT '1-Day, 2-Week, 3-Month',
  `vendor_admin_payment_percentage` int(11) NOT NULL,
  `driver_vendor_payment_option` tinyint(4) NOT NULL COMMENT '1-Day, 2-Week, 3-Month',
  `driver_vendor_payment_percentage` int(11) NOT NULL,
  `driver_admin_payment_duration` int(11) NOT NULL,
  `vendor_admin_payment_duration` int(11) NOT NULL,
  `driver_vendor_payment_duration` int(11) NOT NULL,
  `waiting_charges` decimal(10,2) NOT NULL,
  `waiting_time` varchar(255) NOT NULL,
  `help_number_one` varchar(255) NOT NULL,
  `help_number_two` varchar(255) NOT NULL,
  `help_number_three` varchar(255) NOT NULL,
  `help_number_four` varchar(255) NOT NULL,
  `help_number_five` varchar(255) NOT NULL,
  `login_otp_enable` tinyint(4) NOT NULL,
  `device_change_otp_enable` tinyint(4) NOT NULL,
  `ride_otp_enable` tinyint(4) NOT NULL,
  `address_enable` tinyint(4) NOT NULL,
  `account_holder_name_enable` tinyint(4) NOT NULL,
  `bank_name_enable` tinyint(4) NOT NULL,
  `branch_name_enable` tinyint(4) NOT NULL,
  `ifsc_code_enable` tinyint(4) NOT NULL,
  `aadhaar_enable` tinyint(4) NOT NULL,
  `pancard_enable` tinyint(4) NOT NULL,
  `license_enable` tinyint(4) NOT NULL,
  `police_enable` tinyint(4) NOT NULL,
  `loan_enable` tinyint(4) NOT NULL,
  `vendor_enable` tinyint(4) NOT NULL,
  `cab_registration_enable` tinyint(4) NOT NULL,
  `taxation_enable` tinyint(4) NOT NULL,
  `insurance_enable` tinyint(4) NOT NULL,
  `permit_enable` tinyint(4) NOT NULL,
  `authorisation_enable` tinyint(4) NOT NULL,
  `fitness_enable` tinyint(4) NOT NULL,
  `speed_enable` tinyint(4) NOT NULL,
  `puc_enable` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `angkorwat_settings`
--

INSERT INTO `angkorwat_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `timezone_gmt`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `srampos_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `dine_in`, `take_away`, `door_delivery`, `first_level`, `second_level`, `qsr`, `customer_discount_request`, `nagative_stock_production`, `excel_header_color`, `excel_footer_color`, `installed_date`, `billnumber_reset`, `recipe_time_management`, `default_preparation_time`, `night_audit_rights`, `driver_ride_accept`, `search_kilometer`, `support_email`, `support_mobile`, `support_whatsapp`, `camera_enable`, `outstation_min_kilometer`, `cityride_max_kilometer`, `rental_max_kilometer`, `due_month`, `due_year`, `driver_admin_payment_option`, `driver_admin_payment_percentage`, `vendor_admin_payment_option`, `vendor_admin_payment_percentage`, `driver_vendor_payment_option`, `driver_vendor_payment_percentage`, `driver_admin_payment_duration`, `vendor_admin_payment_duration`, `driver_vendor_payment_duration`, `waiting_charges`, `waiting_time`, `help_number_one`, `help_number_two`, `help_number_three`, `help_number_four`, `help_number_five`, `login_otp_enable`, `device_change_otp_enable`, `ride_otp_enable`, `address_enable`, `account_holder_name_enable`, `bank_name_enable`, `branch_name_enable`, `ifsc_code_enable`, `aadhaar_enable`, `pancard_enable`, `license_enable`, `police_enable`, `loan_enable`, `vendor_enable`, `cab_registration_enable`, `taxation_enable`, `insurance_enable`, `permit_enable`, `authorisation_enable`, `fitness_enable`, `speed_enable`, `puc_enable`) VALUES
(1, 'logo2.png', 'logo3.png', 'K-App', 'english', 1, 2, '2', 1, 25, '3.2.10', 1, 4, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 1, 1, 0, 'Asia/Kolkata', '', 800, 800, 150, 150, 0, 0, 1, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@srampos.comg', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'info@suki.com', 0, 4, 1, 0, 3, 0, 0, 1, 2, 2, '.', ',', 0, 12, 'bspsk1234', '465ef3e6-dc77-42b7-b309-41cc68fd3e78', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '$', 0, '_', 0, 1, 1, 'POP', 90, '', 0, 1, 'AN', 'dompdf', 1, 1, 1, 7, 5, 0, 1, 0, 'd28f16', 'ffc000', '2018-03-01 00:00:00', 0, 1, 10, 0, 1, 1000, 'admin@heycab', '1234567890', '12345567890', 0, 50, '50', '50', 6, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0.00', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_sms_templates`
--

CREATE TABLE `angkorwat_sms_templates` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sms_content` text NOT NULL,
  `sms_variables` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `user_type` enum('driver','customer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_sms_templates`
--

INSERT INTO `angkorwat_sms_templates` (`id`, `unique_id`, `name`, `sms_content`, `sms_variables`, `status`, `sender`, `created_on`, `user_type`) VALUES
(1, 'ride-booking-confirmation', 'Ride Booking confirmation', 'Dear [CUSTOMERNAME], Ride booking accepted. driver name : [DRIVERNAME], driver number : [DRIVERNUMBER],  cab number : [CABNUMBER]', '[CUSTOMERNAME], [DRIVERNAME], [DRIVERNUMBER], [CABNUMBER]', 1, '', '2018-06-13 12:22:25', 'customer'),
(2, 'cab-arrival-notification', 'Cab Arrival notification', '<p>Cab Arrival notification</p>', '', 1, '', '2018-06-13 12:22:48', 'customer'),
(3, 'payment-amount-after-completion-of-ride', 'Payment amount after completion of ride', '<p>Payment amount after completion of ride</p>', '', 1, '', '2018-06-13 12:23:04', 'customer'),
(4, 'booking-update', 'Booking update', '<p>Booking update</p>', '', 1, '', '2018-06-13 12:23:17', 'customer'),
(5, 'promotions-offers', 'Promotions & Offers', '<p>Promotions & Offers</p>', '', 1, '', '2018-06-13 12:24:11', 'customer'),
(6, 'reset-password', 'Reset Password', '<p>Reset Password</p>', '', 1, '', '2018-06-13 12:24:36', 'customer'),
(7, 'trip-invoice', 'Trip Invoice', '<p>Trip Invoice</p>', '', 1, '', '2018-06-13 12:25:19', 'customer'),
(8, 'new-booking-for-acceptance', 'New Booking for acceptance', '<p>New Booking for acceptance</p>', '', 1, '', '2018-06-13 12:32:21', 'driver'),
(9, 'driver-profile-update', 'Driver Profile update', '<p>Driver Profile update</p>', '', 1, '', '2018-06-13 12:32:43', 'driver'),
(10, 'trip-invoice-details', 'Trip Invoice Details', '<p>Trip Invoice Details</p>', '', 1, '', '2018-06-13 12:33:04', 'driver'),
(11, 'withdrawal-money-request', 'Withdrawal Money Request', '<p>Withdrawal Money Request</p>', '', 1, '', '2018-06-13 12:33:18', 'driver'),
(12, 'manual-booking-details', 'Manual Booking Details', '<p>Manual Booking Details</p>', '', 1, '', '2018-06-13 12:33:30', 'customer'),
(13, 'reset-password', 'Reset Password', '<p>Reset Password</p>', '', 1, '', '2018-06-13 12:46:45', 'driver'),
(14, 'user-mobile-active', 'Customer Mobile Active', 'Please use OTP : [MOBILE_OTP] for activation', '[MOBILE_OTP], [PHONE], [COUNTRY_CODE]', 1, '', '2018-08-22 00:00:00', 'customer'),
(15, 'ride-complete', 'Ride Complete', 'Ride Complete. Your payment amount : [AMOUNT]', '[AMOUNT]', 1, '', '2018-06-13 12:23:04', 'customer'),
(16, 'ride-mobile-active', 'Ride Mobile Active', 'Please use OTP : [MOBILE_OTP] for your ride.', '[MOBILE_OTP], [PHONE], [COUNTRY_CODE]', 1, '', '2018-08-22 00:00:00', 'customer'),
(17, 'driver-approved', 'Driver Approved', 'Dear [DRIVERNAME], admin has been accepted your account. Mobile : [DRIVERNUMBER], Pass : [DRIVERPASS]', '[DRIVERNAME], [DRIVERNUMBER], [DRIVERPASS]', 1, '', '2018-06-13 12:22:25', 'driver'),
(18, 'allocated-driver', 'Allocated Driver', 'This[DRIVERNAME], has been allocated to taxi[TAXINUMBER]', '[DRIVERNAME], [TAXINUMBER]', 1, '', '2018-06-13 12:22:25', 'driver'),
(19, 'allocated-driver-close', 'Allocated Driver Close', 'This[DRIVERNAME], has been allocated to taxi[TAXINUMBER] in Closed.', '[DRIVERNAME], [TAXINUMBER]', 1, '', '2018-06-13 12:22:25', 'driver'),
(20, 'sos', 'SOS', '[MSG]', '[MSG]', 1, '', '2018-06-13 12:22:25', 'customer'),
(21, 'ride-later', 'Ride Later', 'Dear [SMSMESSAGE]', '[SMSMESSAGE]', 1, '', '2018-06-13 12:22:25', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_users`
--

CREATE TABLE `angkorwat_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `register_type` tinyint(4) NOT NULL COMMENT '0-Website, 1-Android, 2-IOS',
  `login_type` tinyint(4) NOT NULL COMMENT '0-Direct Login, 1-Facebook, 2-Twitter, 3-Google',
  `login_key` text NOT NULL,
  `join_type` tinyint(4) NOT NULL COMMENT '0- Create Backend, 1-Basic Create APP, 2-Fully Create APP',
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `oauth_token` text NOT NULL,
  `devices_imei` text NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `gender` varchar(255) NOT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `text_password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pincode` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `ref_mobile` varchar(255) NOT NULL,
  `ref_driver` varchar(255) NOT NULL,
  `mobile_otp` varchar(255) DEFAULT NULL,
  `mobile_otp_verify` tinyint(4) NOT NULL,
  `forgot_otp` varchar(255) DEFAULT NULL,
  `forgot_otp_verify` tinyint(4) NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `is_daily` tinyint(4) NOT NULL,
  `is_rental` tinyint(4) NOT NULL,
  `is_outstation` tinyint(4) NOT NULL,
  `is_hiring` tinyint(4) NOT NULL,
  `is_corporate` tinyint(4) NOT NULL,
  `mode` tinyint(4) NOT NULL COMMENT '0-Offline, 1-Available, 2-Booked, 3-Ride ',
  `current_latitude` varchar(200) NOT NULL,
  `current_longitude` varchar(200) NOT NULL,
  `base_location` varchar(255) NOT NULL,
  `base_area_lat` varchar(255) NOT NULL,
  `base_area_lng` varchar(255) NOT NULL,
  `prefered_area_lat` varchar(255) NOT NULL,
  `prefered_area_lng` varchar(255) NOT NULL,
  `is_approved` tinyint(4) NOT NULL COMMENT '0-process, 1-approved, 2-not approved',
  `approved_by` int(11) NOT NULL,
  `approved_on` datetime NOT NULL,
  `is_edit` tinyint(4) NOT NULL,
  `created_type` tinyint(4) NOT NULL COMMENT '0-System, 1-APP',
  `complete_user` tinyint(4) NOT NULL,
  `driver_payment_status` tinyint(4) NOT NULL COMMENT '0-Active, 1-Payment Duration, 2-Account Expiry',
  `is_connected` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `angkorwat_users`
--

INSERT INTO `angkorwat_users` (`id`, `register_type`, `login_type`, `login_key`, `join_type`, `last_ip_address`, `ip_address`, `oauth_token`, `devices_imei`, `username`, `first_name`, `last_name`, `photo`, `gender`, `dob`, `code`, `password`, `text_password`, `email`, `pincode`, `country_code`, `mobile`, `ref_mobile`, `ref_driver`, `mobile_otp`, `mobile_otp_verify`, `forgot_otp`, `forgot_otp_verify`, `last_login`, `active`, `group_id`, `parent_type`, `parent_id`, `created_by`, `created_on`, `updated_on`, `is_daily`, `is_rental`, `is_outstation`, `is_hiring`, `is_corporate`, `mode`, `current_latitude`, `current_longitude`, `base_location`, `base_area_lat`, `base_area_lng`, `prefered_area_lat`, `prefered_area_lng`, `is_approved`, `approved_by`, `approved_on`, `is_edit`, `created_type`, `complete_user`, `driver_payment_status`, `is_connected`, `is_delete`) VALUES
(1, 0, 0, '', 0, 0x3138332e38322e33342e3237, '', 'owner', '', 'owner', 'owner', '', '', '', '0000-00-00', '', 'owner', '123456', 'owner@srammram.com', '', '91', '12345', '', '', NULL, 0, NULL, 0, 1557474013, 1, 1, NULL, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(2, 0, 0, '', 0, 0x3138332e38322e33342e3237, '', 'admin', '', 'admin', 'admin', '', '', '', '0000-00-00', '', 'admin', '123456', 'admin@srammram.com', '', '91', '1234567890', '', '', NULL, 0, NULL, 0, 1563013115, 1, 2, '1', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(7, 0, 0, '', 0, NULL, '', 'oLtzOh78rVNyd30nqQYl4u5BCKjJ1pM9', '', 'EMP00007', 'EMP00007', '', '', '', '0000-00-00', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test@gmail.com', '', '91', '123123123', '', '', '754103', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-01-23 16:13:40', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-01-23 16:14:29', 1, 0, 0, 0, 0, 0),
(8, 0, 0, '', 0, NULL, '', 'HPq1sg3BmpGYLej6nvixDufbc9FQVMT8', '', 'EMP00008', 'EMP00008', '', '', '', '0000-00-00', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test@gmail.com', '', '91', '321321321', '', '', '562301', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-01-23 16:16:40', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-01-23 16:17:21', 1, 0, 0, 0, 0, 0),
(9, 0, 0, '', 0, NULL, '', 'DLmOJsTItdu93aio4zCY7wjXKvlUQSpq', '', 'EMP00009', 'EMP00009', '', '', '', '0000-00-00', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'test@gmail.com', '', '', '132132132', '', '', '705936', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-01-23 16:18:24', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-01-23 16:20:03', 1, 0, 0, 0, 0, 0),
(228, 0, 0, '', 0, NULL, '', 'H6DSZNBIC0tKPrWxnRgAYmkupFaiQL35', '', 't', 'Test Global', 'Global', 'user/employee/9b133ce84d37174417a590911e29f9f4.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'test@gdfg.gfgdgd', '', '91', '1234567891', '', '', '429187', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 14:38:06', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:11:12', 1, 0, 1, 0, 0, 0),
(229, 0, 0, '', 0, NULL, '', 'Lh1VKF8UCtvYl6dc2xyPoJjEs5mHfW3A', '', 'r', 'Test Country', 'Country', 'user/employee/48f41803a684191baaa904e41c16bdc9.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'sfdsfs@gh.fghfgh', '', '91', '1234567892', '', '', '236054', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 14:39:38', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:16:02', 1, 0, 1, 0, 0, 0),
(230, 0, 0, '', 0, NULL, '', 'cXKt6EhNFsekbTZdMWHCojf7gYUDlam4', '', 'e', 'Test Zonal', 'Zonal', 'user/employee/36cc5f0b9ebbde41dda2b0dc7b794e46.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'dfdsf@gfg.gdfg', '', '91', '1234567893', '', '', '872653', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 14:41:17', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:10:38', 1, 0, 1, 0, 0, 0),
(231, 0, 0, '', 0, NULL, '', 'BawDbinT5OIHj78XzhErlcfq2YyVRCsA', '', 'y', 'Test ', 'Ada', 'user/employee/e4dcfdafd213e006f8ed1b236e59d5b7.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'gs@dh.fhfhf', '', '91', '1234567895', '', '', '917482', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 15:43:04', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:16:40', 1, 0, 1, 0, 0, 0),
(232, 0, 0, '', 0, NULL, '', 'ahKsL2wgMSHOIUmZuVvxyXJn5fiA9dG6', '', 'w', 'Test city', 'City', 'user/employee/187b7230552f59d2af1513866740fdd0.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'gfdgdg@gg.fgh', '', '91', '1234567896', '', '', '827369', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 16:02:57', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:16:11', 1, 0, 1, 0, 0, 0),
(233, 0, 0, '', 0, NULL, '', 'ZRU7ygT8xjw5sPFXVqA4hmtevMOD139S', '', 'q', 'Test city', 'C', 'user/employee/06c5676824d00488077926caf56c49f8.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'fsds@dgdfg.fhgf', '', '91', '1234567897', '', '', '215460', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 16:05:04', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:16:20', 1, 0, 1, 0, 0, 0),
(234, 0, 0, '', 0, NULL, '', 'Nb8TkR0al27hAvMiWUyzcxJqm3CZoKVn', '', 'u', 'Test area', 'Area', 'user/employee/e4516c7ef65375d7ad6d636798adaa6a.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'sadsad@gd.fghgfh', '', '91', '1234567898', '', '', '137054', 0, NULL, 0, NULL, 1, 6, '2', 2, 2, '2019-06-01 16:08:40', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:16:30', 1, 0, 1, 0, 0, 0),
(235, 0, 0, '', 0, 0x3a3a31, '', 'pOyuPaMTbzZiHsLYlXfJcREqh1DxmGNn', '', 'i', 'Test operator', 'P', 'user/employee/a6c8ee3ea1941373ae386f8ddb1ac948.jpg', 'male', '01/06/2019', '', '25d55ad283aa400af464c76d713c07ad', '12345678', 'gfgd@gdg.dgfdg', '', '91', '1234567899', '', '', '963752', 0, NULL, 0, 1559390682, 1, 6, '2', 2, 2, '2019-06-01 16:10:23', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-01 16:10:45', 1, 0, 1, 0, 0, 0),
(259, 0, 0, '', 2, NULL, '', '2WN7ZQMBC5DLisveKr3q4ljkdE0tnS68', '358345088106890', '0442000259', 'Kerry', 'Musgrave ', '', 'male', '23/05/1972', '', 'c2da08746d575b8a1462f75102bb0630', 'heyycab', 'kerrydmusgrave@gmail.com', '', '44', '7733439686', '', '', '174359', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-05-23 16:19:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-05-23 16:52:46', 1, 0, 1, 0, 0, 0),
(260, 0, 0, '', 0, NULL, '', 'BX1Y7n5jdJNIeMZyAr9Ffwvtp20s4OGi', '358345088106890', '0912000260', 'Mani', 'tett', 'user/driver/4890e57ef8a26d7d2ff1a9aec8c53d66.jpeg', 'male', '01/05/2019', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'Test@gmail.com', '', '91', '7010279986', 'DRI12345', 'DRI54321', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-05-23 17:06:05', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', 'Kalyani Nagar', '18.5463286', '73.9033139', '', '', 1, 2, '2019-05-27 20:26:08', 1, 0, 1, 0, 0, 0),
(261, 0, 0, '', 0, NULL, '', 'BiTeSW1VgXN64pDwcQaUMFyYRrqu83HE', '358345088106890', '0911000261', 'mani', 'Vendhan ', '', '', '23/5/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '8973725802', '', '', '0', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-05-23 17:10:18', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(262, 0, 0, '', 2, NULL, '', '30UOfZX5JcVNpYBGaq7lET6hxAtvs9oe', '865959031283204', '0912000262', 'Ananthan', 'a', '', 'male', '26/05/2004', '', 'c33367701511b4f6020ec61ded352059', '654321', 'ananthan18.02.1991@gmail.com', '', '91', '9600619919', '5', '', '813270', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-05-23 17:26:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 1, '', '', '0', '', '', '', '', 1, 2, '2019-06-05 10:58:37', 1, 0, 1, 0, 0, 0),
(263, 0, 0, '', 2, NULL, '', 'u3Ll9MysbeDiAFc87pZmEvx2rNjhYXBR', '356477081759094', '0912000263', 'assss', 'ssdccc', '', 'Male', '07/05/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'markets.watch@yandex.com', '', '91', '9600305964', '9600305964', 'DRI20190527212838', '514280', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-05-27 21:28:38', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(264, 0, 0, '', 0, NULL, '', 'hQjzw6PuJi9I3gcTEOoBFSvMkUZ0eyxfXXX', '358345088106891', '1234567890', 'Default Customer', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234567890', '', '', '123456', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(265, 0, 0, '', 2, NULL, '', '5432154321', '358345088106892', '5432154321', 'Default Driver', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '5432154321', '', '', '123456', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 1, '', '', '0', '', '', '', '', 1, 2, '2019-04-13 14:01:36', 1, 0, 1, 0, 0, 0),
(266, 0, 0, '', 2, NULL, '', 'EBulpCw4RXHa7ye30nWU5GZKxcM1idos', '356261106899121', '0442000266', 'Ashley ', 'Musgrave ', 'user/driver/b49c3f50ab642d4f6780a3dfea59b876.png', 'male', '02/06/2019', '', 'c2da08746d575b8a1462f75102bb0630', 'heyycab', 'ashleyamusgrave@gmail.com', '', '44', '7768580651', '', 'DRI20190528201007', '360289', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-05-28 20:10:07', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-05 17:15:48', 1, 0, 1, 0, 0, 0),
(267, 0, 0, '', 0, NULL, '', '8A5DwabR6olFnj0Sg3ke4QXWOiGhMmZt', '865959031283204', '0911000267', 'Ananthan', 'A', '', '', '8/6/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '9600619919', '', '', '847902', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-01 18:28:17', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(268, 0, 0, '', 0, NULL, '', '1234550001', '356477081759094', '1234550001', 'Default 1234550001', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '1234550001', '', '', '123456', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0, '', '', 'Kuala Lumpur', '3.139003', '101.686855', '', '', 1, 2, '2019-06-04 17:42:18', 1, 0, 1, 0, 0, 0),
(269, 0, 0, '', 0, NULL, '', '1234550002', '356810094071919', '1234550002', 'Default 1234550002', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '1234550002', '', '', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 2, '2019-06-04 17:43:15', 1, 0, 1, 0, 0, 0),
(270, 0, 0, '', 0, NULL, '', '1234550003', '358345088106890', '1234550003', 'Default 1234550003', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '1234550003', '', '', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 1, '', '', '0', '', '', '', '', 1, 2, '2019-06-04 17:43:41', 1, 0, 1, 0, 0, 0),
(271, 0, 0, '', 0, NULL, '', '1234550004', '865959031283204', '1234550004', 'Default 1234550004', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '1234550004', '', '', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 1, '', '', '0', '', '', '', '', 1, 2, '2019-06-04 17:44:53', 1, 0, 1, 0, 0, 0),
(272, 0, 0, '', 0, NULL, '', '1234550005', '865959031283204', '1234550005', 'Default 1234550005', 'IOS', '', 'male', '12/04/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manivendhan92@gmail.com', '', '91', '1234550005', '', '', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-04-12 17:42:51', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 1, '', '', '0', '', '', '', '', 1, 2, '2019-06-04 17:42:46', 1, 0, 1, 0, 0, 0),
(273, 0, 0, '', 0, NULL, '', '1234560001', '865874033379324', '1234560001', 'Default 1234560001', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234560001', '', '', '862197', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(274, 0, 0, '', 0, NULL, '', '1234560002', '1234560002', '1234560002', 'Default 1234560002', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234560002', '', '', '123456', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(275, 0, 0, '', 0, NULL, '', '1234560003', '1234560003', '1234560003', 'Default 1234560003', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234560003', '', '', '123456', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(276, 0, 0, '', 0, NULL, '', '1234560004', '1234560004', '1234560004', 'Default 1234560004', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234560004', '', '', '123456', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(277, 0, 0, '', 0, NULL, '', '1234560005', '1234560005', '1234560005', 'Default 1234560005', 'IOS', '', '', '12/4/2004', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '91', '1234560005', '', '', '123456', 1, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-04-12 14:31:48', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '0', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(278, 0, 0, '', 0, NULL, '', '3qA7PBvSOQUEWfnJyi61uhLgo0CDGRZ2', '354359081468599', '0601000278', 'Rajan', 'Thomas', '', '', '23/1/1995', '', '403a07cbd3febb503cb39c7abc550507', 'rajan19', NULL, '', '60', '1139992628', '', '', '123456', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 09:38:13', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(279, 0, 0, '', 0, NULL, '', 'ZuAqQ4PegHvSwFf5YonEyLVRDIx1lprj', '869183033606298', '0601000279', 'Lucy', 'Negi', '', 'Female', '05-06-2004', '', 'c40a6ccc72437e16f6d4573441b369fa', 'lucy19', '0', '', '60', '194855336', '', '', '123456', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 09:56:58', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(280, 0, 0, '', 0, NULL, '', 'dKMif1lNYQWxGTvI5hkmjULqtnXDZ0bp', '359050080277934', '0601000280', 'Jasmine', 'Khongka', '', '', '2/9/1985', '', '87fbe6410fbe566cb94cd9fe93c01db3', 'Jasmine2019', NULL, '', '60', '197053491', '', '', '123456', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 10:04:42', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(281, 0, 0, '', 2, NULL, '', 'voktJuqf7hSeFaM1KUGVbEYmXTWxOIs8', '866105034128637', '0602000281', 'chow', 'alvin', '', 'Male', '02/01/1981', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'chowtransport@gmail.com', '', '60', '183835128', '0183835128', 'DRI20190605102131', '682351', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:21:31', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(282, 0, 0, '', 2, NULL, '', 'edaXprs6vAQf5gxUEmuYSlFMTRO0qhJi', '352455105979751', '0602000282', 'SIEW SAN ', 'TING', '', 'Female', '08/07/1973', '', '0af17d81fb1c1b20acc58ed44572d3b9', 'SAMsst78', 'tingsiewsan@gmail.com', '', '60', '127088773', '123456', 'DRI20190605102146', '326458', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:21:46', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(283, 0, 0, '', 2, NULL, '', 'LuNm9khTDbMJnXOfzH753EBlaFY8yjvR', '354465102249445', '0602000283', 'Teck FOO', 'Ho', '', 'Male', '08011972', '', 'fcea920f7412b5da7be0cf42b8c93759', '1234567', 'taxiho888@gmail.com', '', '60', '178838922', '0178838922', 'DRI20190605102310', '203618', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:23:10', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(284, 0, 0, '', 2, NULL, '', 'YlArqEeF9w463cyTOJI0Np58HUvPWgbS', '867562037233724', '0602000284', 'Jason', 'Ng', '', '', NULL, '', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', '', '60', '142112418', 'Directly', 'DRI20190605102926', '0', 1, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:29:26', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(285, 0, 0, '', 2, NULL, '', 'HKOJvrXdsTF81UxPbgMc3fRLD5Syp6Eh', '865450039008975', '0602000285', 'Lowrance ', 'Anthony ', '', 'Male', '02/08/1975', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'lowranceanthony0208@gmail.com', '', '60', '123505591', '123505591', 'DRI20190605103159', '751982', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:31:59', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(286, 0, 0, '', 2, NULL, '', 'EnIxvJBlYrhPfDNk6eqCWZ93sbFVALig', '358131090842874', '0602000286', 'POH CHENG', 'LIM', '', '', NULL, '', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', '', '60', '138869976', 'Directly', 'DRI20190605103505', '085742', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-05 10:35:05', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(287, 0, 0, '', 0, NULL, '', 'wRJeMUOmLgK9QuDfjb0sEiSByAnGqvcY', '865450039008975', '0601000287', 'Lowrance ', 'Anthony ', '', '', '5/6/1981', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '60', '123505591', '', '', '517308', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 11:28:31', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(288, 0, 0, '', 0, NULL, '', 'D8QSn4OZAcN50VHxPICLs6phw3kvEiba', '860023043009621', '0601000288', 'Julie ', 'CHAN ', '', '', '14/7/1945', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '60', '128718773', '', '', '160372', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 11:41:07', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(289, 0, 0, '', 0, NULL, '', 'NCJ3OLmBAp1afXjnVzgrlqvEMt4H9ci7', '868804038695850', '0601000289', 'wayu', 'putra', 'user/customer/5ed4c6e0db3bbb954c2ad94ad5c0f7dc.jpeg', 'Male', '27-03-1979', '', '6edc319e5424865f52e46ac880464555', 'nika4729', 'jedayuputra@gmail.com', '', '60', '+60178636368', '', '', '170548', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 15:42:52', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(290, 0, 0, '', 0, NULL, '', 'FXOI6iKbwg2MZud4onCa3yT8rp5StcsD', '356261106899121', '0601000290', 'a', 'm', '', '', '14/6/2004', '', 'c2da08746d575b8a1462f75102bb0630', 'heyycab', NULL, '', '60', '1137392782', '', '', '460178', 0, '207916', 1, NULL, 1, 5, NULL, 0, 0, '2019-06-05 16:40:04', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(291, 0, 0, '', 0, NULL, '', 'H5Asu3ZaROvV7nK9or42qkyt8fScmhBJ', '357124090058451', '0601000291', 'Dr. Jayanthi', 'raj', '', '', '28/12/1981', '', 'e10adc3949ba59abbe56e057f20f883e', '123456', NULL, '', '60', '126927468', '', '', '962847', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-05 16:59:01', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(292, 0, 0, '', 2, NULL, '', 'G7qM91tgzJwcDTQujfRL0pPiKU8xdHh4', '868804038695850', '0602000292', 'shanmuganathan', 'karnnamuthik', '', '', NULL, '', '6edc319e5424865f52e46ac880464555', 'nika4729', '', '', '60', '+60178636368', 'Directly', 'DRI20190620143819', '264319', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-06-20 14:38:19', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(293, 0, 0, '', 0, NULL, '', 'x9WSRnEMHaK2GqjUhIop1dzLl0eCk7y5', '869604038277975', '0601000293', 'Sri Ganes', 'Ramasamy', '', '', '1/7/1980', '', '50064657514130a5fa847678eb61eee3', '123456Sg', NULL, '', '60', '123889217', '', '', '498306', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-21 13:29:57', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(294, 0, 0, '', 0, NULL, '', '6opuRKO2dPXhgVHbnsqMlEDw90UzcIrQ', '863196043256603', '0601000294', 'kamaleswaran ', 'periasamy ', '', '', '15/6/1977', '', '1c439cd94d5c2e0d138c9eb805455d1d', 'kamal77', NULL, '', '60', '+60162224490', '', '', '123594', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-21 16:34:29', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(295, 0, 0, '', 0, NULL, '', 'oPFSRytswA43X8xcC5Kh2uG7DpbgWT6n', '357623083111151', '0601000295', 'malar', 'villy', '', 'Female', '0', '', '6edc319e5424865f52e46ac880464555', 'nika4729', '0', '', '60', '+60126406368', '', '', '405197', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-06-24 10:16:58', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(296, 0, 0, '', 0, NULL, '', 'YZtxkDQ15qCWoI0blcPF2EKeJ6HOLRM4', '354555105630334', '0911000296', 'Rohit', 'T?wari', '', '', '28/7/1988', '', 'fff1ad9118aa1256e3128a00f2ea795a', 'rohit@123', NULL, '', '91', '9015666524', '', '', '408735', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-02 18:09:29', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(297, 0, 0, '', 0, NULL, '', '0PVZkNutzBy1T2gYvj37SObERnm6JaDq', '353621070623562', '0601000297', 'CHANDRIKA', 'RAMASAMY', '', '', '13/3/1978', '', '7c6508e775c63ea9773485be9a932db0', '130013', NULL, '', '60', '177324443', '', '', '458907', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-12 11:30:52', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(298, 0, 0, '', 2, NULL, '', 'a9KTbyuYPj0s8NRcmdxqwQZtCSnXkgGe', '357124090058451', '0602000298', 'jayanthi ', 'raj', '', 'Female', NULL, '', 'f48729d8c581c37690fde74761822fe0', '5175dim281281', 'dimpplejayz@gmail.com', '', '60', '126927468', '', 'DRI20190716164531', '705216', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-07-16 16:45:31', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(299, 0, 0, '', 0, NULL, '', 'VxOYZzykcFsovS5bwLueUMNl9W1XGB6P', '863128037599169', '0911000299', 'vikrant', 'tikku', '', '', '1/8/1971', '', '2ae4a6a9a99aea409a7583b253d191b4', 'hc@4127', NULL, '', '91', '9820397303', '', '', '849731', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-28 08:27:23', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(300, 0, 0, '', 0, NULL, '', 'x5Te7YfLylS4BwztZDFEgPUMsVp9umRj', '866078042748821', '0911000300', 'MANORANJAN', 'MOHANTY', 'user/customer/fb3c59f84b5aefe8a32feca4f5e81183.jpeg', 'Male', '04-04-1965', '', '7cc208c9c79d3b3d0921e9424c731a4a', 'ansul@1234', 'mail.camm@gmail.com', '', '91', '9811222458', '', '', '639427', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-28 23:36:30', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(301, 0, 0, '', 0, NULL, '', 'ilS64tLY1eZQFBMJqxIUfg9RG0Vba2pr', '356129103047301', '0911000301', 'Dipika ', 'Sasmal ', '', '', '10/9/1970', '', '33d591ba04252a4c9274d5ad4aa12899', 'dipikas111', NULL, '', '91', '9830007646', '', '', '427390', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-29 13:55:27', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(302, 0, 0, '', 2, NULL, '', '7CnzqsSbX2JtKVHDvkWAjB0U31456GeM', '358345088106890', '0912000302', 'test ', 'test', '', '', NULL, '', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', '', '91', '8973725802', 'Directly', 'DRI20190729144040', '234659', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-07-29 14:40:40', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(303, 0, 0, '', 0, NULL, '', '0oW7JurLiSpPRlkFNB18VXvQYZqEHMUC', '862389042586036', '0911000303', 'Rajender singh', 'mehra', '', '', '26/3/1989', '', 'cac5ff630494aa784ce97b9fafac2500', 'raj123', NULL, '', '91', '7697583998', '', '', '471836', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-29 21:31:25', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(304, 0, 0, '', 0, NULL, '', 'rWGnPSeJhF0Ejiqu2o5gmVKCvtcAY7NT', '356477084174374', '0911000304', 'Madan Lal', 'Shaw', '', '', '31/1/1955', '', '06c91df79dd73b98342ae69846aab7de', '310155', NULL, '', '91', '9871868777', '', '', '182490', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-07-30 14:07:23', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0),
(305, 0, 0, '', 2, NULL, '', 'TWZYn4wfyVd2hAzM35ib9sqLEtrIBSRc', '868493033683093', '0912000305', 'Rupak ', 'ray', '', 'Male', '06/06/1982', '', '53a24f62eb154e33cc5ba5392d47b91c', 'rupakray8', 'rupakray8@gmail.com', '', '91', '7008962025', '9668589234', 'DRI20190802110534', '570832', 0, NULL, 0, NULL, 1, 4, '0', 0, 0, '2019-08-02 11:05:34', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 0, 0),
(306, 0, 0, '', 0, NULL, '', 'lv0o8QSeIahJ2qHmg9XOPYcbG6WywT3D', '357558066837572', '0911000306', 'Prayag Vardhan', 'Mudgal', '', '', '15/11/1998', '', '3d8f9fbff50c0c1a1067db8790f84602', '9826222349', NULL, '', '91', '8871222349', '', '', '538049', 0, NULL, 0, NULL, 1, 5, NULL, 0, 0, '2019-08-03 18:09:35', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_users_logs`
--

CREATE TABLE `angkorwat_users_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `post_value` longtext NOT NULL,
  `post_url` text NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_active`
--

CREATE TABLE `angkorwat_user_active` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1-Login, 2-Active, 3-Logout',
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_address`
--

CREATE TABLE `angkorwat_user_address` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `local_image` text NOT NULL,
  `local_address` text,
  `local_continent_id` int(11) NOT NULL,
  `local_country_id` int(11) NOT NULL,
  `local_zone_id` int(11) NOT NULL,
  `local_state_id` int(11) NOT NULL,
  `local_city_id` int(11) NOT NULL,
  `local_area_id` int(11) NOT NULL,
  `local_pincode` varchar(255) NOT NULL,
  `local_verify` tinyint(4) NOT NULL,
  `local_approved_by` int(11) NOT NULL,
  `local_approved_on` datetime NOT NULL,
  `permanent_image` text NOT NULL,
  `permanent_address` text,
  `permanent_continent_id` int(11) NOT NULL,
  `permanent_country_id` int(11) NOT NULL,
  `permanent_zone_id` int(11) NOT NULL,
  `permanent_state_id` int(11) NOT NULL,
  `permanent_city_id` int(11) NOT NULL,
  `permanent_area_id` int(11) NOT NULL,
  `permanent_pincode` varchar(255) NOT NULL,
  `permanent_verify` tinyint(4) NOT NULL,
  `permanent_approved_by` int(11) NOT NULL,
  `permanent_approved_on` datetime NOT NULL,
  `is_complete_local` tinyint(4) NOT NULL,
  `is_complete_permanent` tinyint(4) NOT NULL,
  `is_edit` tinyint(4) NOT NULL,
  `created_type` tinyint(4) NOT NULL COMMENT '0-System, 1-APP',
  `complete_address` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `same_address` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_address`
--

INSERT INTO `angkorwat_user_address` (`id`, `user_id`, `local_image`, `local_address`, `local_continent_id`, `local_country_id`, `local_zone_id`, `local_state_id`, `local_city_id`, `local_area_id`, `local_pincode`, `local_verify`, `local_approved_by`, `local_approved_on`, `permanent_image`, `permanent_address`, `permanent_continent_id`, `permanent_country_id`, `permanent_zone_id`, `permanent_state_id`, `permanent_city_id`, `permanent_area_id`, `permanent_pincode`, `permanent_verify`, `permanent_approved_by`, `permanent_approved_on`, `is_complete_local`, `is_complete_permanent`, `is_edit`, `created_type`, `complete_address`, `is_delete`, `same_address`) VALUES
(5, 7, 'document/local_address/48a4ca9431526ef11b40105ea5b241fc.jpg', 'fgdgdfg', 1, 1, 1, 1, 1, 5, '', 1, 2, '2019-01-23 16:14:29', 'document/permanent_address/37472ae51554bb63a30856e2d445e408.jpg', 'dfgdg', 1, 1, 1, 1, 1, 19, '', 1, 2, '2019-01-23 16:14:29', 0, 0, 1, 0, 0, 0, 0),
(6, 8, 'document/local_address/735e6097cbe59d0bafe75eb733b6a46b.jpg', 'gdfgfdg', 1, 1, 1, 1, 1, 5, '', 1, 2, '2019-01-23 16:17:21', 'document/permanent_address/7382426c62430326e58a274248f161d5.jpg', 'dfgdgd', 1, 1, 1, 1, 1, 5, '', 1, 2, '2019-01-23 16:17:21', 0, 0, 1, 0, 0, 0, 0),
(7, 9, 'document/local_address/ed62f57b369916dc942f19dbf17d0e41.jpg', 'dsfsfd', 1, 1, 1, 1, 1, 21, '', 1, 2, '2019-01-23 16:20:03', 'document/permanent_address/b834e274264387fb1dee689ae0dfeade.jpg', 'sdfsfs', 1, 1, 1, 1, 1, 5, '', 1, 2, '2019-01-23 16:20:03', 0, 0, 1, 0, 0, 0, 0),
(244, 228, 'document/local_address/b32075e5d0f3c4ac61cd80d3c14f24ad.jpg', 'sadsada', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:11:12', 'document/permanent_address/955ebdbcb116f15da49dbf9fd70845a9.jpg', 'sdfss', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:11:12', 0, 0, 1, 0, 1, 0, 0),
(245, 229, 'document/local_address/9c61d01b3327e39e77f05db0b1961b62.jpg', 'fdsfsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:02', 'document/permanent_address/b8665df3fdcf5b106b3b8826dcb85b71.jpg', 'sdsf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:02', 0, 0, 1, 0, 1, 0, 0),
(246, 230, 'document/local_address/60965209b3c40397dd18d40663cb2aed.jpg', 'dsfsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:10:38', 'document/permanent_address/a3a6f4a8364292990994a1fc42ba2fd9.jpg', 'ddsfsf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:10:38', 0, 0, 1, 0, 1, 0, 0),
(247, 231, 'document/local_address/bd8525fa6a0646fac682d4ab277ad7d2.jpg', 'sffsf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:40', 'document/permanent_address/ddbd98d827e06f773dfa3a3a28706f95.jpg', 'ssdfsf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:40', 0, 0, 1, 0, 1, 0, 0),
(248, 232, 'document/local_address/4091373b3186d389e64cef693f35e6a0.jpg', 'dfgfgd', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:11', 'document/permanent_address/365e541cae1a13da8fee2264e08ad501.jpg', 'dsfsfdsf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:11', 0, 0, 1, 0, 1, 0, 0),
(249, 233, 'document/local_address/4308254e0736bb42a3d8ff0f2eaacef2.jpg', 'ffdsdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:20', 'document/permanent_address/9e499d27234955611a3c2789680a2544.jpg', 'sdfsdf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:20', 0, 0, 1, 0, 1, 0, 0),
(250, 234, 'document/local_address/59773993998bb9b2c152c67f718e1f43.jpg', 'ggdgfd', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:30', 'document/permanent_address/a83b15626755c787ea6b00266772eb10.jpg', 'sffsd', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:16:30', 0, 0, 1, 0, 1, 0, 0),
(251, 235, 'document/local_address/1375064cd99a0603506f2e22af640a2e.jpg', 'dfgdgfd', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:10:45', 'document/permanent_address/2191835e501e4049d0b27e13bb9d55cc.jpg', 'dsffs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-01 16:10:45', 0, 0, 1, 0, 1, 0, 0),
(256, 248, 'document/local_address/632ffc05069fa3f30eaf00626581ed02.jpg', '41, Chidambara Swami Koil, 2nd Street, Mylapore', 0, 0, 0, 0, 0, 0, '600004', 1, 2, '2019-05-14 22:46:56', 'document/permanent_address/c386d2d00b83a477c22179716a6067e4.jpg', '', 0, 0, 0, 0, 0, 0, '600004', 1, 2, '2019-05-14 22:46:56', 0, 0, 1, 0, 1, 0, 0),
(257, 249, 'document/local_address/95d098a69b42219521403698c3a639cf.png', '12 abc', 0, 0, 0, 0, 0, 0, 'AEB3WE', 1, 2, '2019-05-16 07:21:24', 'document/permanent_address/24cfbcddb0ee1a39d891cddb699d5a31.png', 'the 12', 0, 0, 0, 0, 0, 0, 'ABE324', 1, 2, '2019-05-16 07:21:24', 0, 0, 1, 0, 1, 0, 0),
(258, 250, 'document/local_address/db4abe6db233fea5ce272cc896f868a4.png', 'ase', 0, 0, 0, 0, 0, 0, 'DR2', 1, 2, '2019-05-16 06:48:46', 'document/permanent_address/ab4a1ee00ec267e4edd8df8828388633.png', 'asd', 0, 0, 0, 0, 0, 0, '123', 1, 2, '2019-05-16 06:48:46', 0, 0, 1, 0, 1, 0, 0),
(259, 254, '', 'asdsda', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-16 14:53:00', '', 'sadsada', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-16 14:53:00', 0, 0, 1, 0, 1, 0, 0),
(260, 255, '', 'sdfsfs', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-20 19:55:39', '', 'sdfsf', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-20 19:55:39', 0, 0, 1, 0, 1, 0, 0),
(261, 256, 'document/local_address/3375365d00eb91842cc905aac406f71a.jpeg', '146/86k, 7th cross, SV Road ,Gandhinagar, Dharmapuri', 0, 0, 0, 0, 0, 0, '636702', 1, 2, '2019-05-22 14:52:57', 'document/permanent_address/08c8f387daf6de6528cc257a59881fc9.jpeg', '', 0, 0, 0, 0, 0, 0, '345789', 1, 2, '2019-05-22 14:52:57', 0, 0, 1, 0, 1, 0, 0),
(262, 257, 'document/local_address/f2066321bb839a875399c5409601c281.jpeg', 'The Old Rectory, Pitchcott', 0, 0, 0, 0, 0, 0, 'kkk112', 1, 2, '2019-05-23 07:42:14', 'document/permanent_address/24af3f9e9ddd4716e2ef88198c7ed760.jpeg', 'The Old Rectory, Pitchcott', 0, 0, 0, 0, 0, 0, 'ggg666', 1, 2, '2019-05-23 07:42:14', 0, 0, 1, 0, 1, 0, 0),
(263, 258, 'document/local_address/d6eb5fb614813b4e95e2bd6c49574348.jpeg', 'dsadad', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-23 14:34:04', '', 'asdsada', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-23 14:34:04', 0, 0, 1, 0, 1, 0, 0),
(264, 259, 'document/local_address/690412bafabc183934e191ed8acd10e8.jpeg', 'The Ice Box', 0, 0, 0, 0, 0, 0, '1234567', 1, 2, '2019-05-23 16:52:46', 'document/permanent_address/3a5d27b5a4a60fd847778599048194dc.jpeg', 'the ice box', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-05-23 16:52:46', 0, 0, 1, 0, 1, 0, 0),
(265, 260, '', 'sdfsfs', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-23 17:10:12', '', 'sdfsfs', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-23 17:10:12', 0, 0, 0, 0, 1, 0, 0),
(266, 262, '', 'asadad', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-06-05 10:58:37', '', 'asasdas', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-06-05 10:58:37', 0, 0, 1, 0, 1, 0, 0),
(267, 260, '', 'sdfsfs', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-27 20:26:08', '', 'sdfsfs', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-05-27 20:26:08', 0, 0, 1, 0, 1, 0, 0),
(268, 263, 'document/local_address/1558972759484_image.jpeg', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 'document/permanent_address/1558972763641_image.jpeg', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(269, 251, 'document/local_address/5f4d487c12305cda3e7d5260da492baa.jpeg', 'zxczcz', 0, 0, 0, 0, 0, 0, '600021', 1, 2, '2019-04-13 14:01:36', 'document/permanent_address/b46c9047724159ac31d99f61b42911c0.jpeg', 'xcxcz adsd', 0, 0, 0, 0, 0, 0, '607802', 1, 2, '2019-04-13 14:01:36', 0, 0, 1, 0, 1, 0, 0),
(270, 266, 'document/local_address/650aa0d58170aae24c156a99a9943c03.png', '12 jalan ampang', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-05 17:15:48', 'document/permanent_address/add028e45b55deb9e1aaa0436e27a842.png', '12 jalan', 0, 0, 0, 0, 0, 0, 'ryhth45', 1, 2, '2019-06-05 17:15:48', 0, 0, 1, 0, 1, 0, 0),
(271, 268, '', 'ffdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:42:18', '', 'fghfghf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:42:18', 0, 0, 1, 0, 0, 0, 0),
(272, 269, '', 'ffdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:43:15', '', 'fghfghf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:43:15', 0, 0, 1, 0, 0, 0, 0),
(273, 270, '', 'ffdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:43:41', '', 'fghfghf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:43:41', 0, 0, 1, 0, 0, 0, 0),
(274, 271, '', 'ffdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:44:53', '', 'fghfghf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:44:53', 0, 0, 1, 0, 0, 0, 0),
(275, 272, '', 'ffdsfs', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:42:46', '', 'fghfghf', 0, 0, 0, 0, 0, 0, '123456', 1, 2, '2019-06-04 17:42:46', 0, 0, 1, 0, 0, 0, 0),
(276, 281, 'document/local_address/dc7ac2f01f13c74fe265da72bef9ad20.jpeg', NULL, 0, 0, 0, 0, 0, 0, '43500', 0, 0, '0000-00-00 00:00:00', 'document/permanent_address/782bb5001c8f362e19f297c83d4b6356.jpeg', NULL, 0, 0, 0, 0, 0, 0, '43500', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(277, 282, 'document/local_address/6db719fa4641824b7ffbfbb1601f487b.jpeg', NULL, 0, 0, 0, 0, 0, 0, '51000', 0, 0, '0000-00-00 00:00:00', 'document/permanent_address/5901ce0a7827857e2db4bfaf53e3dfda.jpeg', NULL, 0, 0, 0, 0, 0, 0, '51000', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(278, 283, 'document/local_address/6e1d9b3c2556d60cfc977c61f000f220.jpeg', NULL, 0, 0, 0, 0, 0, 0, 'oop', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, 'oop', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(279, 284, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0, 0),
(280, 285, 'document/local_address/f63b0ff3c0a8845ba5b0e51aede24abd.jpeg', NULL, 0, 0, 0, 0, 0, 0, '41050', 0, 0, '0000-00-00 00:00:00', 'document/permanent_address/6b632ca7fed7b7ad54aa68fb3f5dcd7f.jpeg', NULL, 0, 0, 0, 0, 0, 0, '41050', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(281, 286, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0, 0),
(282, 292, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0, 0),
(283, 298, 'document/local_address/a822ae83aa8c4e56fe24190755482cf6.jpeg', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 'document/permanent_address/1e95ff901f2573728796b8a3fb93cdd0.jpeg', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0),
(284, 302, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0, 0),
(285, 305, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_bank`
--

CREATE TABLE `angkorwat_user_bank` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `account_holder_name` varchar(255) NOT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `is_verify` tinyint(4) NOT NULL COMMENT '0-Process, 1-verify, 2-Not verify',
  `approved_by` int(11) NOT NULL,
  `approved_on` datetime NOT NULL,
  `is_credit` tinyint(4) NOT NULL,
  `credit_name` text NOT NULL,
  `credit_number` text NOT NULL,
  `credit_month` text NOT NULL,
  `credit_year` text NOT NULL,
  `credit_cvv` text NOT NULL,
  `credit_verify` tinyint(4) NOT NULL,
  `credit_approved_by` int(11) NOT NULL,
  `credit_approved_on` datetime NOT NULL,
  `is_debit` tinyint(4) NOT NULL,
  `debit_name` text NOT NULL,
  `debit_number` text NOT NULL,
  `debit_month` text NOT NULL,
  `debit_year` text NOT NULL,
  `debit_cvv` text NOT NULL,
  `debit_verify` tinyint(4) NOT NULL,
  `debit_approved_by` int(11) NOT NULL,
  `debit_approved_on` datetime NOT NULL,
  `is_complete_bank` tinyint(4) NOT NULL,
  `is_complete_credit` tinyint(4) NOT NULL,
  `is_complete_debit` tinyint(4) NOT NULL,
  `is_edit` tinyint(4) NOT NULL,
  `created_type` tinyint(4) NOT NULL COMMENT '0-System, 1-APP',
  `complete_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_bank`
--

INSERT INTO `angkorwat_user_bank` (`id`, `user_id`, `account_holder_name`, `account_no`, `bank_name`, `branch_name`, `ifsc_code`, `is_verify`, `approved_by`, `approved_on`, `is_credit`, `credit_name`, `credit_number`, `credit_month`, `credit_year`, `credit_cvv`, `credit_verify`, `credit_approved_by`, `credit_approved_on`, `is_debit`, `debit_name`, `debit_number`, `debit_month`, `debit_year`, `debit_cvv`, `debit_verify`, `debit_approved_by`, `debit_approved_on`, `is_complete_bank`, `is_complete_credit`, `is_complete_debit`, `is_edit`, `created_type`, `complete_bank`) VALUES
(5, 7, '', '3454353', 'dfgfdg', 'dfgdg', 'dgfdgd', 1, 2, '2019-01-23 16:14:29', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(6, 8, '', '345345', 'fdgdgd', 'dgfdgd', 'gfdg', 1, 2, '2019-01-23 16:17:21', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(7, 9, '', '3453453', 'ddfsdfs', 'sdfdsfs', 'fsdf', 1, 2, '2019-01-23 16:20:03', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, '', '', '0', '0', '0', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(244, 228, 'Sdfsfsf', '24342', 'Ssds', 'Sdsds', 'SBIN0000058', 1, 2, '2019-06-01 16:11:12', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(245, 229, 'Dfdsf', '324324', 'Dfgdgd', 'Dfgd', 'SBIN0000058', 1, 2, '2019-06-01 16:16:02', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(246, 230, 'Ssdfsf', '4242', 'Ddgd', 'Dfgdgd', 'SBIN0000058', 1, 2, '2019-06-01 16:10:38', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(247, 231, 'Sfsfsdf', '4522', 'Ddd', 'Sfdsf', 'SBIN0000058', 1, 2, '2019-06-01 16:16:40', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(248, 232, 'Sdsasd', '232323', 'Sdsfsf', 'Dsfsf', 'SBIN0000058', 1, 2, '2019-06-01 16:16:11', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(249, 233, 'Ddfsf', '345435', 'Dgfdgd', 'Dfgfdgfd', 'SBIN0000058', 1, 2, '2019-06-01 16:16:20', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(250, 234, 'Fdsfds', '35345', 'Dfdfdsfs', 'Sdfdsf', 'SBIN0000058', 1, 2, '2019-06-01 16:16:30', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(251, 235, 'Dsfsfs', '3432432', 'Dsffdssf', 'Dsfdsf', 'SBIN0000058', 1, 2, '2019-06-01 16:10:45', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(260, 247, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(261, 248, 'Ramesh', '1234567890', 'hdfc', 'mount road', 'HDFC000900', 1, 2, '2019-05-14 22:46:56', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(262, 249, 'Ab', '123', 'Abc', 'Abc', 'SBIN0000058', 1, 2, '2019-05-16 07:21:24', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(263, 250, 'Abc', '1', 'ABC', '1', 'SBIN0000058', 1, 2, '2019-05-16 06:48:46', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(264, 251, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(265, 252, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(266, 253, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(267, 254, 'cjfjf', '89998', 'xdddhd', 'ddhdhd', 'SBIN0000058', 1, 2, '2019-05-16 14:53:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(268, 255, 'hdjdd', '5926265', 'hdhdd', 'hdhd', 'SBIN0000058', 1, 2, '2019-05-20 19:55:39', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(269, 256, 'test', '158885985', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-05-22 14:52:57', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(270, 257, 'a', '1', 'h', 'f', '5367889', 1, 2, '2019-05-23 07:42:14', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(271, 258, 'hdhdf', '686565', 'vxhdh', 'gxhd', 'SBIN0000058', 1, 2, '2019-05-23 14:34:04', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(272, 259, 'kerry musgrave ', '123456789', 'happy bank', '123', 'SBIN0000058', 1, 2, '2019-05-23 16:52:46', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(273, 260, 'Test', '4342', 'Test', 'Test', 'SBIN0000058', 1, 2, '2019-05-27 20:26:08', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(274, 261, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(275, 262, 'gxhd', '9565', 'hdh', 'hxbf', 'SBIN0000058', 1, 2, '2019-06-05 10:58:37', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(276, 263, 'jgdjgdjgdjgxjgxgjxgj', '124557;#)', 'kgxjgdjgxjgxngx', 'jxjgxjgxgkxkgxkh', 'kgxkgxgkxkgxkh', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(277, 250, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(278, 251, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-04-13 14:01:36', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(279, 266, 'Ashley Musgrave ', '123456789', 'abc', 'Abcd', 'SBIN0000058', 1, 2, '2019-06-05 17:15:48', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(280, 267, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(281, 268, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-06-04 17:42:18', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(282, 269, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-06-04 17:43:15', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(283, 270, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-06-04 17:43:41', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(285, 272, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-06-04 17:42:46', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(286, 271, 'mani', '1224545484', 'idbi', 'dpi', 'SBIN0000058', 1, 2, '2019-06-04 17:44:53', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(287, 278, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(288, 279, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(289, 280, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(290, 281, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(291, 282, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(292, 283, 'oo', '33333333', 'PBN', 'klll', 'hjkkk', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(293, 284, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(294, 285, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(295, 282, 'TING SIEW SAN ', '6432432101', 'PUBLIC BANK ', 'SENTUL', 'PBBEMYKLXXX', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 1),
(296, 286, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(297, 287, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(298, 288, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(299, 289, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(300, 290, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(301, 291, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(302, 292, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(303, 293, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(304, 294, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(305, 295, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(306, 296, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(307, 297, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(308, 298, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(309, 299, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(310, 300, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(311, 301, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(312, 302, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(313, 303, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(314, 304, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(315, 305, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0),
(316, 306, '', NULL, NULL, NULL, NULL, 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '', '', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_department`
--

CREATE TABLE `angkorwat_user_department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_department`
--

INSERT INTO `angkorwat_user_department` (`id`, `name`, `status`) VALUES
(1, 'Management', 1),
(2, 'Dispatch', 1),
(3, 'Verification', 1),
(4, 'Accounts', 1),
(5, 'Customer Relation Executive', 1),
(6, 'Marketing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_document`
--

CREATE TABLE `angkorwat_user_document` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `aadhaar_no` varchar(255) DEFAULT NULL,
  `aadhaar_image` text NOT NULL,
  `aadhar_verify` tinyint(4) NOT NULL,
  `aadhar_approved_by` int(11) NOT NULL,
  `aadhar_approved_on` datetime NOT NULL,
  `pancard_no` varchar(255) DEFAULT NULL,
  `pancard_image` text NOT NULL,
  `pancard_verify` tinyint(4) NOT NULL,
  `pancard_approved_by` int(11) NOT NULL,
  `pancard_approved_on` datetime NOT NULL,
  `license_image` varchar(255) DEFAULT NULL,
  `license_no` varchar(255) NOT NULL,
  `license_dob` varchar(255) DEFAULT NULL,
  `license_ward_name` varchar(255) DEFAULT NULL,
  `license_country_id` int(11) NOT NULL,
  `license_type` varchar(255) DEFAULT NULL,
  `license_issuing_authority` varchar(255) DEFAULT NULL,
  `license_issued_on` varchar(255) DEFAULT NULL,
  `license_validity` varchar(255) DEFAULT NULL,
  `license_verify` tinyint(4) NOT NULL,
  `license_approved_by` int(11) NOT NULL,
  `license_approved_on` datetime NOT NULL,
  `police_image` text NOT NULL,
  `police_on` varchar(255) DEFAULT NULL,
  `police_til` varchar(255) DEFAULT NULL,
  `police_verify` tinyint(4) NOT NULL,
  `police_approved_by` int(11) NOT NULL,
  `police_approved_on` datetime NOT NULL,
  `loan_doc` text NOT NULL,
  `loan_information` varchar(255) NOT NULL,
  `loan_verify` tinyint(4) NOT NULL,
  `loan_approved_by` int(11) NOT NULL,
  `loan_approved_on` datetime NOT NULL,
  `is_complete_aadhaar` tinyint(4) NOT NULL,
  `is_complete_pancard` tinyint(4) NOT NULL,
  `is_complete_license` tinyint(4) NOT NULL,
  `is_complete_police` tinyint(4) NOT NULL,
  `is_complete_loan` tinyint(4) NOT NULL,
  `is_edit` tinyint(4) NOT NULL,
  `created_type` tinyint(4) NOT NULL COMMENT '0-System, 1-APP',
  `complete_document` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_logins`
--

CREATE TABLE `angkorwat_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `expiry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_activity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(50) NOT NULL,
  `login_type` enum('A','F') NOT NULL COMMENT 'A-admin panel,F-frontend'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_permission`
--

CREATE TABLE `angkorwat_user_permission` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_all` tinyint(4) NOT NULL,
  `group_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `continent_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `immediate` tinyint(4) NOT NULL,
  `is_edit` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_permission`
--

INSERT INTO `angkorwat_user_permission` (`id`, `user_id`, `is_all`, `group_id`, `department_id`, `designation_id`, `continent_id`, `country_id`, `zone_id`, `state_id`, `city_id`, `area_id`, `reporter_id`, `immediate`, `is_edit`) VALUES
(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1),
(3, 7, 0, 6, 3, 1, 1, 0, 0, 0, 0, 0, 2, 1, 1),
(4, 8, 0, 6, 3, 2, 1, 1, 0, 0, 0, 0, 7, 1, 1),
(5, 9, 0, 6, 3, 3, 1, 1, 3, 0, 0, 0, 8, 1, 1),
(6, 113, 0, 6, 3, 2, 1, 1, 0, 0, 0, 0, 7, 1, 1),
(7, 133, 0, 6, 1, 1, 1, 0, 0, 0, 0, 0, 2, 1, 1),
(17, 228, 0, 6, 5, 1, 1, 0, 0, 0, 0, 0, 2, 1, 1),
(18, 229, 0, 6, 5, 2, 1, 1, 0, 0, 0, 0, 228, 1, 1),
(19, 230, 0, 6, 5, 3, 1, 1, 1, 0, 0, 0, 229, 1, 1),
(20, 231, 0, 6, 5, 4, 1, 1, 1, 4, 0, 0, 230, 1, 1),
(21, 232, 0, 6, 5, 4, 1, 1, 1, 1, 0, 0, 230, 1, 1),
(22, 233, 0, 6, 5, 5, 1, 1, 1, 1, 1, 0, 232, 1, 1),
(23, 234, 0, 6, 5, 6, 1, 1, 1, 1, 1, 1, 233, 1, 1),
(24, 235, 0, 6, 5, 6, 1, 1, 1, 1, 1, 1, 233, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_profile`
--

CREATE TABLE `angkorwat_user_profile` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dob` varchar(255) NOT NULL,
  `photo` text NOT NULL,
  `is_approved` tinyint(4) NOT NULL,
  `approved_on` datetime NOT NULL,
  `approved_by` int(11) NOT NULL,
  `is_complete_profile` tinyint(4) NOT NULL,
  `is_edit` tinyint(4) NOT NULL,
  `created_type` tinyint(4) NOT NULL COMMENT '0-System, 1-APP',
  `complete_profile` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_profile`
--

INSERT INTO `angkorwat_user_profile` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `dob`, `photo`, `is_approved`, `approved_on`, `approved_by`, `is_complete_profile`, `is_edit`, `created_type`, `complete_profile`, `is_delete`) VALUES
(1, 1, 'Srammram', 'Owner', 'male', '0000-00-00', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(2, 2, 'Srammram', 'admin', 'male', '0000-00-00', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(7, 7, 'Global Operator', '', 'male', '2019-01-16', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(8, 8, 'Country Operator', '', 'male', '2019-01-10', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(9, 9, 'Zonal Operator', '', 'male', '2019-01-09', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(299, 228, 'Test Global', 'Global', 'male', '01/06/2019', 'user/employee/9b133ce84d37174417a590911e29f9f4.jpg', 1, '2019-06-01 16:11:12', 2, 0, 1, 0, 0, 0),
(300, 229, 'Test Country', 'Country', 'male', '01/06/2019', 'user/employee/48f41803a684191baaa904e41c16bdc9.jpg', 1, '2019-06-01 16:16:02', 2, 0, 1, 0, 0, 0),
(301, 230, 'Test Zonal', 'Zonal', 'male', '01/06/2019', 'user/employee/36cc5f0b9ebbde41dda2b0dc7b794e46.jpg', 1, '2019-06-01 16:10:38', 2, 0, 1, 0, 0, 0),
(302, 231, 'Test ', 'Ada', 'male', '01/06/2019', 'user/employee/e4dcfdafd213e006f8ed1b236e59d5b7.jpg', 1, '2019-06-01 16:16:40', 2, 0, 1, 0, 0, 0),
(303, 232, 'Test city', 'City', 'male', '01/06/2019', 'user/employee/187b7230552f59d2af1513866740fdd0.jpg', 1, '2019-06-01 16:16:11', 2, 0, 1, 0, 0, 0),
(304, 233, 'Test city', 'C', 'male', '01/06/2019', 'user/employee/06c5676824d00488077926caf56c49f8.jpg', 1, '2019-06-01 16:16:20', 2, 0, 1, 0, 0, 0),
(305, 234, 'Test area', 'Area', 'male', '01/06/2019', 'user/employee/e4516c7ef65375d7ad6d636798adaa6a.jpg', 1, '2019-06-01 16:16:30', 2, 0, 1, 0, 0, 0),
(306, 235, 'Test operator', 'P', 'male', '01/06/2019', 'user/employee/a6c8ee3ea1941373ae386f8ddb1ac948.jpg', 1, '2019-06-01 16:10:45', 2, 0, 1, 0, 0, 0),
(320, 247, 'Ramesh', 'hari', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(321, 248, 'Ramesh', 'hari', 'male', '14 May 2004', 'user/driver/c840c22686f22ac1a2356ee01ab63b95.jpg', 1, '2019-05-14 22:46:56', 2, 0, 1, 0, 1, 0),
(322, 249, 'Samual', 'raj', 'male', '01/05/2019', 'user/driver/40bbf0a7fd4b5a30781b825467fa09d5.png', 1, '2019-05-16 07:21:24', 2, 0, 1, 0, 0, 0),
(323, 250, 'Edward', 'Lee', 'male', '08/05/2019', 'user/driver/b9c848dce7898ec3a00dec375c545819.png', 1, '2019-05-16 06:48:46', 2, 0, 1, 0, 0, 0),
(324, 251, 'ananthan', 'gshdhs', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(325, 252, 'Tamilarasan', 'Mohann', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(326, 253, 'Ashley', 'Musgrave ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(327, 254, 'Sivan ', 'D', 'male', '18/05/2004', '', 1, '2019-05-16 14:53:00', 2, 0, 1, 0, 1, 0),
(328, 255, 'Ananthan', 'a', 'male', '28/05/2004', '', 1, '2019-05-20 19:55:39', 2, 0, 1, 0, 1, 0),
(329, 253, 'Ashley', 'Musgrave', 'Male', '0', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(330, 256, 'Test', 'Vendhan', 'male', '22/05/2004', '', 1, '2019-05-22 14:52:57', 2, 0, 1, 0, 1, 0),
(331, 257, 'Ke', 'Musgrave', 'Female', '16/05/2004', '', 1, '2019-05-23 07:42:14', 2, 0, 1, 0, 1, 0),
(332, 258, 'Ananthan', 'a', 'male', '31/05/2004', '', 1, '2019-05-23 14:34:04', 2, 0, 1, 0, 1, 0),
(333, 259, 'Kerry', 'Musgrave ', 'male', '23/05/1972', '', 1, '2019-05-23 16:52:46', 2, 0, 1, 0, 1, 0),
(334, 260, 'Mani', 'tett', 'male', '01/05/2019', '', 1, '2019-05-23 17:10:12', 2, 0, 0, 0, 0, 0),
(335, 261, 'mani', 'Vendhan ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(336, 262, 'Ananthan', 'a', 'male', '26/05/2004', '', 1, '2019-06-05 10:58:37', 2, 0, 1, 0, 1, 0),
(337, 260, 'Mani', 'tett', 'male', '01/05/2019', 'user/driver/4890e57ef8a26d7d2ff1a9aec8c53d66.jpeg', 1, '2019-05-27 20:26:08', 2, 0, 1, 0, 1, 0),
(338, 263, 'assss', 'ssdccc', 'Male', '07/05/2004', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(339, 250, 'Mani', 'Vendhan ', NULL, '0000-00-00', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(340, 251, 'Manit', 'test', 'female', '0000-00-00', 'user/driver/c67ecd4355eaedb123b6eb15afd2b03a.jpeg', 1, '2019-04-13 14:01:36', 2, 0, 1, 0, 0, 0),
(341, 266, 'Ashley ', 'Musgrave ', 'male', '02/06/2019', 'user/driver/b49c3f50ab642d4f6780a3dfea59b876.png', 1, '2019-06-05 17:15:48', 2, 0, 1, 0, 1, 0),
(342, 267, 'Ananthan', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(343, 268, 'Default 1234550001', 'IOS', 'male', '12/04/2004', '', 1, '2019-06-04 17:42:18', 2, 0, 1, 0, 0, 0),
(344, 269, 'Default 1234550002', 'IOS', 'male', '12/04/2004', '', 1, '2019-06-04 17:43:15', 2, 0, 1, 0, 0, 0),
(345, 270, 'Default 1234550003', 'IOS', 'male', '12/04/2004', '', 1, '2019-06-04 17:43:41', 2, 0, 1, 0, 0, 0),
(346, 271, 'Default 1234550004', 'IOS', 'male', '12/04/2004', '', 1, '2019-06-04 17:44:53', 2, 0, 1, 0, 0, 0),
(347, 272, 'Default 1234550005', 'IOS', 'male', '12/04/2004', '', 1, '2019-06-04 17:42:46', 2, 0, 1, 0, 0, 0),
(348, 273, 'Default 1234560001', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(349, 274, 'Default 1234560002', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(350, 275, 'Default 1234560003', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(351, 276, 'Default 1234560004', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(352, 277, 'Default 1234560005', 'A', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(353, 278, 'Rajan', 'Thomas', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(354, 279, 'Lucy', 'Sam', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(355, 280, 'Jasmine', 'Khongka', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(356, 281, 'chow', 'alvin', 'Male', '02/01/1981', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(357, 282, 'SIEW SAN ', 'TING', 'Female', '08/07/1973', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(358, 283, 'Teck FOO', 'Ho', 'Male', '08011972', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(359, 284, 'Jason', 'Ng', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(360, 285, 'Lowrance ', 'Anthony ', 'Male', '02/08/1975', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(361, 286, 'POH CHENG', 'LIM', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(362, 287, 'Lowrance ', 'Anthony ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(363, 279, 'Lucy', 'Negi', 'Female', '05-06-2004', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(364, 288, 'Julie ', 'CHAN ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(365, 289, 'wayu', 'putra', NULL, '', 'user/customer/5ed4c6e0db3bbb954c2ad94ad5c0f7dc.jpeg', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(366, 290, 'a', 'm', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(367, 291, 'Dr. Jayanthi', 'raj', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(368, 292, 'shanmuganathan', 'karnnamuthik', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(369, 293, 'Sri Ganes', 'Ramasamy', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(370, 289, 'wayu', 'putra', 'Male', '27-03-1979', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(371, 294, 'kamaleswaran ', 'periasamy ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(372, 295, 'malar', 'villy', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(373, 295, 'malar', 'villy', 'Female', '0', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(374, 296, 'Rohit', 'T?wari', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(375, 297, 'CHANDRIKA', 'RAMASAMY', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(376, 298, 'jayanthi ', 'raj', 'Female', '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(377, 299, 'vikrant', 'tikku', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(378, 300, 'MANORANJAN', 'MOHANTY', NULL, '', 'user/customer/fb3c59f84b5aefe8a32feca4f5e81183.jpeg', 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0),
(379, 301, 'Dipika ', 'Sasmal ', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(380, 302, 'test ', 'test', '', '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(381, 303, 'Rajender singh', 'mehra', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(382, 304, 'Madan Lal', 'Shaw', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(383, 300, 'MANORANJAN', 'MOHANTY', 'Male', '04-04-1965', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0),
(384, 305, 'Rupak ', 'ray', 'Male', '06/06/1982', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 1, 0),
(385, 306, 'Prayag Vardhan', 'Mudgal', NULL, '', '', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_roles`
--

CREATE TABLE `angkorwat_user_roles` (
  `id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `access_area` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_roles`
--

INSERT INTO `angkorwat_user_roles` (`id`, `position`, `access_area`, `status`) VALUES
(1, 'Head - Global Operations', 'continents', 1),
(2, 'Country Head', 'countries', 1),
(3, 'Zonal Manager', 'zones', 1),
(4, 'Regional Manager', 'states', 1),
(5, 'Team Leader', 'cities', 1),
(6, 'Operator', 'areas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `angkorwat_user_socket`
--

CREATE TABLE `angkorwat_user_socket` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` bigint(20) NOT NULL,
  `socket_id` varchar(255) NOT NULL,
  `device_imei` varchar(255) NOT NULL,
  `device_token` text NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `angkorwat_user_socket`
--

INSERT INTO `angkorwat_user_socket` (`id`, `user_id`, `user_type`, `socket_id`, `device_imei`, `device_token`, `created_on`, `updated_on`) VALUES
(174, 295, 1, '', '357623083111151', 'oPFSRytswA43X8xcC5Kh2uG7DpbgWT6n', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 262, 2, '', '865959031283204', '30UOfZX5JcVNpYBGaq7lET6hxAtvs9oe', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 260, 2, '', '358345088106890', 'BX1Y7n5jdJNIeMZyAr9Ffwvtp20s4OGi', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 268, 2, '', '356477081759094', '1234550001', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 269, 2, '', '356810094071919', '1234550002', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 270, 2, '', '866104030481157', '1234550003', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 289, 1, '', '868804038695850', 'NCJ3OLmBAp1afXjnVzgrlqvEMt4H9ci7', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 280, 1, '', '359050080277934', 'dKMif1lNYQWxGTvI5hkmjULqtnXDZ0bp', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 279, 1, '', '869183033606298', 'ZuAqQ4PegHvSwFf5YonEyLVRDIx1lprj', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 272, 2, '', '865959031283204', '1234550005', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 297, 1, '', '353621070623562', '0PVZkNutzBy1T2gYvj37SObERnm6JaDq', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 267, 1, '', '865959031283204', '8A5DwabR6olFnj0Sg3ke4QXWOiGhMmZt', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 278, 1, '', '354359081468599', '3qA7PBvSOQUEWfnJyi61uhLgo0CDGRZ2', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 298, 2, '', '357124090058451', 'a9KTbyuYPj0s8NRcmdxqwQZtCSnXkgGe', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 261, 1, '', '358345088106890', 'BiTeSW1VgXN64pDwcQaUMFyYRrqu83HE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 287, 1, '', '865450039008975', 'wRJeMUOmLgK9QuDfjb0sEiSByAnGqvcY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 299, 1, '', '863128037599169', 'VxOYZzykcFsovS5bwLueUMNl9W1XGB6P', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 301, 1, '', '356129103047301', 'ilS64tLY1eZQFBMJqxIUfg9RG0Vba2pr', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 302, 2, '', '358345088106890', '7CnzqsSbX2JtKVHDvkWAjB0U31456GeM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 303, 1, '', '862389042586036', '0oW7JurLiSpPRlkFNB18VXvQYZqEHMUC', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 304, 1, '', '356477084174374', 'rWGnPSeJhF0Ejiqu2o5gmVKCvtcAY7NT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 300, 1, '', '866078042748821', 'x5Te7YfLylS4BwztZDFEgPUMsVp9umRj', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 306, 1, '', '357558066837572', 'lv0o8QSeIahJ2qHmg9XOPYcbG6WywT3D', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 294, 1, '', '863196043256603', '6opuRKO2dPXhgVHbnsqMlEDw90UzcIrQ', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angkorwat_countries`
--
ALTER TABLE `angkorwat_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_date_format`
--
ALTER TABLE `angkorwat_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_groups`
--
ALTER TABLE `angkorwat_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_notification`
--
ALTER TABLE `angkorwat_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_sessions`
--
ALTER TABLE `angkorwat_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `angkorwat_settings`
--
ALTER TABLE `angkorwat_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `angkorwat_sms_templates`
--
ALTER TABLE `angkorwat_sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`name`,`user_type`);

--
-- Indexes for table `angkorwat_users`
--
ALTER TABLE `angkorwat_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `angkorwat_users_logs`
--
ALTER TABLE `angkorwat_users_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_active`
--
ALTER TABLE `angkorwat_user_active`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_address`
--
ALTER TABLE `angkorwat_user_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_bank`
--
ALTER TABLE `angkorwat_user_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_department`
--
ALTER TABLE `angkorwat_user_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_document`
--
ALTER TABLE `angkorwat_user_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_logins`
--
ALTER TABLE `angkorwat_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_permission`
--
ALTER TABLE `angkorwat_user_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_profile`
--
ALTER TABLE `angkorwat_user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_roles`
--
ALTER TABLE `angkorwat_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `angkorwat_user_socket`
--
ALTER TABLE `angkorwat_user_socket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `angkorwat_countries`
--
ALTER TABLE `angkorwat_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `angkorwat_date_format`
--
ALTER TABLE `angkorwat_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `angkorwat_groups`
--
ALTER TABLE `angkorwat_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `angkorwat_notification`
--
ALTER TABLE `angkorwat_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `angkorwat_sms_templates`
--
ALTER TABLE `angkorwat_sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `angkorwat_users`
--
ALTER TABLE `angkorwat_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `angkorwat_users_logs`
--
ALTER TABLE `angkorwat_users_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `angkorwat_user_active`
--
ALTER TABLE `angkorwat_user_active`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `angkorwat_user_address`
--
ALTER TABLE `angkorwat_user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `angkorwat_user_bank`
--
ALTER TABLE `angkorwat_user_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `angkorwat_user_department`
--
ALTER TABLE `angkorwat_user_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `angkorwat_user_document`
--
ALTER TABLE `angkorwat_user_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `angkorwat_user_logins`
--
ALTER TABLE `angkorwat_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `angkorwat_user_permission`
--
ALTER TABLE `angkorwat_user_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `angkorwat_user_profile`
--
ALTER TABLE `angkorwat_user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `angkorwat_user_roles`
--
ALTER TABLE `angkorwat_user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `angkorwat_user_socket`
--
ALTER TABLE `angkorwat_user_socket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
