//----------------------------------------------------------------------

// DEMO - Imports for Demo Screens, Widgets, Data and Services

//----------------------------------------------------------------------
// export core functionality
//----------------------------------------------------------------------

export 'package:flutter/material.dart';
export 'dart:convert';
export 'routes.dart';

//----------------------------------------------------------------------
// export external plugins
//----------------------------------------------------------------------

export 'package:http/http.dart';
export 'package:flutter_weather_icons/flutter_weather_icons.dart';

//----------------------------------------------------------------------
// Demo Screen Imports - export to allow inclusion in navigation
//----------------------------------------------------------------------

export 'demo_screens/demo_home_screen.dart'; // Demo Home Screen
export 'demo_screens/demo_information_screen.dart'; // Normal info Screen
export 'demo_screens/demo_api_list_screen.dart'; // List fetching from api
export 'demo_screens/demo_weather_svg_graphs.dart'; // Weather data as svg
export 'demo_screens/display_svg_screen.dart'; // Display svg graphics

//----------------------------------------------------------------------
// Demo Widget Imports - export to allow use of widgets in screens
//----------------------------------------------------------------------

export 'demo_widgets/demo_drawer_widget.dart'; // Left menu example
export 'demo_widgets/demo_info_bar.dart'; // Information bar example
export 'demo_widgets/demo_slider_widget.dart'; // Slider for home screen
export 'demo_widgets/demo_list_vertical_widget.dart'; // Vertical List
export 'demo_widgets/demo_list_horizontal_widget.dart'; // Horizontal List
export 'demo_widgets/demo_list_tile_widget.dart'; // Custom list tile

//----------------------------------------------------------------------
// Demo Data Imports - export to allow data to be used across the app
//----------------------------------------------------------------------

export 'demo_data/demo_list_data_model.dart'; // Model for Demo List Data
export 'demo_data/demo_static_data.dart'; // Static data sources

//----------------------------------------------------------------------
// Demo Service Imports - functionality for the app
//----------------------------------------------------------------------

export 'demo_services/demo_data_api_service.dart'; // Get data from API
export 'demo_services/weather_icons_service.dart'; // Get Weather Icons