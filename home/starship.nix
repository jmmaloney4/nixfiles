{
    programs.starship.enable = true;
    programs.starship.settings = {
        battery = {
            full_symbol = "";
            charging_symbol = "";
            discharging_symbol = "";
            unknown_symbol = "";
            empty_symbol = "!";
        };

        battery.display = [
            { threshold = 10; style = "bold red"; }
            { threshold = 30; style = "bold yellow"; }
            { threshold = 100; style = "bold green"; }
        ];

        character = {
            error_symbol = "[✖](bold red) ";
        };

        cmd_duration = {
            min_time = 100;
            format = "took [$duration]($style)";
            show_notifications = true;
        };

        directory = {
            truncation_length = 5;
            truncate_to_repo = false;
            format = "[$path]($style)[$lock_symbol]($lock_style) ";
            disabled = false;
        };

        git_commit = {
            commit_hash_length = 8;
            style = "bold white";
            disabled = false;
            only_detached = false;
            tag_disabled = false;
        };

        git_status = {
            conflicted = "⚔️ ";
            ahead = "🏎️ ×\${count} ";
            behind = "🐢 ×\${count} ";
            diverged = "🔱 🏎️ ×\${ahead_count} 🐢 ×\${behind_count} ";
            untracked = "🛤️  ×\${count} ";
            stashed = "📦 ";
            modified = "📝 ×\${count} ";
            staged = "🗃️  ×\${count} ";
            renamed = "📛 ×\${count} ";
            deleted = "🗑️  ×\${count} ";
            style = "bright-white";
            format = "$all_status$ahead_behind";
        };

        username = {
            style_user = "bold dimmed blue";
            show_always = true;
            disabled = false;
            format = "[$user]($style)@";
        };

        hostname = {
            ssh_only = false;
            trim_at = "-";
            style = "bold dimmed white";
            disabled = false;
        };

        julia = {
            format = "[$symbol$version]($style) ";
            symbol = "ஃ ";
            style = "bold green";
        };

        package = {
            disabled = true;
        };

        python = {
            format = "[$symbol$version]($style) ";
            style = "bold green";
        };

        rust = {
            format = "[$symbol$version]($style) ";
            style = "bold green";
        };

        time = {
            time_format = "%T";
            format = "$time($style) ";
            style = "bright-white";
            disabled = false;
        };
    };
}