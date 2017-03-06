One Gvim on linux, there is an ugly border when the screen is maximized.

This can be fixed by writing the following to ~/.gtkrc-2.0

```css
style "vimfix" {
  bg[NORMAL] = "#242424" # this matches my gvim theme 'Normal' bg color.
}
widget "vim-main-window.*GtkForm" style "vimfix"
```
