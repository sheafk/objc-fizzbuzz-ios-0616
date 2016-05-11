//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUInteger start = 100;
    NSUInteger limit = 130;
    
    for (NSUInteger i = start; i <= limit; i++) { NSString *result = @"";
        if (i % 3 == 0 && i % 5 == 0) {
            result = @"FizzBuzz";
        }
        else if (i % 3 == 0) {    // becomes an 'else if' statement
            result = @"Fizz";
        }
        else if (i % 5 == 0) {
            result = @"Buzz";
        }
        else {
            result = [NSString stringWithFormat:@"%lu", i];
        }
    NSLog(@"%@", result);
        
    }
    
    
    // do not alter
    return YES;  //
    ///////////////
}

@end
