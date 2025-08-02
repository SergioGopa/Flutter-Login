# eisty

A new Flutter project.

```
eisty
├─ .metadata
├─ analysis_options.yaml
├─ assets
│  ├─ images
│  │  ├─ bestfood
│  │  │  ├─ ic_best_food_1.jpeg
│  │  │  ├─ ic_best_food_10.jpeg
│  │  │  ├─ ic_best_food_2.jpeg
│  │  │  ├─ ic_best_food_3.jpeg
│  │  │  ├─ ic_best_food_4.jpeg
│  │  │  ├─ ic_best_food_5.jpeg
│  │  │  ├─ ic_best_food_6.jpeg
│  │  │  ├─ ic_best_food_7.jpeg
│  │  │  ├─ ic_best_food_8.jpeg
│  │  │  └─ ic_best_food_9.jpeg
│  │  ├─ menus
│  │  │  ├─ ic_account.png
│  │  │  ├─ ic_app_icon.png
│  │  │  ├─ ic_app_icon_black.png
│  │  │  ├─ ic_cart.png
│  │  │  ├─ ic_credit_card.png
│  │  │  ├─ ic_delete.png
│  │  │  ├─ ic_food_express.png
│  │  │  ├─ ic_home.png
│  │  │  ├─ ic_near_by.png
│  │  │  └─ ic_search_menu.png
│  │  ├─ onboarding
│  │  │  ├─ onboarding1.png
│  │  │  ├─ onboarding2.png
│  │  │  └─ onboarding3.png
│  │  ├─ popular_foods
│  │  │  ├─ ic_popular_food_1.png
│  │  │  ├─ ic_popular_food_2.png
│  │  │  ├─ ic_popular_food_3.png
│  │  │  ├─ ic_popular_food_4.png
│  │  │  ├─ ic_popular_food_5.png
│  │  │  └─ ic_popular_food_6.png
│  │  ├─ splash
│  │  │  └─ splash.png
│  │  ├─ splash_logo.png
│  │  └─ topmenu
│  │     ├─ ic_burger.png
│  │     ├─ ic_cake.png
│  │     ├─ ic_ice_cream.png
│  │     ├─ ic_pasta.png
│  │     ├─ ic_pizza.png
│  │     ├─ ic_soft_drink.png
│  │     └─ ic_sushi.png
│  ├─ mock
│  │  ├─ mock_deals.json
│  │  └─ mock_restaurants.json
│  └─ svgs
│     ├─ slide-1.svg
│     ├─ slide-2.svg
│     ├─ slide-3.svg
│     ├─ slide-4.svg
│     └─ slide-5.svg
├─ lib
│  ├─ config
│  │  ├─ config.dart
│  │  ├─ constants
│  │  │  ├─ assets.dart
│  │  │  └─ environment.dart
│  │  ├─ helpers
│  │  │  └─ human_formats.dart
│  │  ├─ router
│  │  │  ├─ app_router.dart
│  │  │  └─ app_router_notifier.dart
│  │  └─ theme
│  │     ├─ app_colors.dart
│  │     ├─ app_theme.dart
│  │     ├─ theme.dart
│  │     └─ theme_data.dart
│  ├─ features
│  │  ├─ auth
│  │  │  ├─ auth.dart
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  │  └─ auth_datasource.dart
│  │  │  │  ├─ domain.dart
│  │  │  │  ├─ entities
│  │  │  │  │  └─ user.dart
│  │  │  │  └─ repositories
│  │  │  │     └─ auth_repository.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  │  └─ auth_datasource_impl.dart
│  │  │  │  ├─ errors
│  │  │  │  │  └─ auth_errors.dart
│  │  │  │  ├─ infrastructure.dart
│  │  │  │  ├─ mappers
│  │  │  │  │  └─ user_mapper.dart
│  │  │  │  ├─ models
│  │  │  │  │  └─ login_response.dart
│  │  │  │  └─ repositories
│  │  │  │     └─ auth_repository_impl.dart
│  │  │  ├─ inputs
│  │  │  │  ├─ email.dart
│  │  │  │  ├─ inputs.dart
│  │  │  │  ├─ password.dart
│  │  │  │  └─ username.dart
│  │  │  └─ presentation
│  │  │     ├─ models
│  │  │     ├─ presentation.dart
│  │  │     ├─ providers
│  │  │     │  ├─ auth_provider.dart
│  │  │     │  ├─ current_page_provider.dart
│  │  │     │  ├─ providers.dart
│  │  │     │  ├─ signin_form_provider.dart
│  │  │     │  ├─ signup_form_provider.dart
│  │  │     │  └─ slide_provider.dart
│  │  │     ├─ screens
│  │  │     │  ├─ onboarding_screen.dart
│  │  │     │  ├─ recovery_password_screen.dart
│  │  │     │  ├─ screens.dart
│  │  │     │  ├─ sign_in_screen.dart
│  │  │     │  ├─ sign_up_screen.dart
│  │  │     │  └─ splash_screen.dart
│  │  │     └─ widgets
│  │  │        ├─ custom_input_widget.dart
│  │  │        ├─ custom_text_form_field.dart
│  │  │        ├─ geometrical_background.dart
│  │  │        ├─ sign_up_in_logo_widget.dart
│  │  │        ├─ slideshow.dart
│  │  │        └─ widgets.dart
│  │  ├─ explore
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ explore.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ screens
│  │  │     │  ├─ explore_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  ├─ favorites
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ favorites.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ screens
│  │  │     │  ├─ favorites_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  ├─ home
│  │  │  ├─ domain
│  │  │  ├─ home.dart
│  │  │  ├─ infrastructure
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ providers
│  │  │     │  ├─ navigation_provider.dart
│  │  │     │  └─ providers.dart
│  │  │     ├─ screens
│  │  │     │  ├─ home_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  │        ├─ custom_bottom_navbar.dart
│  │  │        └─ widgets.dart
│  │  ├─ profile
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  ├─ presentation
│  │  │  │  ├─ presentation.dart
│  │  │  │  ├─ screens
│  │  │  │  │  ├─ profile_screen.dart
│  │  │  │  │  └─ screens.dart
│  │  │  │  └─ widgets
│  │  │  └─ profile.dart
│  │  ├─ shared
│  │  │  ├─ data
│  │  │  │  └─ mock
│  │  │  │     ├─ mock_deals.dart
│  │  │  │     ├─ mock_deals.json
│  │  │  │     └─ mock_restaurants.json
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  │  ├─ deals_datasource.dart
│  │  │  │  │  └─ restaurants_datasource.dart
│  │  │  │  ├─ domain.dart
│  │  │  │  ├─ entities
│  │  │  │  │  ├─ deal.dart
│  │  │  │  │  └─ restaurant.dart
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  │     ├─ deals_repository.dart
│  │  │  │     └─ restaurants_repository.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  │  ├─ deals_datasource_impl.dart
│  │  │  │  │  └─ restaurants_datasource_impl.dart
│  │  │  │  ├─ providers
│  │  │  │  │  ├─ deals_provider.dart
│  │  │  │  │  ├─ deals_repository_provider.dart
│  │  │  │  │  ├─ deals_state.dart
│  │  │  │  │  ├─ deal_provider.dart
│  │  │  │  │  ├─ providers.dart
│  │  │  │  │  ├─ restaurants_provider.dart
│  │  │  │  │  ├─ restaurants_repository_provider.dart
│  │  │  │  │  ├─ restaurants_state.dart
│  │  │  │  │  └─ restaurant_provider.dart
│  │  │  │  ├─ repositories
│  │  │  │  │  ├─ deals_repository_impl.dart
│  │  │  │  │  └─ restaurants_repository_impl.dart
│  │  │  │  └─ services
│  │  │  │     ├─ key_value_storage_service.dart
│  │  │  │     ├─ key_value_storage_service_impl.dart
│  │  │  │     ├─ secure_storage_service.dart
│  │  │  │     └─ secutre_storage_service_impl.dart
│  │  │  ├─ presentation
│  │  │  │  ├─ providers
│  │  │  │  │  └─ theme_provider.dart
│  │  │  │  ├─ screens
│  │  │  │  └─ widgets
│  │  │  │     ├─ custom_fille_button.dart
│  │  │  │     └─ widgets.dart
│  │  │  └─ providers
│  │  │     ├─ key_value_storage_service.dart
│  │  │     └─ shared_provider.dart
│  │  └─ today
│  │     ├─ domain
│  │     │  ├─ datasources
│  │     │  ├─ entities
│  │     │  └─ repositories
│  │     ├─ infrastructure
│  │     │  ├─ datasources
│  │     │  ├─ mappers
│  │     │  ├─ models
│  │     │  └─ repositories
│  │     ├─ presentation
│  │     │  ├─ presentation.dart
│  │     │  ├─ providers.dart
│  │     │  │  ├─ all_deals_provider.dart
│  │     │  │  └─ deals_slideshow_provider.dart
│  │     │  ├─ screens
│  │     │  │  ├─ screens.dart
│  │     │  │  └─ today_screen.dart
│  │     │  └─ widgets
│  │     │     ├─ category_chips_widget.dart
│  │     │     ├─ deal_card_widget.dart
│  │     │     ├─ deal_horizontal_listview.dart
│  │     │     ├─ hero_carousel_widget.dart
│  │     │     ├─ location_header_widget.dart
│  │     │     ├─ popular_deal_section_widget.dart
│  │     │     ├─ restaurant_horizontal_listview.dart
│  │     │     ├─ search_bar_widget.dart
│  │     │     └─ widgets.dart
│  │     └─ today.dart
│  └─ main.dart

eisty
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ .gradle
│  │  ├─ 8.3
│  │  │  ├─ checksums
│  │  │  │  ├─ checksums.lock
│  │  │  │  ├─ md5-checksums.bin
│  │  │  │  └─ sha1-checksums.bin
│  │  │  ├─ dependencies-accessors
│  │  │  │  ├─ dependencies-accessors.lock
│  │  │  │  └─ gc.properties
│  │  │  ├─ executionHistory
│  │  │  │  ├─ executionHistory.bin
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  └─ vcsMetadata
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  ├─ file-system.probe
│  │  ├─ kotlin
│  │  │  ├─ errors
│  │  │  └─ sessions
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ eisty
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ assets
│  ├─ images
│  │  ├─ bestfood
│  │  │  ├─ ic_best_food_1.jpeg
│  │  │  ├─ ic_best_food_10.jpeg
│  │  │  ├─ ic_best_food_2.jpeg
│  │  │  ├─ ic_best_food_3.jpeg
│  │  │  ├─ ic_best_food_4.jpeg
│  │  │  ├─ ic_best_food_5.jpeg
│  │  │  ├─ ic_best_food_6.jpeg
│  │  │  ├─ ic_best_food_7.jpeg
│  │  │  ├─ ic_best_food_8.jpeg
│  │  │  └─ ic_best_food_9.jpeg
│  │  ├─ menus
│  │  │  ├─ ic_account.png
│  │  │  ├─ ic_app_icon.png
│  │  │  ├─ ic_app_icon_black.png
│  │  │  ├─ ic_cart.png
│  │  │  ├─ ic_credit_card.png
│  │  │  ├─ ic_delete.png
│  │  │  ├─ ic_food_express.png
│  │  │  ├─ ic_home.png
│  │  │  ├─ ic_near_by.png
│  │  │  └─ ic_search_menu.png
│  │  ├─ onboarding
│  │  │  ├─ onboarding1.png
│  │  │  ├─ onboarding2.png
│  │  │  └─ onboarding3.png
│  │  ├─ popular_foods
│  │  │  ├─ ic_popular_food_1.png
│  │  │  ├─ ic_popular_food_2.png
│  │  │  ├─ ic_popular_food_3.png
│  │  │  ├─ ic_popular_food_4.png
│  │  │  ├─ ic_popular_food_5.png
│  │  │  └─ ic_popular_food_6.png
│  │  ├─ splash
│  │  │  └─ splash.png
│  │  ├─ splash_logo.png
│  │  └─ topmenu
│  │     ├─ ic_burger.png
│  │     ├─ ic_cake.png
│  │     ├─ ic_ice_cream.png
│  │     ├─ ic_pasta.png
│  │     ├─ ic_pizza.png
│  │     ├─ ic_soft_drink.png
│  │     └─ ic_sushi.png
│  ├─ mock
│  │  ├─ mock_deals.json
│  │  ├─ mock_deal_details.json
│  │  └─ mock_restaurants.json
│  └─ svgs
│     ├─ slide-1.svg
│     ├─ slide-2.svg
│     ├─ slide-3.svg
│     ├─ slide-4.svg
│     └─ slide-5.svg
├─ ios
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     ├─ IDEWorkspaceChecks.plist
│  │     └─ WorkspaceSettings.xcsettings
│  └─ RunnerTests
│     └─ RunnerTests.swift
├─ lib
│  ├─ config
│  │  ├─ config.dart
│  │  ├─ constants
│  │  │  ├─ assets.dart
│  │  │  └─ environment.dart
│  │  ├─ helpers
│  │  │  └─ human_formats.dart
│  │  ├─ router
│  │  │  ├─ app_router.dart
│  │  │  └─ app_router_notifier.dart
│  │  └─ theme
│  │     ├─ app_colors.dart
│  │     ├─ app_theme.dart
│  │     ├─ theme.dart
│  │     └─ theme_data.dart
│  ├─ features
│  │  ├─ auth
│  │  │  ├─ auth.dart
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  │  └─ auth_datasource.dart
│  │  │  │  ├─ domain.dart
│  │  │  │  ├─ entities
│  │  │  │  │  └─ user.dart
│  │  │  │  └─ repositories
│  │  │  │     └─ auth_repository.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  │  └─ auth_datasource_impl.dart
│  │  │  │  ├─ errors
│  │  │  │  │  └─ auth_errors.dart
│  │  │  │  ├─ infrastructure.dart
│  │  │  │  ├─ mappers
│  │  │  │  │  └─ user_mapper.dart
│  │  │  │  ├─ models
│  │  │  │  │  └─ login_response.dart
│  │  │  │  └─ repositories
│  │  │  │     └─ auth_repository_impl.dart
│  │  │  ├─ inputs
│  │  │  │  ├─ email.dart
│  │  │  │  ├─ inputs.dart
│  │  │  │  ├─ password.dart
│  │  │  │  └─ username.dart
│  │  │  └─ presentation
│  │  │     ├─ models
│  │  │     ├─ presentation.dart
│  │  │     ├─ providers
│  │  │     │  ├─ auth_provider.dart
│  │  │     │  ├─ current_page_provider.dart
│  │  │     │  ├─ providers.dart
│  │  │     │  ├─ signin_form_provider.dart
│  │  │     │  ├─ signup_form_provider.dart
│  │  │     │  └─ slide_provider.dart
│  │  │     ├─ screens
│  │  │     │  ├─ onboarding_screen.dart
│  │  │     │  ├─ recovery_password_screen.dart
│  │  │     │  ├─ screens.dart
│  │  │     │  ├─ sign_in_screen.dart
│  │  │     │  ├─ sign_up_screen.dart
│  │  │     │  └─ splash_screen.dart
│  │  │     └─ widgets
│  │  │        ├─ custom_input_widget.dart
│  │  │        ├─ custom_text_form_field.dart
│  │  │        ├─ geometrical_background.dart
│  │  │        ├─ sign_up_in_logo_widget.dart
│  │  │        ├─ slideshow.dart
│  │  │        └─ widgets.dart
│  │  ├─ catalog
│  │  │  ├─ deals
│  │  │  │  ├─ domain
│  │  │  │  │  ├─ datasources
│  │  │  │  │  │  └─ deal_details_datasource.dart
│  │  │  │  │  ├─ entities
│  │  │  │  │  │  └─ DealDetail.dart
│  │  │  │  │  └─ repositories
│  │  │  │  │     └─ deal_details_repository.dart
│  │  │  │  ├─ infrastructure
│  │  │  │  │  ├─ datasources
│  │  │  │  │  │  └─ deal_details_datasource_impl.dart
│  │  │  │  │  └─ repositories
│  │  │  │  │     └─ deal_details_repository_impl.dart
│  │  │  │  └─ presentation
│  │  │  │     ├─ presentation.dart
│  │  │  │     ├─ screens
│  │  │  │     │  ├─ deal_detail_screen.dart
│  │  │  │     │  └─ screens.dart
│  │  │  │     └─ widgets
│  │  │  └─ restaurants
│  │  ├─ explore
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ explore.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ screens
│  │  │     │  ├─ explore_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  ├─ favorites
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ favorites.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ screens
│  │  │     │  ├─ favorites_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  ├─ home
│  │  │  ├─ domain
│  │  │  ├─ home.dart
│  │  │  ├─ infrastructure
│  │  │  └─ presentation
│  │  │     ├─ presentation.dart
│  │  │     ├─ providers
│  │  │     │  ├─ navigation_provider.dart
│  │  │     │  └─ providers.dart
│  │  │     ├─ screens
│  │  │     │  ├─ home_screen.dart
│  │  │     │  └─ screens.dart
│  │  │     └─ widgets
│  │  │        ├─ custom_bottom_navbar.dart
│  │  │        └─ widgets.dart
│  │  ├─ profile
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  ├─ entities
│  │  │  │  └─ repositories
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  ├─ mappers
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  ├─ presentation
│  │  │  │  ├─ presentation.dart
│  │  │  │  ├─ screens
│  │  │  │  │  ├─ profile_screen.dart
│  │  │  │  │  └─ screens.dart
│  │  │  │  └─ widgets
│  │  │  └─ profile.dart
│  │  ├─ shared
│  │  │  ├─ data
│  │  │  │  └─ mock
│  │  │  │     ├─ mock_deals.dart
│  │  │  │     ├─ mock_deals.json
│  │  │  │     └─ mock_restaurants.json
│  │  │  ├─ domain
│  │  │  │  ├─ datasources
│  │  │  │  │  ├─ deals_datasource.dart
│  │  │  │  │  └─ restaurants_datasource.dart
│  │  │  │  ├─ domain.dart
│  │  │  │  ├─ entities
│  │  │  │  │  ├─ deal.dart
│  │  │  │  │  └─ restaurant.dart
│  │  │  │  ├─ models
│  │  │  │  └─ repositories
│  │  │  │     ├─ deals_repository.dart
│  │  │  │     └─ restaurants_repository.dart
│  │  │  ├─ infrastructure
│  │  │  │  ├─ datasources
│  │  │  │  │  ├─ deals_datasource_impl.dart
│  │  │  │  │  └─ restaurants_datasource_impl.dart
│  │  │  │  ├─ providers
│  │  │  │  │  ├─ deals_provider.dart
│  │  │  │  │  ├─ deals_repository_provider.dart
│  │  │  │  │  ├─ deals_state.dart
│  │  │  │  │  ├─ deal_provider.dart
│  │  │  │  │  ├─ providers.dart
│  │  │  │  │  ├─ restaurants_provider.dart
│  │  │  │  │  ├─ restaurants_repository_provider.dart
│  │  │  │  │  ├─ restaurants_state.dart
│  │  │  │  │  └─ restaurant_provider.dart
│  │  │  │  ├─ repositories
│  │  │  │  │  ├─ deals_repository_impl.dart
│  │  │  │  │  └─ restaurants_repository_impl.dart
│  │  │  │  └─ services
│  │  │  │     ├─ key_value_storage_service.dart
│  │  │  │     ├─ key_value_storage_service_impl.dart
│  │  │  │     ├─ secure_storage_service.dart
│  │  │  │     └─ secutre_storage_service_impl.dart
│  │  │  ├─ presentation
│  │  │  │  ├─ providers
│  │  │  │  │  └─ theme_provider.dart
│  │  │  │  ├─ screens
│  │  │  │  └─ widgets
│  │  │  │     ├─ custom_fille_button.dart
│  │  │  │     └─ widgets.dart
│  │  │  └─ providers
│  │  │     ├─ key_value_storage_service.dart
│  │  │     └─ shared_provider.dart
│  │  └─ today
│  │     ├─ domain
│  │     │  ├─ datasources
│  │     │  ├─ entities
│  │     │  └─ repositories
│  │     ├─ infrastructure
│  │     │  ├─ datasources
│  │     │  ├─ mappers
│  │     │  ├─ models
│  │     │  └─ repositories
│  │     ├─ presentation
│  │     │  ├─ presentation.dart
│  │     │  ├─ providers.dart
│  │     │  │  ├─ all_deals_provider.dart
│  │     │  │  └─ deals_slideshow_provider.dart
│  │     │  ├─ screens
│  │     │  │  ├─ screens.dart
│  │     │  │  └─ today_screen.dart
│  │     │  └─ widgets
│  │     │     ├─ category_chips_widget.dart
│  │     │     ├─ deal_card_widget.dart
│  │     │     ├─ deal_horizontal_listview.dart
│  │     │     ├─ hero_carousel_widget.dart
│  │     │     ├─ location_header_widget.dart
│  │     │     ├─ popular_deal_section_widget.dart
│  │     │     ├─ restaurant_horizontal_listview.dart
│  │     │     ├─ search_bar_widget.dart
│  │     │     └─ widgets.dart
│  │     └─ today.dart
│  └─ main.dart
├─ linux
│  ├─ CMakeLists.txt
│  ├─ flutter
│  │  ├─ CMakeLists.txt
│  │  ├─ ephemeral
│  │  │  └─ .plugin_symlinks
│  │  │     ├─ flutter_secure_storage_linux
│  │  │     │  ├─ CHANGELOG.md
│  │  │     │  ├─ LICENSE
│  │  │     │  ├─ linux
│  │  │     │  │  ├─ CMakeLists.txt
│  │  │     │  │  ├─ flutter_secure_storage_linux_plugin.cc
│  │  │     │  │  └─ include
│  │  │     │  │     ├─ FHashTable.hpp
│  │  │     │  │     ├─ flutter_secure_storage_linux
│  │  │     │  │     │  └─ flutter_secure_storage_linux_plugin.h
│  │  │     │  │     ├─ json.hpp
│  │  │     │  │     └─ Secret.hpp
│  │  │     │  ├─ pubspec.yaml
│  │  │     │  └─ README.md
│  │  │     ├─ path_provider_linux
│  │  │     │  ├─ AUTHORS
│  │  │     │  ├─ CHANGELOG.md
│  │  │     │  ├─ example
│  │  │     │  │  ├─ integration_test
│  │  │     │  │  │  └─ path_provider_test.dart
│  │  │     │  │  ├─ lib
│  │  │     │  │  │  └─ main.dart
│  │  │     │  │  ├─ linux
│  │  │     │  │  │  ├─ CMakeLists.txt
│  │  │     │  │  │  ├─ flutter
│  │  │     │  │  │  │  ├─ CMakeLists.txt
│  │  │     │  │  │  │  └─ generated_plugins.cmake
│  │  │     │  │  │  ├─ main.cc
│  │  │     │  │  │  ├─ my_application.cc
│  │  │     │  │  │  └─ my_application.h
│  │  │     │  │  ├─ pubspec.yaml
│  │  │     │  │  ├─ README.md
│  │  │     │  │  └─ test_driver
│  │  │     │  │     └─ integration_test.dart
│  │  │     │  ├─ lib
│  │  │     │  │  ├─ path_provider_linux.dart
│  │  │     │  │  └─ src
│  │  │     │  │     ├─ get_application_id.dart
│  │  │     │  │     ├─ get_application_id_real.dart
│  │  │     │  │     ├─ get_application_id_stub.dart
│  │  │     │  │     └─ path_provider_linux.dart
│  │  │     │  ├─ LICENSE
│  │  │     │  ├─ pubspec.yaml
│  │  │     │  ├─ README.md
│  │  │     │  └─ test
│  │  │     │     ├─ get_application_id_test.dart
│  │  │     │     └─ path_provider_linux_test.dart
│  │  │     └─ shared_preferences_linux
│  │  │        ├─ AUTHORS
│  │  │        ├─ CHANGELOG.md
│  │  │        ├─ example
│  │  │        │  ├─ integration_test
│  │  │        │  │  └─ shared_preferences_test.dart
│  │  │        │  ├─ lib
│  │  │        │  │  └─ main.dart
│  │  │        │  ├─ linux
│  │  │        │  │  ├─ CMakeLists.txt
│  │  │        │  │  ├─ flutter
│  │  │        │  │  │  ├─ CMakeLists.txt
│  │  │        │  │  │  └─ generated_plugins.cmake
│  │  │        │  │  ├─ main.cc
│  │  │        │  │  ├─ my_application.cc
│  │  │        │  │  └─ my_application.h
│  │  │        │  ├─ pubspec.yaml
│  │  │        │  ├─ README.md
│  │  │        │  └─ test_driver
│  │  │        │     └─ integration_test.dart
│  │  │        ├─ lib
│  │  │        │  └─ shared_preferences_linux.dart
│  │  │        ├─ LICENSE
│  │  │        ├─ pubspec.yaml
│  │  │        ├─ README.md
│  │  │        └─ test
│  │  │           ├─ fake_path_provider_linux.dart
│  │  │           ├─ legacy_shared_preferences_linux_test.dart
│  │  │           └─ shared_preferences_linux_async_test.dart
│  │  ├─ generated_plugins.cmake
│  │  ├─ generated_plugin_registrant.cc
│  │  └─ generated_plugin_registrant.h
│  └─ runner
│     ├─ CMakeLists.txt
│     ├─ main.cc
│     ├─ my_application.cc
│     └─ my_application.h
├─ macos
│  ├─ Flutter
│  │  ├─ ephemeral
│  │  │  ├─ Flutter-Generated.xcconfig
│  │  │  └─ flutter_export_environment.sh
│  │  ├─ Flutter-Debug.xcconfig
│  │  ├─ Flutter-Release.xcconfig
│  │  └─ GeneratedPluginRegistrant.swift
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  └─ AppIcon.appiconset
│  │  │     ├─ app_icon_1024.png
│  │  │     ├─ app_icon_128.png
│  │  │     ├─ app_icon_16.png
│  │  │     ├─ app_icon_256.png
│  │  │     ├─ app_icon_32.png
│  │  │     ├─ app_icon_512.png
│  │  │     ├─ app_icon_64.png
│  │  │     └─ Contents.json
│  │  ├─ Base.lproj
│  │  │  └─ MainMenu.xib
│  │  ├─ Configs
│  │  │  ├─ AppInfo.xcconfig
│  │  │  ├─ Debug.xcconfig
│  │  │  ├─ Release.xcconfig
│  │  │  └─ Warnings.xcconfig
│  │  ├─ DebugProfile.entitlements
│  │  ├─ Info.plist
│  │  ├─ MainFlutterWindow.swift
│  │  └─ Release.entitlements
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ xcshareddata
│  │  │     └─ IDEWorkspaceChecks.plist
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     └─ IDEWorkspaceChecks.plist
│  └─ RunnerTests
│     └─ RunnerTests.swift
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ web
│  ├─ favicon.png
│  ├─ icons
│  │  ├─ Icon-192.png
│  │  ├─ Icon-512.png
│  │  ├─ Icon-maskable-192.png
│  │  └─ Icon-maskable-512.png
│  ├─ index.html
│  └─ manifest.json
└─ windows
   ├─ CMakeLists.txt
   ├─ flutter
   │  ├─ CMakeLists.txt
   │  ├─ ephemeral
   │  │  └─ .plugin_symlinks
   │  │     ├─ flutter_secure_storage_windows
   │  │     │  ├─ analysis_options.yaml
   │  │     │  ├─ CHANGELOG.md
   │  │     │  ├─ example
   │  │     │  │  ├─ analysis_options.yaml
   │  │     │  │  ├─ integration_test
   │  │     │  │  │  └─ app_test.dart
   │  │     │  │  ├─ lib
   │  │     │  │  │  └─ main.dart
   │  │     │  │  ├─ pubspec.yaml
   │  │     │  │  ├─ README.md
   │  │     │  │  └─ windows
   │  │     │  │     ├─ CMakeLists.txt
   │  │     │  │     ├─ flutter
   │  │     │  │     │  ├─ CMakeLists.txt
   │  │     │  │     │  ├─ generated_plugins.cmake
   │  │     │  │     │  ├─ generated_plugin_registrant.cc
   │  │     │  │     │  └─ generated_plugin_registrant.h
   │  │     │  │     └─ runner
   │  │     │  │        ├─ CMakeLists.txt
   │  │     │  │        ├─ flutter_window.cpp
   │  │     │  │        ├─ flutter_window.h
   │  │     │  │        ├─ main.cpp
   │  │     │  │        ├─ resource.h
   │  │     │  │        ├─ resources
   │  │     │  │        │  └─ app_icon.ico
   │  │     │  │        ├─ runner.exe.manifest
   │  │     │  │        ├─ Runner.rc
   │  │     │  │        ├─ utils.cpp
   │  │     │  │        ├─ utils.h
   │  │     │  │        ├─ win32_window.cpp
   │  │     │  │        └─ win32_window.h
   │  │     │  ├─ lib
   │  │     │  │  ├─ flutter_secure_storage_windows.dart
   │  │     │  │  └─ src
   │  │     │  │     ├─ flutter_secure_storage_windows_ffi.dart
   │  │     │  │     └─ flutter_secure_storage_windows_stub.dart
   │  │     │  ├─ LICENSE
   │  │     │  ├─ pubspec.yaml
   │  │     │  ├─ README.md
   │  │     │  ├─ test
   │  │     │  │  └─ unit_test.dart
   │  │     │  └─ windows
   │  │     │     ├─ CMakeLists.txt
   │  │     │     ├─ flutter_secure_storage_windows_plugin.cpp
   │  │     │     └─ include
   │  │     │        └─ flutter_secure_storage_windows
   │  │     │           └─ flutter_secure_storage_windows_plugin.h
   │  │     ├─ path_provider_windows
   │  │     │  ├─ AUTHORS
   │  │     │  ├─ CHANGELOG.md
   │  │     │  ├─ example
   │  │     │  │  ├─ integration_test
   │  │     │  │  │  └─ path_provider_test.dart
   │  │     │  │  ├─ lib
   │  │     │  │  │  └─ main.dart
   │  │     │  │  ├─ pubspec.yaml
   │  │     │  │  ├─ README.md
   │  │     │  │  ├─ test_driver
   │  │     │  │  │  └─ integration_test.dart
   │  │     │  │  └─ windows
   │  │     │  │     ├─ CMakeLists.txt
   │  │     │  │     ├─ flutter
   │  │     │  │     │  ├─ CMakeLists.txt
   │  │     │  │     │  └─ generated_plugins.cmake
   │  │     │  │     └─ runner
   │  │     │  │        ├─ CMakeLists.txt
   │  │     │  │        ├─ flutter_window.cpp
   │  │     │  │        ├─ flutter_window.h
   │  │     │  │        ├─ main.cpp
   │  │     │  │        ├─ resource.h
   │  │     │  │        ├─ resources
   │  │     │  │        │  └─ app_icon.ico
   │  │     │  │        ├─ runner.exe.manifest
   │  │     │  │        ├─ Runner.rc
   │  │     │  │        ├─ run_loop.cpp
   │  │     │  │        ├─ run_loop.h
   │  │     │  │        ├─ utils.cpp
   │  │     │  │        ├─ utils.h
   │  │     │  │        ├─ win32_window.cpp
   │  │     │  │        └─ win32_window.h
   │  │     │  ├─ lib
   │  │     │  │  ├─ path_provider_windows.dart
   │  │     │  │  └─ src
   │  │     │  │     ├─ folders.dart
   │  │     │  │     ├─ folders_stub.dart
   │  │     │  │     ├─ guid.dart
   │  │     │  │     ├─ path_provider_windows_real.dart
   │  │     │  │     ├─ path_provider_windows_stub.dart
   │  │     │  │     └─ win32_wrappers.dart
   │  │     │  ├─ LICENSE
   │  │     │  ├─ pubspec.yaml
   │  │     │  ├─ README.md
   │  │     │  └─ test
   │  │     │     ├─ guid_test.dart
   │  │     │     └─ path_provider_windows_test.dart
   │  │     └─ shared_preferences_windows
   │  │        ├─ AUTHORS
   │  │        ├─ CHANGELOG.md
   │  │        ├─ example
   │  │        │  ├─ AUTHORS
   │  │        │  ├─ integration_test
   │  │        │  │  └─ shared_preferences_test.dart
   │  │        │  ├─ lib
   │  │        │  │  └─ main.dart
   │  │        │  ├─ LICENSE
   │  │        │  ├─ pubspec.yaml
   │  │        │  ├─ README.md
   │  │        │  ├─ test_driver
   │  │        │  │  └─ integration_test.dart
   │  │        │  └─ windows
   │  │        │     ├─ CMakeLists.txt
   │  │        │     ├─ flutter
   │  │        │     │  ├─ CMakeLists.txt
   │  │        │     │  └─ generated_plugins.cmake
   │  │        │     └─ runner
   │  │        │        ├─ CMakeLists.txt
   │  │        │        ├─ flutter_window.cpp
   │  │        │        ├─ flutter_window.h
   │  │        │        ├─ main.cpp
   │  │        │        ├─ resource.h
   │  │        │        ├─ resources
   │  │        │        │  └─ app_icon.ico
   │  │        │        ├─ runner.exe.manifest
   │  │        │        ├─ Runner.rc
   │  │        │        ├─ run_loop.cpp
   │  │        │        ├─ run_loop.h
   │  │        │        ├─ utils.cpp
   │  │        │        ├─ utils.h
   │  │        │        ├─ win32_window.cpp
   │  │        │        └─ win32_window.h
   │  │        ├─ lib
   │  │        │  └─ shared_preferences_windows.dart
   │  │        ├─ LICENSE
   │  │        ├─ pubspec.yaml
   │  │        ├─ README.md
   │  │        └─ test
   │  │           ├─ fake_path_provider_windows.dart
   │  │           ├─ legacy_shared_preferences_windows_test.dart
   │  │           └─ shared_preferences_windows_async_test.dart
   │  ├─ generated_plugins.cmake
   │  ├─ generated_plugin_registrant.cc
   │  └─ generated_plugin_registrant.h
   └─ runner
      ├─ CMakeLists.txt
      ├─ flutter_window.cpp
      ├─ flutter_window.h
      ├─ main.cpp
      ├─ resource.h
      ├─ resources
      │  └─ app_icon.ico
      ├─ runner.exe.manifest
      ├─ Runner.rc
      ├─ utils.cpp
      ├─ utils.h
      ├─ win32_window.cpp
      └─ win32_window.h

```