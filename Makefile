# Not pretty. I know. Will change later.

output: common.o memory.o value.o chunk.o scanner.o object.o table.o compile.o debug.o vm.o main.o move execute clean

execute:
	@gcc ./src/build/*.o -o ./src/output
	@rm -rf ./src/build
	@rm -rf ./src/preCompiledHeaders
	@./src/output

common.o: ./src/common.h
	@gcc -c ./src/common.h

chunk.o: ./src/chunk.h ./src/chunk.c
	@gcc -c ./src/chunk.h ./src/chunk.c

memory.o: ./src/memory.h ./src/memory.c
	@gcc -c ./src/memory.h ./src/memory.c

value.o: ./src/value.h ./src/value.c
	@gcc -c ./src/value.h ./src/value.c

debug.o: ./src/debug.h ./src/debug.c
	@gcc -c ./src/debug.h ./src/debug.c

scanner.o: ./src/scanner.h ./src/scanner.c
	@gcc -c ./src/scanner.h ./src/scanner.c

compile.o: ./src/compiler.h ./src/compiler.c
	@gcc -c ./src/compiler.h ./src/compiler.c

object.o : ./src/object.h ./src/object.c
	@gcc -c ./src/object.h ./src/object.c

table.o : ./src/table.h ./src/table.c
	@gcc -c ./src/table.h ./src/table.c

main.o: ./src/main.c
	@gcc -c ./src/main.c

vm.o: ./src/vm.h ./src/vm.c
	@gcc -c ./src/vm.h ./src/vm.c

move:
	@mkdir -p ./src/build
	@mv *.o ./src/build/
	@mkdir -p ./src/preCompiledHeaders
	@mv ./src/*.h.gch ./src/preCompiledHeaders

.PHONY: clean

clean:
	@find . -name "*.o" -type f -delete
	@find . -name "*.exe" -type f -delete
	@find . -name "output" -delete
	@find . -name "*.h.gch" -type f -delete