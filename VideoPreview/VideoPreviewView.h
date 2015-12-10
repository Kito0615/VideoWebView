//
//  VideoPreviewView.h
//  VideoPreview
//
//  Created by AnarL on 12/10/15.
//  Copyright © 2015 AnarL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface VideoPreviewView : WebView

/**
 *  播放视频
 */
- (void)playVideo;
/**
 *  暂停视频
 */
- (void)pauseVideo;
/**
 *  停止视频
 */
- (void)stopVideo;
/**
 *  设置音量
 */
- (void)setVolume:(float)volume;
/**
 *  设置进度
 */
- (void)setProgress:(float)progress;
/**
 *  当前进度
 */
- (float)progress;
/**
 *  初始化视频播放页面
 *
 *  @param poster      视频截图
 *  @param videoString 视频地址
 */
- (void)loadHtmlWithPoster:(NSString *)poster video:(NSString *)videoString;

@end
