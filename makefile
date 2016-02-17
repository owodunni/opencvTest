###########################
#                         #
#  ---Computer Vision---  #
#  -   - ~Grupp 1~ -   -  #
#  ---------------------  #
#                         #
###########################

#Paths to diffrent project folders
SRC_FOLDER := src

TARGET     := bin

UNAME_S := $(shell uname -s)

EXEC=openCVTest
SOURCES = $(wildcard $(SRC_FOLDER)/*.cpp)
OBJS += $(addprefix obj/,$(notdir $(SOURCES:.cpp=.o)))

INCLUDES = -I$(SRC_FOLDER) `pkg-config --cflags opencv`
OPENCV_LD = `pkg-config --libs opencv` #-lbibl adds the library libbibl.so
CCFLAGS = -Wall -std=c++11 

##### Compiling starts #####
all : $(EXEC)

$(EXEC) : $(OBJS) makefile
	mkdir -p bin
	g++ $(CCFLAGS) -o bin/$@ $(OBJS) $(INCLUDES) $(LDFLAGS) $(OPENCV_LD)

obj/%.o : $(SRC_FOLDER)/%.cpp $(SRC_FOLDER)/%.h
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

obj/%.o : $(SRC_FOLDER)/%.cpp
	mkdir -p obj
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

clean: 
	@echo " Cleaning..."
	rm -f $(OBJS) bin/$(EXEC)
