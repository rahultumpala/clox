#include  <stdlib.h>

#include "memory.h"

void *reallocate(void *pointer, size_t oldSize, size_t newSize){
    if(newSize == 0){
        free(pointer);
        return NULL;
    }

    // oldSize is the size of the array *pointer points to
    void *result = realloc(pointer, newSize);

    // fails when not enough memory is avaiable for realloc to happen
    if(result == NULL) exit(1);

    return result;
}