{
    system.defaults = {
        NSGlobalDomain = {
            # Mouse and trackpad
            "com.apple.trackpad.scaling" = 3.0;
            # "com.apple.mouse.scaling" = -1; # No mouse acceleration

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
        
        # Finder
        NSGlobalDomain.AppleShowAllExtensions = true;
        finder.AppleShowAllExtensions = true;
        finder.FXEnableExtensionChangeWarning = false;

        loginwindow.GuestEnabled = false;
    };
}