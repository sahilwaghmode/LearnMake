TARGET_EXEC := src

SRC_FILES := $(wildcard *.cpp)
OBJ_FILES := $(SRC_FILES:%=$(BUILD_DIR)/%.o)
export LIB_FILES := $(TARGET_EXEC).a

$(BUILD_DIR)/$(TARGET_EXEC):$(OBJ_FILES)
	@echo $@
	#$(CXX) $(OBJ_FILES) -o $@.a $(LDFLAGS)
	ar rcs $@.a $(OBJ_FILES)
$(BUILD_DIR)/%.cpp.o:%.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CPPFlAGS) $(INCLUDES)  $(CXXFLAGS) -c $< -o $@


print: 
	@echo $(SRC_FILES)
	@echo $(OBJ_FILES)
