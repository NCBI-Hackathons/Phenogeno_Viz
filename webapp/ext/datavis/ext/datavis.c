#include "ironhack.h"

//LESS IS MORE
#define val VALUE
#define RB_GLOFN rb_define_global_function
#define CSTR(__Y__,__X__) char *__Y__ = StringValueCStr(__X__) //rb -> c

//prototypical hybrid rb-C fn
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

val do_slow_stuff_with_python_and_R(val self, val T1, val T2) {

    CSTR(t1,T1); 
    CSTR(t2,T2);

    char *cmd = "ls -l";    

    char buf[BUFSIZE];
    FILE *fp;

    if ((fp = popen(cmd, "r")) == NULL) {
        printf("Error opening pipe!\n");
        return -1;
    }

    while (fgets(buf, BUFSIZE, fp) != NULL) {
        // Do whatever you want here...
        printf("OUTPUT: %s", buf);
    }

    if(pclose(fp))  {
        printf("Command not found or exited with error status\n");
        return -1;
    }

    return 0;
}

void Init_datavis() {

    RB_GLOFN("dv_test",       rb_test_fn,                           0);
    RB_GLOFN("dv_get_graph",  rb_return_graphUrls,                  0);
    RB_GLOFN("slow_anal",     rb_do_slow_stuff_with_python_and_R,   2); 
}
