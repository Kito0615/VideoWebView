//
//  VideoPreviewView.m
//  VideoPreview
//
//  Created by AnarL on 12/10/15.
//  Copyright © 2015 AnarL. All rights reserved.
//

#import "VideoPreviewView.h"
#define VIDEO_TAG @"<video id=\"player\"class=\"video-js vjs-default-skin\" preload=\"auto\"poster=%@ data-setup='{}'><source src=%@ type='video/mp4'></video>"

@implementation VideoPreviewView

- (void)loadHtmlWithPoster:(NSString *)poster video:(NSString *)videoString
{
    NSString * htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"source.html" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    
    NSString * videoTagString = [NSString stringWithFormat:VIDEO_TAG, poster, videoString];
    
    NSMutableString * htmlFullString = [NSMutableString stringWithString:htmlString];
    
    NSRange divRange = [htmlFullString rangeOfString:@"</div>"];
    
    if (divRange.location != NSNotFound) {
        [htmlFullString insertString:videoTagString atIndex:divRange.location];
    }
    
    [self.mainFrame loadHTMLString:htmlFullString baseURL:nil];
    
}

- (void)playVideo
{
    [self stringByEvaluatingJavaScriptFromString:@"playVideo()"];
}

- (void)pauseVideo
{
    [self stringByEvaluatingJavaScriptFromString:@"pauseVideo()"];
}

- (void)stopVideo
{
    [self stringByEvaluatingJavaScriptFromString:@"stopVideo()"];
}

- (void)setVolume:(float)volume
{
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"setVolume(%f)", volume]];
}

- (void)setProgress:(float)progress
{
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"setProgress(%f)", progress]];
}

-(float)progress
{
    NSString * progressString = [self stringByEvaluatingJavaScriptFromString:@"progress()"];
    return progressString.floatValue;
}

- (void)keyDown:(NSEvent *)theEvent
{
    [super keyDown:theEvent];
    
    if (theEvent.keyCode == 53) {
        [self exitFullScreenModeWithOptions:nil];
    }
}

@end
