{ config, pkgs, ... }:
{
    programs.git = {
        enable = true;
        lfs.enable = true;
        delta.enable = true;

        aliases = {
            a = "add -A";
            s = "status";
            f = "fetch";
            co = "checkout";
            cp = "cherry-pick";
            ff = "merge --ff-only";

            remotes  = "remote -v show";
            branches = "branch -a -vv";
            dc       = "diff --cached";

            lg = ''log --full-history --graph --color --pretty=format:"%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%C(blue)%x20(%ce)%x20%C(cyan)[gpg:%GK%x20%G?]%C(reset)%n%x20%s%n"'';
            graph = "lg --all";
            tree = "graph --oneline";
        };
        
        ignores = [
            "*~"
            "**/.DS_Store"
            ".DocumentRevisions-V100"
            ".fseventsd"
            ".Spotlight-V100"
            ".TemporaryItems"
            ".Trashes"
            ".VolumeIcon.icns"
            ".com.apple.timemachine.donotpresent"
            "secring.*"
        ];

        # signing = {
        #     signByDefault = true;
        #     # gpgPath = 
        # };
    };
}