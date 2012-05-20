#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_0FAA2124F3F44608971CEA71BE4E4BC0(void *, void *);
void MREP_10A270C02CF343E4A9DA02293514ECB9(void *, void *);
void MREP_A6B875C79C0640DBBC7CA997FBBE0464(void *, void *);
}
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    const char *progname = argv[0];
    ruby_init();
    ruby_init_loadpath();
    ruby_script(progname);
    int retval = 0;
    try {
        void *self = rb_vm_top_self();
MREP_0FAA2124F3F44608971CEA71BE4E4BC0(self, 0);
MREP_10A270C02CF343E4A9DA02293514ECB9(self, 0);
MREP_A6B875C79C0640DBBC7CA997FBBE0464(self, 0);
        retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
        rb_exit(retval);
    }
    catch (...) {
	rb_rb2oc_exc_handler();
    }
    [pool release];
    return retval;
}
