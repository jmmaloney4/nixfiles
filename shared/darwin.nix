{config, pkgs, ...}:
{
    # system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
    system.defaults = {
        # ".GlobalPreferences" = {
        #     # Mouse and trackpad
        #     
        #     "com.apple.mouse.scaling" = -1; # No mouse acceleration
        # };
        NSGlobalDomain = {
            "com.apple.trackpad.scaling" = 1.0;
            
            # Keyboard
            InitialKeyRepeat = 15;
            KeyRepeat = 2;
            NSAutomaticCapitalizationEnabled = false;
            NSAutomaticDashSubstitutionEnabled = false;
            NSAutomaticPeriodSubstitutionEnabled = false;

            # Interface
            _HIHideMenuBar = false;
            PMPrintingExpandedStateForPrint = true;
            AppleInterfaceStyleSwitchesAutomatically = true;
            AppleMeasurementUnits = "Centimeters";
            AppleMetricUnits = 1;
            AppleShowScrollBars = "Automatic";
            AppleTemperatureUnit = "Fahrenheit";
        };

        CustomSystemPreferences = {
            "com.apple.Preview" = {
                "com.apple.Preview.kPVPDFDefaultPageViewModeOption" = 1;
            };
        };
        
        
        # Finder
        NSGlobalDomain.AppleShowAllExtensions = true;
        finder.AppleShowAllExtensions = true;
        finder.FXEnableExtensionChangeWarning = false;

        loginwindow.GuestEnabled = false;
    };
}