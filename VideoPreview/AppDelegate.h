//
//  AppDelegate.h
//  VideoPreview
//
//  Created by AnarL on 12/10/15.
//  Copyright © 2015 AnarL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "VideoPreviewView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    VideoPreviewView * _videoView;
    NSWindow * _window;
    NSTimer * _timer;
    NSSlider * _progressSlider;
    NSSlider * _volumeSlider;
}

@property (nonatomic, retain) VideoPreviewView * videoView;
@property (nonatomic, retain) NSTimer * timer;
@property (nonatomic, retain) NSSlider * progressSlider;
@property (nonatomic, retain) NSSlider * volumeSlider;


@end

