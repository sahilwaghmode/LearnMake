
TARGET_EXEC := LearnMake

export PRO_DIR := $(shell pwd)
export BUILD_DIR = $(PRO_DIR)/../build

SRC_FILES := $(wildcard *.cpp)
OBJ_FILES := $(SRC_FILES:%=$(BUILD_DIR)/%.o)
LIB_FOLDER := $(shell basename $(INCLUDE_DIRS))
export INCLUDE_DIRS := $(shell find * -maxdepth 1 -type d)
export LIB_FILES := $(INCLUDE_DIRS:%=$(BUILD_DIR)/%.a)
export INCLUDE_DIR := $(shell find $(PRO_DIR)  -maxdepth 1 -type d)
export INCLUDES := $(addprefix -I,$(INCLUDE_DIR))

$(BUILD_DIR)/$(TARGET_EXEC):loop
	$(CXX) $(LIB_FILES) -o $@ $(LDFFLAGS)

$(INCLUDE_DIRS):
	@echo $(wildcard %)
	subdir := $(pathsubst %.a,%,$(wildcard %))
	cd $(subdir) && $(MAKE)

print: 
	@echo $(SRC_FILES)
	@echo $(OBJ_FILES)
	@echo $(INCLUDE_DIRS)
	@echo $(LIB_FILES)
	@echo $(INCLUDES)

loop:
	@for dir in $(INCLUDE_DIRS); do\
		echo "process dir " $$dir; \
		cd $$PRO_DIR/$$dir; \
		$(MAKE); \
	done;
	@echo done

clean:
	rm -rf $(BUILD_DIR)

dir:
	@echo $(LIB_FOLDER)
	@echo $(INCLUDE_DIRS) 
