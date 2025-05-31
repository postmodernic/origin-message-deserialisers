CXX = g++
CXXFLAGS = -std=c++17 -fPIC -Wall -Wextra
INCLUDES = -I./src
LDFLAGS = -shared

SRCS = src/DSPGram/adcp_coredata_messages.cpp \
       src/PDNMessages/PDN_messages.cpp

OBJ_DIR = build/obj
LIB_DIR = build

OBJS = $(SRCS:%.cpp=$(OBJ_DIR)/%.o)
TARGET = $(LIB_DIR)/liborigin_deserialiser.so

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(LIB_DIR)
	$(CXX) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(LIB_DIR) 