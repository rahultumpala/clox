output: common.o memory.o chunk.o debug.o main.o move 
	@g++ ./build/*.o -o output
	@rm -rf ./build
	@./output

common.o: ./common.h
	@g++ -c ./common.h

chunk.o: ./chunk.h ./chunk.c
	@g++ -c ./chunk.h ./chunk.c

memory.o: ./memory.h ./memory.c
	@g++ -c ./memory.h ./memory.c

debug.o: ./debug.h ./debug.c
	@g++ -c ./debug.h ./debug.c

main.o: ./main.c
	@g++ -c ./main.c

move: 
	@mkdir -p ./build
	@mv *.o ./build/
	# @mv *.gch ./build/

.PHONY: clean

clean:
	find . -name "*.o" -type f -delete
	find . -name "*.exe" -type f -delete
	find . -name "output" -delete
	find . -name "*.h.gch" -type f -delete
	rm -rf ./build