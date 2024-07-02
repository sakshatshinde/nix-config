{
  config,
  pkgs,
  ...
}: {
  programs.tofi.enable = true;

  programs.tofi.settings = {
    # font = "Fira Code";
    font-size = "16";
    prompt-color = "#f38ba8";
    selection-color = "#f9e2af";
    text-color = "#b4befe";
    background-color = "#1e1e2e";

    outline-width = 0;
    prompt-text = "run";
    border-width = "0";

    hide-cursor = true;
    ascii-input = true;
    num-results = 5;
    width = "50%";
    height = "40%";
  };
}
