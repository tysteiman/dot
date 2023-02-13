{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tyler";
  home.homeDirectory = "/home/tyler";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  home.packages = [
    pkgs.slack
    pkgs.nerdfonts
    pkgs.libreoffice
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git.enable = true;
  programs.git.userEmail = "tsteiman@switchboxinc.com";
  programs.git.userName = "Tyler Steiman";

  programs.firefox.enable = true;
  # programs.ssh.enable = true;

  programs.tmux.enable = true;

  programs.vim.enable = true;
  programs.vim.extraConfig = ''
  syntax on
  
  set noswapfile
  set nowrap
  set incsearch
  set hlsearch
  set ignorecase
  set smarttab
  set expandtab
  set shiftwidth=4
  set tabstop=4
  set softtabstop=4
  set autoindent
  set path+=**
  set wildmenu
  
  inoremap jk <esc>
  
  function Set_2_Spaces()
      setlocal shiftwidth=2
      setlocal tabstop=2
      setlocal softtabstop=2
  endfunction
  
  au Filetype ruby call Set_2_Spaces()
  au Filetype yaml call Set_2_Spaces()
  '';
}
