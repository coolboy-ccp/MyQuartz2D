//
//  DrawMyDefineImage.m
//  MyQuartz2D
//
//  Created by liqunfei on 15/8/13.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "DrawMyDefineImage.h"
//返回弧度
CGFloat arc(CGFloat angle) {
    return angle * M_PI/180;
}

@implementation DrawMyDefineImage


//系统自动调用，视图显示在屏幕的时候调用
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    drawline();
    drawCircle();
    drawArc();
    drawText();
    drawImg();
    drawBezier();
}

void drawline() {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 10);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    CGContextMoveToPoint(context, 120, 120);
    CGContextAddLineToPoint(context, 220, 120);
    CGContextAddLineToPoint(context, 220, 220);
    CGContextStrokePath(context);
}

void drawCircle() {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 130, 130));
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}


void drawArc() {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextAddArc(context, 180, 180, 50, 0, M_PI, 1);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    //CGContextFillPath(context);
}

void drawText() {
    NSString *str = @"beautiful girl";
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attributes[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [str drawInRect:CGRectMake(200, 200, 100, 30) withAttributes:attributes];
}

void drawImg() {
    UIImage *img = [UIImage imageNamed:@"1.jpg"];
    //[img drawAtPoint:CGPointMake(250, 250)];
    [img drawAsPatternInRect:CGRectMake(250, 250, 150, 150)];
    NSString *str = @"beautiful girl";
    [str drawInRect:CGRectMake(250, 250, 100, 30) withAttributes:nil];
}

void drawBezier() {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 300, 0);
   // CGContextAddCurveToPoint(context, 150, 200, 200, 100, 200, 100);//两个控制点
    CGContextAddQuadCurveToPoint(context, 250, 100, 150, 100);//一个控制点
    CGContextStrokePath(context);
    
}
@end
