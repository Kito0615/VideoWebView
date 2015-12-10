//
//  AppDelegate.m
//  VideoPreview
//
//  Created by AnarL on 12/10/15.
//  Copyright © 2015 AnarL. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (assign) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

@synthesize videoView = _videoView;
@synthesize window = _window;
@synthesize timer = _timer;
@synthesize progressSlider = _progressSlider;
@synthesize volumeSlider = _volumeSlider;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
    [self createUI];
}

- (void)createUI
{
    _videoView = [[VideoPreviewView alloc] initWithFrame:NSMakeRect(0, 25, self.window.frame.size.width, self.window.frame.size.height - 22 - 25)];
    
    [_videoView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
    NSButton * initBtn = [[NSButton alloc] initWithFrame:NSMakeRect(20, 0, 30, 25)];
    initBtn.title = @"Init";
    [initBtn setTarget:self];
    [initBtn setAction:@selector(initWebView)];
    
    NSButton * playBtn = [[NSButton alloc] initWithFrame:NSMakeRect(70, 0, 30, 25)];
    playBtn.title = @"Play";
    [playBtn setTarget:self];
    [playBtn setAction:@selector(startPlay)];
    
    NSButton * stopBtn = [[NSButton alloc] initWithFrame:NSMakeRect(610, 0, 30, 25)];
    stopBtn.title = @"Stop";
    [stopBtn setTarget:_videoView];
    [stopBtn setAction:@selector(stopVideo)];
    
    NSButton * pauseBtn = [[NSButton alloc] initWithFrame:NSMakeRect(120, 0, 30, 25)];
    pauseBtn.title = @"Pause";
    [pauseBtn setTarget:_videoView];
    [pauseBtn setAction:@selector(pauseVideo)];
    
    NSButton * fullscreenBtn = [[NSButton alloc] initWithFrame:NSMakeRect(660, 0, 30, 25)];
    fullscreenBtn.title = @"full";
    [fullscreenBtn setTarget:self];
    [fullscreenBtn setAction:@selector(fullscreenToPlay)];
    
    _volumeSlider = [[NSSlider alloc] initWithFrame:NSMakeRect(170, 10, 200, 5)];
    [_volumeSlider setTarget:self];
    [_volumeSlider setAction:@selector(setVolume:)];
    _volumeSlider.floatValue = 0.5f;
    [_videoView setVolume:_volumeSlider.floatValue];
    
    _progressSlider = [[NSSlider alloc] initWithFrame:NSMakeRect(390, 10, 200, 5)];
    [_progressSlider setTarget:self];
    [_progressSlider setAction:@selector(setProgress:)];
    
    [self.window.contentView addSubview:initBtn];
    [self.window.contentView addSubview:pauseBtn];
    [self.window.contentView addSubview:playBtn];
    [self.window.contentView addSubview:stopBtn];
    [self.window.contentView addSubview:fullscreenBtn];
    [self.window.contentView addSubview:_volumeSlider];
    [self.window.contentView addSubview:_progressSlider];
    [self.window.contentView addSubview:_videoView];
    
    [_videoView release];
    [initBtn release];
    [playBtn release];
    [pauseBtn release];
    [stopBtn release];
    [fullscreenBtn release];
    [_volumeSlider release];
    [_progressSlider release];
}

- (void)fullscreenToPlay
{
    [_videoView enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
}


- (void)startPlay
{
    [_videoView playVideo];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress
{
    _progressSlider.floatValue = [_videoView progress];
}

- (void)setVolume:(NSSlider *)sender
{
    [_videoView setVolume:sender.floatValue];
}

- (void)setProgress:(NSSlider *)sender
{
    [_videoView setProgress:sender.floatValue];
}

- (void)initWebView
{
    [_videoView loadHtmlWithPoster:@"https://i.ytimg.com/vi/nfWlot6h_JM/maxresdefault.jpg" video:@"https://r6---sn-nwj7knez.googlevideo.com/videoplayback?pl=25&requiressl=yes&expire=1449763168&nh=IgpwcjAyLnBhbzAzKgkxMjcuMC4wLjE&initcwndbps=687500&id=o-ANOrRTSErEOFspU5hP1lOVxjHoFq-hXfxOmNcZeP6fKs&sparams=dur%2Cid%2Cinitcwndbps%2Cip%2Cipbits%2Citag%2Clmt%2Cmime%2Cmm%2Cmn%2Cms%2Cmv%2Cnh%2Cpl%2Cratebypass%2Crequiressl%2Csource%2Cupn%2Cexpire&ip=106.186.27.149&mt=1449741401&mv=m&ms=au&fexp=9408938%2C9409165%2C9416126%2C9416852%2C9418200%2C9420452%2C9422596%2C9423662%2C9423940%2C9423978%2C9424115%2C9424299&dur=241.626&upn=9zoAwE18GMc&mm=31&source=youtube&mn=sn-nwj7knez&sver=3&ratebypass=yes&lmt=1435377448335401&ipbits=0&mime=video%2Fmp4&key=yt6&itag=22&signature=0A2D668BEF1850ABC7A05792FEAF7976AEC82AB5.0F3791EF58A69702CA59285456EFF0720744DD2B"];
    
    [_videoView playVideo];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (void)dealloc
{
    self.progressSlider = nil;
    [super dealloc];
}
@end
