TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

# Rule to build the target
run: clean default
	./$(TARGET) -f ./mynewdb.db -n
	./$(TARGET) -f ./mynewdb.db -a "Timmy H.,123 Sheshire Ln.,120"
	./$(TARGET) -f ./mynewdb.db -l

# Default rule
default: $(TARGET)

# Clean rule
clean:
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

# Rule for building the target executable
$(TARGET): $(OBJ)
	gcc -o $@ $^

# Rule for building object files
obj/%.o: src/%.c
	gcc -c $< -o $@ -Iinclude

# Rule to create necessary directories
$(OBJ): | obj bin

# Create obj and bin directories if they do not exist
obj:
	mkdir -p obj

bin:
	mkdir -p bin

