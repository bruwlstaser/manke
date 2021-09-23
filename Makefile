TARGET_EXEC = manke
LIBS = stdc++ Qt5Core Qt5Widgets
LIB_FLAGS = $(addprefix -l,$(LIBS))
INC_DIRS = /usr/include/qt
INC_FLAGS = $(addprefix -I,$(INC_DIRS))
BUILD_DIR = build
SRC_DIR = src
COMPILE_FLAGS = -fPIC

SRCS = $(shell find $(SRC_DIR) -name *.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	gcc $(OBJS) -o $@ $(LIB_FLAGS)

$(OBJS): $(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	gcc -c $< -o $@ $(COMPILE_FLAGS) $(INC_FLAGS)
