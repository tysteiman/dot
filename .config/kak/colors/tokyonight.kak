# tokyonight theme

# This was ported from https://github.com/ghifarit53/tokyonight-vim/blob/master/colors/tokyonight.vim

evaluate-commands %sh{
    red=rgb:F7768E
    light_red=rgb:803d49
    dark_red=rgb:ff7a93
    green=rgb:9ECE6A
    yellow=rgb:E0AF68
    dark_yellow=rgb:E0AF68
    blue=rgb:7AA2F7
    purple=rgb:ad8ee6
    cyan=rgb:FF9E64
    white=rgb:a9b1d6
    black=rgb:1a1b26
    comment_grey=rgb:3b3d57
    gutter_fg_grey=rgb:3b3d57
    cursor_grey=rgb:3b3d57
    visual_grey=rgb:3e4452
    menu_grey=rgb:444B6A
    special_grey=rgb:3b4048
    vertsplit=rgb:181a1f
    visual_black=default

    printf "%s\n" "
    # Code
    face global value         $dark_yellow
    face global type          $yellow
    face global function      $blue
    face global variable      $blue
    face global identifier    $blue
    face global string        $green
    face global error         rgb:c3bf9f+b
    face global keyword       $purple
    face global operator      $cyan
    face global attribute     rgb:eedc82
    face global comment       $comment_grey+i
    face global documentation comment

    # #include <...>
    face global meta       $yellow

    # Markup
    face global title  $blue
    face global header $cyan
    face global mono   $green
    face global block  $purple
    face global link   $cyan
    face global bullet $cyan
    face global list   $yellow

    # Builtin
    face global Default            $white,$black

    face global PrimarySelection   $black,$white+bfg
    face global SecondarySelection $black,$white+fg

    face global PrimaryCursor      white,$purple+bfg
    face global SecondaryCursor    $black,$purple+fg

    face global PrimaryCursorEol   $black,$green+fg
    face global SecondaryCursorEol $black,$green+fg

    face global LineNumbers        $gutter_fg_grey
    face global LineNumberCursor   $blue,default+b

    # Bottom menu:
    # text + background
    face global MenuBackground     $white,$menu_grey
    face global MenuForeground     $black,$blue

    # completion menu info
    face global MenuInfo           $menu_grey,default+i

    # assistant, [+]
    face global Information        $white,$visual_grey

    face global Error              $blue,$comment_grey
    face global DiagnosticError    $red
    face global DiagnosticWarning  $yellow
    face global StatusLine         $white,$black

    # Status line
    face global StatusLineMode     $black,$purple      # insert, prompt, enter key ...
    face global StatusLineInfo     $white,$visual_grey # 1 sel
    face global StatusLineValue    $visual_grey,$green # param=value, reg=value. ex: \"ey
    face global StatusCursor       white,$purple+bg

    face global Prompt             $purple,$black # :
    face global MatchingChar       $red+b         # (), {}
    face global BufferPadding      $gutter_fg_grey,$black   # EOF tildas (~)

    # Whitespace characters
    face global Whitespace         $gutter_fg_grey,$black+fg
    "
}
