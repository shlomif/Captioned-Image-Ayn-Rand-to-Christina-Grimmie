SVG = Ayn_Rand--to--Christina_Grimmie.svg
PNG = $(SVG).png
JPEG = $(SVG).jpg
WEBP = $(SVG).webp

WIDTH = 600

all: $(PNG) $(JPEG) $(WEBP)

$(PNG): $(SVG)
	inkscape --export-type=png --export-filename=$@ --export-width=$(WIDTH) $<

$(JPEG): $(PNG)
	gm convert $< $@

$(WEBP): $(PNG)
	gm convert $< $@

upload: all
	rsync --progress -v -a --inplace $(PNG) $(SVG) $(WEBP) *.jpg $(__HOMEPAGE_REMOTE_PATH)/evolution-of-girls-with-weapons
