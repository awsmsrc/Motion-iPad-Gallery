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
void MREP_E4496119856D43C9A25499601B04A0C6(void *, void *);
void MREP_52F0AD6C4686475CB46641615BF4D1E2(void *, void *);
void MREP_53E5A08258F64E8A962B11AAF92B38A2(void *, void *);
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
MREP_E4496119856D43C9A25499601B04A0C6(self, 0);
MREP_52F0AD6C4686475CB46641615BF4D1E2(self, 0);
MREP_53E5A08258F64E8A962B11AAF92B38A2(self, 0);
        retval = UIApplicationMain(argc, argv, nil, @"AppDelegate");
        rb_exit(retval);
    }
    catch (...) {
	rb_rb2oc_exc_handler();
    }
    [pool release];
    return retval;
}
