#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *s1 = [NSMutableString stringWithString:string1];
    NSMutableString *s2 = [NSMutableString stringWithString:string2];
    NSMutableString *res = [NSMutableString new];
    
    while (s1.length && s2.length) {
        [s1 characterAtIndex:0];
            
            if ([s1 UTF8String][0] <= [s2 UTF8String][0]) {
                [res appendFormat:@"%c", [s1 characterAtIndex:0]];
                [s1 deleteCharactersInRange:NSMakeRange(0, 1)];
            } else {
                [res appendFormat:@"%c", [s2 characterAtIndex:0]];
                [s2 deleteCharactersInRange:NSMakeRange(0, 1)];
            }
    }
    s1.length == 0 ? [res appendString:s2] : [res appendString:s1];
    
    return [res copy];
}

@end
