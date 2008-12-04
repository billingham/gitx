//
//  PBGitWindowSourceController.h
//  GitX
//
//  Created by Pieter de Bie on 03-12-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PBGitWindowSourceController : NSObject {
	IBOutlet NSOutlineView *sourceList;
	IBOutlet NSTreeController *sourceController;
	NSMutableArray *listItems;
}

- (void) populateList;

@property (retain) NSMutableArray *listItems;
@end
