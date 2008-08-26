//
//  ANTLRCommonTokenWrapper.m
//  CANTLR
//
//  Created by Kay Röpke on 8/3/08.
//  Copyright 2008 classdump. All rights reserved.
//

#import "BAntlrCommonTokenWrapper.h"


@implementation BAntlrCommonTokenWrapper

+ (id) tokenWithCToken:(pANTLR3_COMMON_TOKEN)ctoken
{
	return [[[BAntlrCommonTokenWrapper alloc] initWithCToken:ctoken] autorelease];
}

- (id) initWithCToken:(pANTLR3_COMMON_TOKEN)ctoken
{
	self = [super init];
	if (self) {
		token = ctoken;
	}
	return self;
}

- (NSString *) text
{
	pANTLR3_STRING string = token->getText(token);
	pANTLR3_STRING utf8String = string->toUTF8(string);
	return [NSString stringWithUTF8String:utf8String->chars];
}

- (int)type {
	return token->getType(token);
}

- (unsigned) line
{
	return token->getLine(token);
}

- (int) charPositionInLine
{
	return token->getCharPositionInLine(token) + 1;
}

- (NSString *)description {
	pANTLR3_STRING string = token->toString(token);
	pANTLR3_STRING utf8String = string->toUTF8(string);
	return [NSString stringWithUTF8String:utf8String->chars];
}

@end
