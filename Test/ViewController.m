//
//  ViewController.m
//  Test
//
//  Created by Moritz Pfeiffer on 18.02.16.
//  Copyright © 2016 Moritz Pfeiffer. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>
    @property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if(self.locationManager == nil){
        self.locationManager = [[CLLocationManager alloc] init];
    }
    
    // Set the delegate
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    
    [self.locationManager startMonitoringSignificantLocationChanges];

}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
        CLLocation *currentLoc = [locations lastObject];
    NSLog(@"New Location: %f/%f, Locations: %lu", currentLoc.coordinate.latitude, currentLoc.coordinate.longitude,(unsigned long)[locations count]);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Loc Error: %@", [error userInfo]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
