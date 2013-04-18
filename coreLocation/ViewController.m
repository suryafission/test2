//
//  ViewController.m
//  coreLocation
//
//  Created by SUBRAHMANYAM NUKALA on 03/04/13.
//  Copyright (c) 2013 SUBRAHMANYAM NUKALA. All rights reserved.
//

#import "ViewController.h"
#import "annotation1.h"

@interface ViewController ()

@end
MKPinAnnotationView *newAnnotation;

@implementation ViewController
@synthesize locationManager,mapview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager.delegate=self;
    [locationManager startUpdatingLocation];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    CLLocation *newlocation = [locations lastObject];
    CLLocationCoordinate2D centre;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    centre.latitude = newlocation.coordinate.latitude;
    centre.longitude = newlocation.coordinate.longitude;
    span.latitudeDelta = 0.5f;
    span.longitudeDelta = 0.5f;
    region.center = centre;
    region.span = span;
    annotation1 *ann = [annotation1 alloc];
    ann.coordinate = centre;
    ann.title = @"title";
    ann.subtitle = @"subtitle";
    mapview.delegate =self;	
    [mapview addAnnotation:ann];
    //[mapview selectAnnotation:ann animated:YES];
   [newAnnotation setSelected:YES animated:YES];
    [mapview setRegion:region animated:YES];
}
-(MKAnnotationView *)mapView :(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)a
{
    NSLog(@"entered pin ann");
  newAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:a reuseIdentifier:@"redpin"];
    newAnnotation.pinColor = MKPinAnnotationColorGreen;
   // newAnnotation.image = [UIImage imageNamed:@"red.jpg"];
    newAnnotation.canShowCallout =YES;
    //newAnnotation.backgroundColor = [UIColor redColor];
    //newAnnotation.enabled = NO;
    newAnnotation.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bubble1.png"]];
    //newAnnotation.frame
    newAnnotation.rightCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bubble1.png"]];
    //[newAnnotation setSelected: animated:YES];
    return newAnnotation;
    
}

-(void)ambati
{
    NSLog(@"ambati");
}


@end
