//
//  ViewController.m
//  powerLevel
//
//  Created by Jason C on 6/6/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "ViewController.h"
#import <AppLovinSDK/AppLovinSDK.h>


@interface ViewController () <ALAdLoadDelegate>
@property (nonatomic, strong) ALAd *ad;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Optional: Assign delegates
    [ALInterstitialAd shared].adDisplayDelegate = self;
    [ALInterstitialAd shared].adVideoPlaybackDelegate = self;
    
    
    [self loadInterstitialAd];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadInterstitialAd
{
    // Load an interstitial ad and be notified when the ad request is finished.
    [[ALSdk shared].adService loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
}

#pragma mark - Ad Load Delegate

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad
{
    // We now have an interstitial ad we can show!
    self.ad = ad;
    
    [[ALInterstitialAd shared] showOver: [UIApplication sharedApplication].keyWindow andRender: self.ad];
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code
{
    // Look at ALErrorCodes.h for the list of error codes.
}



@end
