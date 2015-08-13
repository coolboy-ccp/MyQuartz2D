//
//  DrawSmallYellowMan.m
//  MyQuartz2D
//
//  Created by liqunfei on 15/8/13.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "DrawSmallYellowMan.h"
#define MYRadius 70
#define MYTopY   100
#define MYColor(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation DrawSmallYellowMan


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    drawBody(context,rect);
    drawMouse(context,rect);
    drawEyes(context,rect);
}

void drawBody(CGContextRef context,CGRect rect) {
    CGFloat topX = rect.size.width * 0.5;
    CGFloat topY = MYTopY;
    CGFloat topRadius = MYRadius;
    CGContextAddArc(context, topX, topY, topRadius, 0, M_PI, 1);
    
    CGFloat midDleX = topX - topRadius;
    CGFloat middleH = MYTopY;
    CGFloat middleY = topY + middleH;
    CGContextAddLineToPoint(context, midDleX, middleY);
    
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(context, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    CGContextClosePath(context);
    [MYColor(252, 218, 0) set];
    CGContextFillPath(context);
    
}

void drawMouse(CGContextRef context,CGRect rect) {
    
    CGFloat controlX = rect.size.width *0.5;
    CGFloat controlY = rect.size.height *0.45;
    CGFloat marginX = 25;
    CGFloat marginY = 15;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGFloat endX = controlX + marginX;
    CGFloat endY = currentY;
    CGContextMoveToPoint(context, currentX, currentY);
    CGContextAddQuadCurveToPoint(context, controlX, controlY, endX, endY);
    [[UIColor blackColor] set];
    CGContextStrokePath(context);
}

void drawEyes(CGContextRef context,CGRect rect) {
    CGFloat startX = rect.size.width *0.5 - MYRadius;
    CGFloat startY = MYTopY;
    CGContextMoveToPoint(context, startX, startY);
    
    CGFloat endX = startX + 2*MYRadius;
    CGFloat endY = startY;
    CGContextAddLineToPoint(context, endX, endY);
    [[UIColor blackColor] set];
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
    [MYColor(61, 62, 66) set];
    CGFloat jambRadius = MYRadius * 0.4;
    CGFloat jambY = startY;
    CGFloat jambX = rect.size.width*0.5 - jambRadius;
    CGContextAddArc(context, jambX, jambY, jambRadius, 0, M_PI*2, 0);
    CGContextFillPath(context);
    
    [[UIColor whiteColor] set];
    CGFloat whiteRadius = jambRadius*0.6;
    CGFloat whiteX = jambX;
    CGFloat whiteY = jambY;
    CGContextAddArc(context, whiteX, whiteY, whiteRadius, 0, M_PI*2, 0);
    CGContextSetLineWidth(context, 10);
    CGContextStrokePath(context);
}
@end
