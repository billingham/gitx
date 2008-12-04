//
//  PBGitWindowSourceController.m
//  GitX
//
//  Created by Pieter de Bie on 03-12-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "PBGitWindowSourceController.h"


@implementation PBGitWindowSourceController

@synthesize listItems;

-(void) awakeFromNib
{
	[sourceList setSelectionHighlightStyle:1];
	[sourceList setDelegate:self];
	listItems = [NSMutableArray array];
	[self populateList];
	[sourceList setIndentationMarkerFollowsCell:YES];
	[sourceList expandItem:[sourceList itemAtRow:0]];
	[sourceList expandItem:[sourceList itemAtRow:1]];
}

- (void) populateList
{
	[self willChangeValueForKey:@"listItems"];
	
	NSLog(@"Populating list!");
	[listItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						  @"View", @"name",
						  [NSArray arrayWithObjects:
								[NSDictionary dictionaryWithObject:@"Commit" forKey:@"name"],
								[NSDictionary dictionaryWithObject:@"History" forKey:@"name"],
								nil
						  ], @"children",
						  nil
						  ]];
	
	[listItems addObject:[NSDictionary dictionaryWithObjectsAndKeys:
						  @"BRANCHES", @"name",
						  [NSArray arrayWithObject:[NSDictionary dictionaryWithObject:@"master" forKey:@"name"]], @"children",
						  nil
	 ]];
	
	[self didChangeValueForKey:@"listItems"];
}

#pragma mark Delegate methods

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item
{
	return [[item representedObject] objectForKey:@"children"];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldExpandItem:(id)item
{
	return [self outlineView:outlineView isGroupItem:item];
}

- (void)outlineView:(NSOutlineView *)outlineView willDisplayOutlineCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
	NSLog(@"Will draw cell: %@", cell);
	NSButtonCell *c = cell;
}

- (void)outlineView:(NSOutlineView *)outlineView willDisplayCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
	if (!([self outlineView:outlineView isGroupItem:item]))
		[cell setImage:[NSImage imageNamed:NSImageNameNetwork]];
	else
		[cell setImage:nil];
}

@end
