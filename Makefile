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
	mkdir $(BUILD_DIR)
	gcc -c $< -o $@ $(COMPILE_FLAGS) $(INC_FLAGS)

clean:
	rm -rf $(BUILD_DIR)

run: $(BUILD_DIR)/$(TARGET_EXEC)
	$(BUILD_DIR)/$(TARGET_EXEC)

.PHONY: clean run
.DEFAULT_GOAL := $(BUILD_DIR)/$(TARGET_EXEC)
