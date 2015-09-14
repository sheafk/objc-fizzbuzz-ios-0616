//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     
     * Write your code here!
     
     */
    
    // Basic
    NSUInteger start = 100;
    NSUInteger limit = 130;
    
    for (NSUInteger i = start; i <= limit; i++) {
        NSString *result = @"";
        
        if (i % 3 == 0 && i % 5 == 0) {
            result = @"FizzBuzz";
        }
        else if (i % 3 == 0) {
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
    
    
    // Advanced
    /*
    NSUInteger start = 1;
    NSUInteger limit = 100;
    
    NSUInteger fizzIncrement = 3;
    NSUInteger buzzIncrement = 5;
    
    for (NSUInteger i = start; i <= limit; i++) {
        NSString *result = @"";
        if (i % fizzIncrement == 0) {
            result = @"Fizz";
        }
        if (i % buzzIncrement == 0) {
            result = [result stringByAppendingString:@"Buzz"];
        }
        if (result.length == 0) {
            result = [NSString stringWithFormat:@"%lu", i];
        }
        NSLog(@"%@", result);
    }
    */
    
    // Ternary Implementation
    /*
    NSUInteger start = 1;
    NSUInteger limit = 100;
    
    NSUInteger fizzIncrement = 3;
    NSUInteger buzzIncrement = 5;
    
    for (NSUInteger i = start; i <= limit; i++) {
        NSString *result = @"";
        result = i % fizzIncrement == 0 ? @"Fizz" : result;
        result = i % buzzIncrement == 0 ? [result stringByAppendingString:@"Buzz"] : result;
        result = result.length > 0 ? result : [NSString stringWithFormat:@"%lu", i];
        NSLog(@"%@", result);
    }
    */
    
    // do not alter
    return YES;  //
    ///////////////
}

@end
