UNAME_S=$(shell uname -s)
SRC_FOLDER=src

EXEC=openCVTest
SOURCES = $(wildcard $(SRC_FOLDER)/*.cpp)
OBJS = $(SOURCES:.cpp=.o)
INCLUDES = -I$(SRC_FOLDER) `pkg-config --cflags opencv`
OPENCV_LD = `pkg-config --libs opencv` #-lbibl adds the library libbibl.so

CCFLAGS = -Wall -std=c++11 

all : $(EXEC)

$(EXEC) : $(OBJS)
	mkdir -p bin
	g++ $(CCFLAGS) -o bin/$@ $(OBJS) $(INCLUDES) $(LDFLAGS) $(OPENCV_LD)

%.o : %.cpp %.h
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

%.o : %.cpp 
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

clean : 
	rm -f $(OBJS) bin/$(EXEC)
