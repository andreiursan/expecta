#import "EXPMatchers+equal.h"
#import "EXPMatcherHelpers.h"

EXPMatcherImplementationBegin(_equal, (id expected)) {
  match(^BOOL{
    if((actual == expected) || [actual isEqual:expected]) {
      return YES;
    } else if([actual isKindOfClass:[NSNumber class]] && [expected isKindOfClass:[NSNumber class]]) {
      return [actual isEqualToNumber: expected];
    }
    return NO;
  });

  failureMessageForTo(^NSString *{
    return [NSString stringWithFormat:@"expected: %@, got: %@", EXPDescribeObject(expected), EXPDescribeObject(actual)];
  });

  failureMessageForNotTo(^NSString *{
    return [NSString stringWithFormat:@"expected: not %@, got: %@", EXPDescribeObject(expected), EXPDescribeObject(actual)];
  });
}
EXPMatcherImplementationEnd
