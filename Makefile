output: common.o memory.o value.o chunk.o debug.o vm.o main.o move execute clean

execute:
	@g++ ./src/build/*.o -o ./src/output
	@rm -rf ./src/build
	@rm -rf ./src/preCompiledHeaders
	@./src/output

common.o: ./src/common.h
	@g++ -c ./src/common.h

chunk.o: ./src/chunk.h ./src/chunk.c
	@g++ -c ./src/chunk.h ./src/chunk.c

memory.o: ./src/memory.h ./src/memory.c
	@g++ -c ./src/memory.h ./src/memory.c

value.o: ./src/value.h ./src/value.c
	@g++ -c ./src/value.h ./src/value.c

debug.o: ./src/debug.h ./src/debug.c
	@g++ -c ./src/debug.h ./src/debug.c

main.o: ./src/main.c
	@g++ -c ./src/main.c

vm.o: ./src/vm.h ./src/vm.c
	@g++ -c ./src/vm.h ./src/vm.c

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