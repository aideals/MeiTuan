//
//  MapViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-22.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyPoint.h"

@interface MapViewController ()<MKMapViewDelegate>
@property (weak,nonatomic) IBOutlet  MKMapView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.mapView setRegion:region animated:YES];
}


@end

