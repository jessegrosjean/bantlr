//
//  ANTLRBaseTree.m
//  CANTLR
//
//  Created by Jesse Grosjean on 8/3/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BAntlrBaseTreeWrapper.h"
#import "BAntlrCommonTokenWrapper.h"


@implementation BAntlrBaseTreeWrapper

+ (id) treeWithBTree:(pANTLR3_BASE_TREE)btree {
	return [[BAntlrBaseTreeWrapper alloc] initWithBTree:btree];
}

- (id) initWithBTree:(pANTLR3_BASE_TREE)btree {
	self = [super init];
	if (self) {
		tree = btree;
	}
	return self;
}

- (BAntlrCommonTokenWrapper *)token {
	if (!token) {
		token = [BAntlrCommonTokenWrapper tokenWithCToken:tree->getToken(tree)];
	}
	return token;
}

- (NSString *) text
{
	pANTLR3_STRING string = tree->getText(tree);
	pANTLR3_STRING utf8String = string->toUTF8(string);
	return [NSString stringWithUTF8String:(const char *)utf8String->chars];
}

- (int)type {
	return tree->getType(tree);
}

- (unsigned) line
{
	return tree->getLine(tree);
}

- (NSArray *)children {
	if (!children) {
		ANTLR3_UINT32 count = tree->getChildCount(tree);
		
		children = [[NSMutableArray alloc] initWithCapacity:count];
		ANTLR3_UINT32 i;
		
		for (i=0; i < count; i++) {
			pANTLR3_BASE_TREE childTree = tree->getChild(tree, i);
			[children addObject:[BAntlrBaseTreeWrapper treeWithBTree:childTree]];
		}
	}
	return children;
}

- (NSArray *)descendants {
	NSMutableArray *descendants = [NSMutableArray array];
	for (BAntlrBaseTreeWrapper *eachChild in [self children]) {
		[descendants addObject:eachChild];
		[descendants addObjectsFromArray:[eachChild descendants]];
	}
	return descendants;
}

- (NSString *)description {
	pANTLR3_STRING string = tree->toStringTree(tree);
	pANTLR3_STRING utf8String = string->toUTF8(string);
	return [NSString stringWithFormat:@"%i %@", [self type], [NSString stringWithUTF8String:(const char *)utf8String->chars], nil];
}


@end
