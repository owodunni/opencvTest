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

$(EXEC) : $(OBJS) mkdirs
	g++ $(CCFLAGS) -o bin/$@ $(OBJS) $(INCLUDES) $(LDFLAGS) $(OPENCV_LD)

obj/%.o : $(SRC_FOLDER)/%.cpp $(SRC_FOLDER)/%.h
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

obj/%.o : $(SRC_FOLDER)/%.cpp 
	g++ $(CCFLAGS) -c -o $@ $< $(INCLUDES)

mkdirs: 
	@echo " Making directories..."
	mkdir -p bin obj

clean: 
	@echo " Cleaning..."
	rm -f $(OBJS) bin/$(EXEC)
