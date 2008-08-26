//
//  ANTLRBaseTree.h
//  CANTLR
//
//  Created by Jesse Grosjean on 8/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <antlr3.h>


@class BAntlrCommonTokenWrapper;

@interface BAntlrBaseTreeWrapper : NSObject {
	pANTLR3_BASE_TREE tree;
	BAntlrCommonTokenWrapper *token;
	NSMutableArray *children;
}

+ (id) treeWithBTree:(pANTLR3_BASE_TREE)btree;
- (id) initWithBTree:(pANTLR3_BASE_TREE)btree;

@property(readonly) BAntlrCommonTokenWrapper *token;
@property(readonly) NSString *text;
@property(readonly) int type;
@property(readonly) unsigned line;
@property(readonly) NSArray *children;
@property(readonly) NSArray *descendants;

@end
