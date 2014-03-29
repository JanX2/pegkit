#import "GrammarActionsParser.h"
#import <PEGKit/PEGKit.h>
    
#define MY_M 1

#define LT(i) [self LT:(i)]
#define LA(i) [self LA:(i)]
#define LS(i) [self LS:(i)]
#define LF(i) [self LD:(i)]

#define POP()            [self.assembly pop]
#define POP_STR()        [self popString]
#define POP_QUOTED_STR() [self popQuotedString]
#define POP_TOK()        [self popToken]
#define POP_BOOL()       [self popBool]
#define POP_INT()        [self popInteger]
#define POP_UINT()       [self popUnsignedInteger]
#define POP_FLOAT()      [self popFloat]
#define POP_DOUBLE()     [self popDouble]

#define PUSH(obj)      [self.assembly push:(id)(obj)]
#define PUSH_BOOL(yn)  [self pushBool:(BOOL)(yn)]
#define PUSH_INT(i)    [self pushInteger:(NSInteger)(i)]
#define PUSH_UINT(u)   [self pushUnsignedInteger:(NSUInteger)(u)]
#define PUSH_FLOAT(f)  [self pushFloat:(float)(f)]
#define PUSH_DOUBLE(d) [self pushDouble:(double)(d)]

#define EQ(a, b) [(a) isEqual:(b)]
#define NE(a, b) (![(a) isEqual:(b)])
#define EQ_IGNORE_CASE(a, b) (NSOrderedSame == [(a) compare:(b)])

#define MATCHES(pattern, str)               ([[NSRegularExpression regularExpressionWithPattern:(pattern) options:0                                  error:nil] numberOfMatchesInString:(str) options:0 range:NSMakeRange(0, [(str) length])] > 0)
#define MATCHES_IGNORE_CASE(pattern, str)   ([[NSRegularExpression regularExpressionWithPattern:(pattern) options:NSRegularExpressionCaseInsensitive error:nil] numberOfMatchesInString:(str) options:0 range:NSMakeRange(0, [(str) length])] > 0)

#define ABOVE(fence) [self.assembly objectsAbove:(fence)]
#define EMPTY() [self.assembly isStackEmpty]

#define LOG(obj) do { NSLog(@"%@", (obj)); } while (0);
#define PRINT(str) do { printf("%s\n", (str)); } while (0);

@interface PKParser ()
@property (nonatomic, retain) NSMutableDictionary *tokenKindTab;
@property (nonatomic, retain) NSMutableArray *tokenKindNameTab;
@property (nonatomic, retain) NSString *startRuleName;
@property (nonatomic, retain) NSString *statementTerminator;
@property (nonatomic, retain) NSString *singleLineCommentMarker;
@property (nonatomic, retain) NSString *blockStartMarker;
@property (nonatomic, retain) NSString *blockEndMarker;
@property (nonatomic, retain) NSString *braces;

- (BOOL)popBool;
- (NSInteger)popInteger;
- (double)popDouble;
- (PKToken *)popToken;
- (NSString *)popString;

- (void)pushBool:(BOOL)yn;
- (void)pushInteger:(NSInteger)i;
- (void)pushDouble:(double)d;
@end

@interface GrammarActionsParser ()
    
@property (nonatomic, retain) NSString *foo;

@end

@implementation GrammarActionsParser {     
    BOOL _bar;
}

- (id)initWithDelegate:(id)d {
    self = [super initWithDelegate:d];
    if (self) {
            
    self.foo = @"hello world";
    _bar = YES;

        self.startRuleName = @"start";


    }
    return self;
}

- (void)dealloc {
        
    self.foo = nil;


    [super dealloc];
}

- (void)start {
    [self execute:^{
    
    NSAssert([self.foo isEqualToString:@"hello world"], @"");
    NSAssert([_foo isEqualToString:@"hello world"], @"");
    NSAssert(_bar, @"");
    NSAssert(MY_H, @"");
    NSAssert(MY_M, @"");
    self.foo = @"goodbye cruel world";

    }];

    [self start_]; 
    [self matchEOF:YES]; 

    [self execute:^{
    
    NSAssert([self.foo isEqualToString:@"goodbye cruel world"], @"");
    NSAssert([_foo isEqualToString:@"goodbye cruel world"], @"");
    NSAssert(_bar, @"");
    NSAssert(MY_H, @"");
    NSAssert(MY_M, @"");

    }];
}

- (void)start_ {
    
    do {
        [self matchWord:NO]; 
    } while ([self predicts:TOKEN_KIND_BUILTIN_WORD, 0]);

    [self fireDelegateSelector:@selector(parser:didMatchStart:)];
}

@end