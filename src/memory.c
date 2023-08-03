#include  <stdlib.h>

#include "memory.h"
#include "object.h"
#include "vm.h"

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

static void freeObject(Obj* object){
    switch (object->type) {
    case OBJ_NATIVE:
        FREE(ObjNative, object);
        break;
    case OBJ_STRING: {
            ObjString *string = (ObjString*)object;
            FREE_ARRAY(char, string->chars, string->length + 1);
            FREE(ObjString, object);
            break;
        }
    case OBJ_FUNCTION: {
            ObjFunction *function = (ObjFunction *)object;
            freeChunk(&function->chunk);
            FREE(ObjFunction, object);
            break;
        }
    }
}

void freeObjects() {
    Obj *object = vm.objects;
    while(object != NULL) {
        Obj *next = object->next;
        freeObject(object);
        object = next;
    }
}