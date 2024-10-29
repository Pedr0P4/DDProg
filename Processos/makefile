CC = gcc
CFLAGS = -Wall -g

SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

SRCS = $(wildcard $(SRC_DIR)/*.c)
TARGETS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%, $(SRCS))
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

all: $(TARGETS)

$(BIN_DIR)/%: $(OBJ_DIR)/%.o
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)/*.o $(TARGETS)

.PHONY: all clean
