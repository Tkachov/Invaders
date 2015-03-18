#CFLAGS = -DCEU_RUNTESTS -DCEU_DEBUG #-DCEU_DEBUG_TRAILS
COMPILER = gcc
#COMPILER = /cygdrive/d/Programs/CodeBlocks/MinGW/bin/gcc
CEUFILE = main.ceu

all:
	ceu --cpp-args "-I ." $(CEUFILE)
	#gcc main.c $(CFLAGS) -lSDL2
	$(COMPILER) \
		-g -Os main.c $(CFLAGS) -lm -lpthread \
		-I/usr/local/include/SDL2 -I/usr/local/include -I/usr/include/mingw -L/usr/local/lib \
		-lcygwin -lSDL2main -lSDL2  -mwindows \
		-lSDL2main -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net -lSDL2_gfx \
		-o $(basename $(CEUFILE)).exe

clean:
	find . -name "*.exe"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean
