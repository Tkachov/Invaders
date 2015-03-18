CEUFILE = main.ceu
OUTFILE = bin/game.exe
#OUTFILE = $(basename $(CEUFILE)).exe

COMPILER = gcc
#COMPILER = /cygdrive/d/Programs/CodeBlocks/MinGW/bin/gcc

INCLUDE_PATHS = -I/usr/local/include/SDL2 -I/usr/local/include -I/usr/include/mingw
LIBS_PATHS = -L/usr/local/lib
LINK_WITH = -lm -lpthread -lcygwin -lSDL2main -lSDL2  -mwindows -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx

CFLAGS = -g -Os $(INCLUDE_PATHS) $(LIBS_PATHS) $(LINK_WITH) -o $(OUTFILE)
#CFLAGS = -DCEU_RUNTESTS -DCEU_DEBUG #-DCEU_DEBUG_TRAILS

all:
	ceu --cpp-args "-I ." $(CEUFILE)
	$(COMPILER) main.c $(CFLAGS)

clean:
	rm $(OUTFILE)
	find . -name "*.exe"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean
