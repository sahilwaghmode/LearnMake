
TARGET_EXEC := TimeUtils
	
SRC_FILES := $(wildcard *.cpp)
OBJ_FILES := $(SRC_FILES:%=$(BUILD_DIR)/%.o)
export LIB_FILES += $(TARGET_EXEC).a

CPPFLAGS := $(INCLUDE_DIRS) -g -std=c++20 -Wc++11-extensions

$(BUILD_DIR)/$(TARGET_EXEC):$(OBJ_FILES)
	@echo $@
	#$(CXX) $(OBJ_FILES) -o $@.a $(LDFLAGS)
	ar rcs $@.a $(OBJ_FILES)
$(BUILD_DIR)/%.cpp.o:%.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFlAGS) $(INCLUDES)  $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)

print:
	@echo $(LIB_FILES)
	@echo $(TARGET_EXEC)
	@echo $(BUILD_DIR)
	@echo $(SRC_FILES)
	@echo $(OBJ_FILES)
	@echo $(INCLUDE_DIRS)
	@echo $(path) 
