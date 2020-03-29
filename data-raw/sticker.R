## Making a hex sticker for BFS
library(hexSticker)
library(magick)
library(magrittr)
library(showtext)

font_add_google("Open Sans")
showtext_auto()

# ref: "https://upload.wikimedia.org/wikipedia/commons/d/df/Chevron_up_font_awesome.svg"
hexSticker::sticker("man/figures/Chevron_up_font_awesome_blue.svg",
                    package = "goTop",
                    p_color = "#2466B0",
                    p_family = "Open Sans",
                    p_size = 7.5,
                    p_y = 0.6,
                    spotlight = FALSE,
                    h_size = 2,
                    h_color = "#2466B0",
                    h_fill = "white",
                    s_x = 1, 
                    s_y = 1.15, 
                    s_width = 0.6,
                    url="",
                    u_size = 1,
                    u_color = "#2466B0",
                    filename="man/figures/logo_large.png")

# MOD with Gimp: removing red borders.

gotop <- magick::image_read("man/figures/logo_large.png")
magick::image_scale(gotop, "130") %>%
  magick::image_write(path = "man/figures/logo.png", format = "png")

