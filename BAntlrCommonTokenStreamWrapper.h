//
//  ANTLRCommonTokenStreamWrapper.h
//  CANTLR
//
//  Created by Kay Röpke on 8/3/08.
//

#import <Cocoa/Cocoa.h>
#import <antlr3.h>


@interface BAntlrCommonTokenStreamWrapper : NSObject {
	pANTLR3_COMMON_TOKEN_STREAM stream;
	NSMutableArray *tokens;
}

- (id) initWithTokenStream:(pANTLR3_COMMON_TOKEN_STREAM) tokenStream;
- (NSArray *) tokens;

@end
