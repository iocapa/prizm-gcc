/* { dg-do compile } */

#include <objc/objc.h>

@interface MyRootClass
{
  Class isa;
}
@property;                      /* { dg-error "expected" } */
@property int;                  /* { dg-error "expected identifier" } */

@property int a;
@property int b, c;
@property () int d;             /* { dg-warning "empty property attribute list" } */
@property (readonly) int e;
@property (readonly,) int f;    /* { dg-warning "missing property attribute" } */
@property (xxx) int g;          /* { dg-error "unknown property attribute" } */
@property (readonly,xxx) int h; /* { dg-error "unknown property attribute" } */
@property ( int i;              /* { dg-error "unknown property attribute" } */
				/* { dg-error "expected" "" { target *-*-* } .-1 } */
@property (assign,,nonatomic) int j; /* { dg-warning "missing property attribute" } */
@property (assign nonatomic) int k; /* { dg-error {expected } } */
@end
