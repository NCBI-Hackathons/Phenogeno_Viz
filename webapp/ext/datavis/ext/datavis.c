#include "ironhack.h"

#define val VALUE
#define RB_GLOFN rb_define_global_function

val rb_test_fn(val self) {
  val hash = rb_hash_new();
  rb_hash_aset(hash, INT2FIX(1),rb_str_new2("Hello from C!"));

  return hash;
}

void Init_datavis() {

  RB_GLOFN("dv_test", rb_test_fn, 0);
}
