//
//  BHKLoadingView.m
//
//  Created by Brendan Kirchner on 6/20/14.
//  Copyright (c) 2014 BHK Mobile App Solutions. All rights reserved.
//

#import "BHKLoadingView.h"
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

@interface BHKAnimation : CABasicAnimation

@end

@implementation BHKAnimation

+(instancetype)animationWithKeyPath:(NSString *)path
{
    BHKAnimation *anim = [super animationWithKeyPath:path];
    anim.fromValue = [NSNumber numberWithFloat:0];
    anim.toValue = [NSNumber numberWithFloat:2.0f * M_PI];
    anim.repeatCount = HUGE_VALF;
    return anim;
}

@end

@implementation BHKLoadingView
{
    CircleView *circleView1;
    CircleView *circleView2;
    CircleView *circleView3;
    
    BOOL isAnimating;
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
    _colorCustomLayer1 = [UIColor blueColor];
    _colorCustomLayer2 = [UIColor greenColor];
    _colorCustomLayer3 = [UIColor redColor];
    
    circleView1.oSet = 0.0f;
    circleView2.oSet = M_PI / 4.0f;
    circleView3.oSet = 0.0f;
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:NO];
    [self setUserInteractionEnabled:YES];
    
    [self setup];
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

-(void)setColorCustomLayer1:(UIColor *)colorCustomLayer1
{
    _colorCustomLayer1 = colorCustomLayer1;
    circleView1.colorLine = colorCustomLayer1;
    [circleView1 setNeedsDisplay];
}

-(void)setColorCustomLayer2:(UIColor *)colorCustomLayer2
{
    _colorCustomLayer2 = colorCustomLayer2;
    circleView2.colorLine = colorCustomLayer2;
    [circleView2 setNeedsDisplay];
}

-(void)setColorCustomLayer3:(UIColor *)colorCustomLayer3
{
    _colorCustomLayer3 = colorCustomLayer3;
    circleView3.colorLine = colorCustomLayer3;
    [circleView3 setNeedsDisplay];
}

-(void)setup
{
    CGRect rect = self.bounds;
    CGFloat lineWidth = (rect.size.width / 2.0f) / 5.0f;
    CGFloat sc = lineWidth / 2.0f;
    
    circleView1.backgroundColor = [UIColor clearColor];
    circleView1.frame = rect;
    CGFloat scale1 = sc;
    circleView1.ovalRect = CGRectMake(scale1, scale1, rect.size.width - 2 * scale1,  rect.size.height - 2 * scale1);
    circleView1.lineWidth = lineWidth;
    circleView1.colorLine = _colorCustomLayer1;
//    [circleView1 setNeedsDisplay];
    
    circleView2.backgroundColor = [UIColor clearColor];
    circleView2.frame = rect;
    CGFloat scale2 = scale1 + lineWidth;
    circleView2.ovalRect = CGRectMake(scale2, scale2, rect.size.width - 2 * scale2,  rect.size.height - 2 * scale2);
    circleView2.lineWidth = lineWidth;
    circleView2.colorLine = _colorCustomLayer2;
//    [circleView2 setNeedsDisplay];
    
    circleView3.backgroundColor = [UIColor clearColor];
    circleView3.frame = rect;
    CGFloat scale3 = scale2 + lineWidth;
    circleView3.ovalRect = CGRectMake(scale3, scale3, rect.size.width - 2 * scale3,  rect.size.height - 2 * scale3);
    circleView3.lineWidth = lineWidth;
    circleView3.colorLine = _colorCustomLayer3;
//    [circleView3 setNeedsDisplay];
    
//    UITapGestureRecognizer *recog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
//    [self addGestureRecognizer:recog];
}

-(void)startAnimating
{
    if (!isAnimating) {
        BHKAnimation *fullRotation1 = [BHKAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation1.duration = 3.75;
        [circleView1.layer addAnimation:fullRotation1 forKey:nil];
        
        BHKAnimation *fullRotation2 = [BHKAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation2.duration = 2.5;
        [circleView2.layer addAnimation:fullRotation2 forKey:nil];
        
        BHKAnimation *fullRotation3 = [BHKAnimation animationWithKeyPath:@"transform.rotation"];
        fullRotation3.duration = 1.25;
        [circleView3.layer addAnimation:fullRotation3 forKey:nil];
        
        isAnimating = YES;
    }
}

-(void)stopAnimating
{
    if (isAnimating) {
        [circleView1.layer removeAllAnimations];
        [circleView2.layer removeAllAnimations];
        [circleView3.layer removeAllAnimations];
        
        isAnimating = NO;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self changeColors];
}

-(void)tapped
{
    [self changeColors];
}

-(void)changeColors
{
    circleView1.colorLine = [BHKLoadingView randomColor];
    circleView2.colorLine = [BHKLoadingView randomColor];
    circleView3.colorLine = [BHKLoadingView randomColor];
    
    [circleView1 setNeedsDisplay];
    [circleView2 setNeedsDisplay];
    [circleView3 setNeedsDisplay];
}

+(UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
