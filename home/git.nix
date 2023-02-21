{ config, pkgs, ... }:
{
    programs.git = {
        enable = true;
        lfs.enable = true;
        delta.enable = true;

        userName = "Jack Maloney";
        userEmail = "jack@maloney.ai";

        extraConfig.pull.rebase = true;
        
        aliases = {
            a = "add -A";
            s = "status";
            f = "fetch";
            co = "checkout";
            cp = "cherry-pick";
            ff = "merge --ff-only";
            rb = "rebase";
            p = "pull";

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

        extraConfig.gpg.format = "ssh";
        extraConfig.gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        extraConfig.gpg.ssh.allowedSignersFile = "~/.allowed_signers";
        signing = {
            key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDC/GWpEzz27GGo+bDiOV7Nw/TNXfreLTm50XxAiXRW610QwNzg/8O/rJ4Ybj20S7VUQluATICbA/R3W32qrhs7dW7LhIYA9krq8OVYqckE+II9qi9uNze8BZeris+RqhmBYhqxungRr3pMfKmZLsMyBHQPkIPceMGjrxENxJiwfcGnY1hh5d2DeyGcihpNGIdRZdDrxSvuDnuqATxatMeLnnvo03MrJjBNv1nowswBXyhpBsPuI/ZGv3ZWVcW/kmtO6r4YBkXYTVR6VufEjeCFwPV7/tguoFdXkhtC8l07iNUjxj1KX9wK9V9z2Bndf5UttOFYKs5hG1679EgSkij6FgFrmKII0SEHlbFBB41v9mbbeHrm+KjZfHjkLGWDHRJl1jRLfEx2oceZki62SRPPnmu3SySYTypippGKwx3TSegHtkIRfwjCV2Xqkd17VO2co/U/6JQ6ML68bZk1x2PLq+zP+uZ4Gxutj7TRJiGk7O8Vcu+ixYZ6hmm6r7TQOh3LWCIHll/EK/ymsHhq8UhXKN5X4BWSf2JxhvgoDbkbRKwexF0RMM17vqTdc22M1LOitR0dtHUsrPaEjnWlCKpeAtL3XYob2O1U96G2Xa7/eeVfEAgVV/iXsIfpRfSDPFQGPyBlYUxHKpaNC/QTBFfCzzpE12PAsl1rJpE83yKOLQ==";
            signByDefault = true;
            # gpgPath = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };

        extraConfig.init.defaultBranch = "main";
    };

    home.file.".allowed_signers".text = ''
        jack@maloney.ai ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDC/GWpEzz27GGo+bDiOV7Nw/TNXfreLTm50XxAiXRW610QwNzg/8O/rJ4Ybj20S7VUQluATICbA/R3W32qrhs7dW7LhIYA9krq8OVYqckE+II9qi9uNze8BZeris+RqhmBYhqxungRr3pMfKmZLsMyBHQPkIPceMGjrxENxJiwfcGnY1hh5d2DeyGcihpNGIdRZdDrxSvuDnuqATxatMeLnnvo03MrJjBNv1nowswBXyhpBsPuI/ZGv3ZWVcW/kmtO6r4YBkXYTVR6VufEjeCFwPV7/tguoFdXkhtC8l07iNUjxj1KX9wK9V9z2Bndf5UttOFYKs5hG1679EgSkij6FgFrmKII0SEHlbFBB41v9mbbeHrm+KjZfHjkLGWDHRJl1jRLfEx2oceZki62SRPPnmu3SySYTypippGKwx3TSegHtkIRfwjCV2Xqkd17VO2co/U/6JQ6ML68bZk1x2PLq+zP+uZ4Gxutj7TRJiGk7O8Vcu+ixYZ6hmm6r7TQOh3LWCIHll/EK/ymsHhq8UhXKN5X4BWSf2JxhvgoDbkbRKwexF0RMM17vqTdc22M1LOitR0dtHUsrPaEjnWlCKpeAtL3XYob2O1U96G2Xa7/eeVfEAgVV/iXsIfpRfSDPFQGPyBlYUxHKpaNC/QTBFfCzzpE12PAsl1rJpE83yKOLQ==
    '';
}
