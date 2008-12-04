//
//  PBOutlineView.m
//  GitX
//
//  Created by Pieter de Bie on 03-12-08.
//  Copyright 2008 Pieter de Bie. All rights reserved.
//

#import "PBOutlineView.h"


@implementation PBOutlineView

- (NSRect)frameOfOutlineCellAtRow:(NSInteger)row
{
	if ([[[[self itemAtRow:row] representedObject] objectForKey:@"name"] isEqualToString: @"View"])
		return NSZeroRect;
	return [super frameOfOutlineCellAtRow:row];
}

@end
