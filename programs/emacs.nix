{ config, pkgs, ... }:

let
  emacs = "${config.programs.emacs.finalPackage}/bin/emacs";

  # Emacs natively compiles packages lazily, in bursts, while you're using it.
  # Doing the whole set up front in one batch keeps the interactive session
  # responsive. Worth re-running after an Emacs version bump: the eln cache is
  # keyed by build, so an upgrade invalidates all of it.
  nativeCompile = pkgs.writeText "doom-native-compile.el" ''
    (require 'comp-run)

    ;; A batch Emacs knows nothing of Doom, so it would write to the stock
    ;; ~/.config/emacs/eln-cache/. Doom redirects elsewhere precisely because
    ;; `doom upgrade' can wipe that directory, so write where Doom does.
    (startup-redirect-eln-cache "~/.config/emacs/.local/cache/eln/")

    ;; The default job count (half of `num-processors') counts logical CPUs,
    ;; which on this machine is 18 against only 6 performance cores. That
    ;; oversubscribes them and starves the UI.
    (setq native-comp-async-jobs-number
          (string-to-number (or (getenv "DOOM_NATIVE_COMP_JOBS") "4"))
          native-comp-async-report-warnings-errors nil)

    (let ((dir (expand-file-name
                (concat "~/.config/emacs/.local/straight/build-" emacs-version)))
          ;; Doom never loads a package's test suite, and the native compiler
          ;; chokes on some of them -- seq-tests.el alone pins a core for well
          ;; over twenty minutes.
          (test-file-p
           (lambda (f)
             (let ((base (file-name-base f)))
               (or (string-prefix-p "test-" base)
                   (string-suffix-p "-test" base)
                   (string-suffix-p "-tests" base))))))
      (native-compile-async
       (seq-remove test-file-p (directory-files-recursively dir "\\.el\\'"))))

    (while (or comp-files-queue (> (comp--async-runnings) 0))
      (sleep-for 1))
  '';
in
{
  # The emacsformacosx.com build ships without native compilation. The nixpkgs
  # build enables it (--with-native-compilation, libgccjit in the closure), and
  # is substituted from cache.nixos.org rather than built locally.
  #
  # Left unwrapped on purpose: Doom manages its own packages through straight,
  # so there is nothing to put in `extraPackages`.
  programs.emacs.enable = true;

  # Doom's bin/doom dispatcher runs whatever $EMACS points at. Deriving it from
  # finalPackage keeps it correct across upgrades and avoids depending on the
  # profile's bin/ ordering.
  home.sessionVariables = {
    EMACS = "${emacs}";
  };

  home.packages = [
    # Job count is overridable: `doom-native-compile 8`.
    (pkgs.writeShellScriptBin "doom-native-compile" ''
      set -euo pipefail
      export DOOM_NATIVE_COMP_JOBS="''${1:-4}"
      exec ${emacs} --batch -l ${nativeCompile}
    '')
  ];
}
