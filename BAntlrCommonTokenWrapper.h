//
//  ANTLRCommonTokenWrapper.h
//  CANTLR
//
//  Created by Kay Röpke on 8/3/08.
//  Copyright 2008 classdump. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <antlr3.h>


@interface BAntlrCommonTokenWrapper : NSObject {
	pANTLR3_COMMON_TOKEN token;
}

+ (id) tokenWithCToken:(pANTLR3_COMMON_TOKEN)ctoken;
- (id) initWithCToken:(pANTLR3_COMMON_TOKEN)ctoken;

@property(readonly) NSString *text;
@property(readonly) int type;
@property(readonly) unsigned line;
@property(readonly) int charPositionInLine;

@end
