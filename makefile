
TARGET_EXEC := LearnMake

export PRO_DIR := $(shell pwd)
export BUILD_DIR = $(PRO_DIR)/build

SRC_FILES := $(wildcard *.cpp)
OBJ_FILES := $(SRC_FILES:%=$(BUILD_DIR)/%.o)
export INCLUDE_DIRS := $(shell find src -maxdepth 1 -type d)
LIB_FOLDER := $(shell basename $(INCLUDE_DIRS))
export LIB_FILES := $(INCLUDE_DIRS:%=$(BUILD_DIR)/%.a)

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

loop:
	@for dir in $(INCLUDE_DIRS); do\
		echo "process dir " $$dir; \
		cd $$dir; \
		$(MAKE); \
	done;
	@echo done

dir:
	@echo $(LIB_FOLDER)
	@echo $(INCLUDE_DIRS) 
