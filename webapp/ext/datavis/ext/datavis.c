#include "ironhack.h"

#define val VALUE
#define RB_GLOFN rb_define_global_function

val rb_test_fn(val self) {
  val hash = rb_hash_new();
  rb_hash_aset(hash, INT2FIX(1),rb_str_new2("Hello from C!"));

  return hash;
}

val rb_return_graphUrls(val self) {
val hash = rb_hash_new();
  rb_hash_aset(hash, INT2FIX(1),rb_str_new2("https://previews.123rf.com/images/vasabii/vasabii1205/vasabii120500077/13748023-business-graph-with-red-and-green-arrow.jpg"));

  return hash;
}

void Init_datavis() {

  RB_GLOFN("dv_test", rb_test_fn, 0);
   RB_GLOFN("dv_get_graph", rb_return_graphUrls, 0);
}
