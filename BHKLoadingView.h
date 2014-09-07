//
//  BHKLoadingView.h
//
//  Created by Brendan Kirchner on 6/20/14.
//  Copyright (c) 2014 BHK Mobile App Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHKLoadingView : UIView

@property (nonatomic, strong) UIColor *colorCustomLayer1, *colorCustomLayer2, *colorCustomLayer3;

-(void)startAnimating;

-(void)stopAnimating;

@end
