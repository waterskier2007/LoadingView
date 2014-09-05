//
//  MUGLoadingView.m
//  BreweryMugClub
//
//  Created by Brendan Kirchner on 6/20/14.
//  Copyright (c) 2014 BHK Mobile App Solutions. All rights reserved.
//

#import "MUGLoadingView.h"
#import "Colours.h"

@interface CircleView : UIView

@property (assign) CGRect ovalRect;
@property (assign) int lineWidth;
@property (nonatomic) UIColor *colorLine;
@property (assign) CGFloat oSet;

@end

@implementation CircleView

@synthesize ovalRect,lineWidth,colorLine;

-(void)drawRect:(CGRect)rect
{
    CGContextRef theContext = UIGraphicsGetCurrentContext();
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
//    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 190 * M_PI/180 endAngle: 260 * M_PI/180 clockwise: YES];
    [self path:ovalPath addArcWithCenter:CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius:CGRectGetWidth(ovalRect) / 2 start:10 * M_PI/180 end:80 * M_PI/180];
    
    CGContextAddPath(theContext, ovalPath.CGPath);
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPath];
//    [oval2Path addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 280 * M_PI/180 endAngle: 350 * M_PI/180 clockwise: YES];
    [self path:oval2Path addArcWithCenter:CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius:CGRectGetWidth(ovalRect) / 2 start:100 * M_PI/180 end:170 * M_PI/180];
    
    CGContextAddPath(theContext, oval2Path.CGPath);
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPath];
//    [oval3Path addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 10 * M_PI/180 endAngle: 80 * M_PI/180 clockwise: YES];
    [self path:oval3Path addArcWithCenter:CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius:CGRectGetWidth(ovalRect) / 2 start:190 * M_PI/180 end:260 * M_PI/180];
    
    CGContextAddPath(theContext, oval3Path.CGPath);
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPath];
//    [oval4Path addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 100 * M_PI/180 endAngle: 170 * M_PI/180 clockwise: YES];
    [self path:oval4Path addArcWithCenter:CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius:CGRectGetWidth(ovalRect) / 2 start:280 * M_PI/180 end:350 * M_PI/180];
    
    CGContextAddPath(theContext, oval4Path.CGPath);
    
    
    CGContextSetLineWidth(theContext,lineWidth);
    CGContextSetStrokeColorWithColor(theContext, colorLine.CGColor);
    CGContextStrokePath(theContext);
}

-(void)path:(UIBezierPath *)path addArcWithCenter:(CGPoint)center radius:(CGFloat)radius start:(CGFloat)start end:(CGFloat)end
{
    [path addArcWithCenter:center radius:radius startAngle:(start + _oSet) endAngle:(end + _oSet) clockwise:YES];
}

@end

@implementation BHKLoadingView
{
    CircleView *circleView1;
    CircleView *circleView2;
    CircleView *circleView3;
    
    UIColor *colorCustomLayer;
    UIColor *colorCustomLayer2;
    UIColor *colorCustomLayer3;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self customInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit
{
    circleView1 = [[CircleView alloc] init];
//    [self.layer addSublayer:circleView1];
    [self addSubview:circleView1];
    
    circleView2 = [[CircleView alloc] init];
    [self addSubview:circleView2];
    
    circleView3 = [[CircleView alloc] init];
    [self addSubview:circleView3];
    
    //Default colors for layers
    colorCustomLayer = [UIColor blueColor];
    colorCustomLayer2 = [UIColor greenColor];
    colorCustomLayer3 = [UIColor redColor];
    
    circleView1.oSet = 0.0f;
    circleView2.oSet = M_PI / 4.0f;
    circleView3.oSet = 0.0f;
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:NO];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();

}
*/

-(void)setup
{
    circleView1.backgroundColor = [UIColor clearColor];
    circleView1.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale = 2.5;
    circleView1.ovalRect = CGRectMake(scale , scale, self.frame.size.width - 2 * scale,  self.frame.size.height - 2 * scale);
    circleView1.lineWidth = 5;
    circleView1.colorLine = colorCustomLayer;
    [circleView1 setNeedsDisplay];
    
    circleView2.backgroundColor = [UIColor clearColor];
    circleView2.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale2 = 7.5;
    circleView2.ovalRect = CGRectMake(scale2 , scale2, self.frame.size.width - 2 * scale2,  self.frame.size.height - 2 * scale2);
    circleView2.lineWidth = 5;
    circleView2.colorLine = colorCustomLayer2;
    [circleView2 setNeedsDisplay];
    
    circleView3.backgroundColor = [UIColor clearColor];
    circleView3.frame = CGRectInset(self.bounds, 0.0f, 0.0f);
    int scale3 = 12.5;
    circleView3.ovalRect = CGRectMake(scale3 , scale3, self.frame.size.width - 2 * scale3,  self.frame.size.height - 2 * scale3);
    circleView3.lineWidth = 5;
    circleView3.colorLine = colorCustomLayer3;
    [circleView3 setNeedsDisplay];
}

-(void)startAnimating
{
    CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:MAXFLOAT];
    fullRotation.duration = MAXFLOAT * 0.6;
    fullRotation.removedOnCompletion = YES;
    
    [circleView1.layer addAnimation:fullRotation forKey:nil];
    
    
    CABasicAnimation *fullRotation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation2.fromValue = [NSNumber numberWithFloat:0];
    fullRotation2.toValue = [NSNumber numberWithFloat:-MAXFLOAT];
    fullRotation2.duration = MAXFLOAT * 0.4;
    fullRotation2.removedOnCompletion = YES;
    
    [circleView2.layer addAnimation:fullRotation2 forKey:nil];
    
    
    CABasicAnimation *fullRotation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation3.fromValue = [NSNumber numberWithFloat:0];
    fullRotation3.toValue = [NSNumber numberWithFloat:MAXFLOAT];
    fullRotation3.duration = MAXFLOAT * 0.2;
    fullRotation3.removedOnCompletion = YES;
    
    [circleView3.layer addAnimation:fullRotation3 forKey:nil];
}

-(void)stopAnimating
{
    [circleView1.layer removeAllAnimations];
    [circleView2.layer removeAllAnimations];
    [circleView3.layer removeAllAnimations];
}

@end
