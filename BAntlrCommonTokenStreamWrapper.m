//
//  ANTLRCommonTokenStreamWrapper.m
//  CANTLR
//
//  Created by Kay Röpke on 8/3/08.
//

#import "BAntlrCommonTokenStreamWrapper.h"
#import "BAntlrCommonTokenWrapper.h"

@implementation BAntlrCommonTokenStreamWrapper

- (id) initWithTokenStream:(pANTLR3_COMMON_TOKEN_STREAM) tokenStream
{
	self = [super init];
	if (self) {
		stream = tokenStream;
		tokens = nil;
	}
	return self;
}

- (void) dealloc
{
	[tokens release];
	[super dealloc];
}


- (NSArray *) tokens
{
	// use cached array if it's there.
	if (tokens) return tokens;
	
	if (!stream) return nil;
	
	tokens = [[NSMutableArray alloc] initWithCapacity:10]; // arbitrary capacity...
	
	pANTLR3_VECTOR tokenVector = stream->getTokens(stream);
	
	ANTLR3_UINT32 size = tokenVector->size(tokenVector);
	ANTLR3_UINT32 i;
	
	for (i=0; i < size; i++) {
		BAntlrCommonTokenWrapper *token = [BAntlrCommonTokenWrapper tokenWithCToken:tokenVector->get(tokenVector, i)];
		[tokens addObject:token];
	}
	
	return tokens;
}

@end
