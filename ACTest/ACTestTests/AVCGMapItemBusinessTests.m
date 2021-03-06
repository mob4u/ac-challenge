//
//  AVCGMapItemBusinessTests.m
//  ACTest
//
//  Created by Luiz Duraes on 3/27/16.
//  Copyright © 2016 Mob4U IT Solutions. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AVCGMapItem+AVCBusiness.h"

@interface AVCGMapItemBusinessTests : XCTestCase

@end

@implementation AVCGMapItemBusinessTests

#pragma mark - Tests

-(void)testSearchDisplayAllOnMap {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchDisplayAllOnMap"];
    [AVCGMapItem searchAddress:@"new york" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[1][0];
        XCTAssertEqualObjects(@"New York, NY, USA", item.address, @"Fail retrieving - New York, NY, USA");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchOneAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchOneAddress"];
    [AVCGMapItem searchAddress:@"santos" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[1][0];
        XCTAssertEqualObjects(@"Santos, State of São Paulo, Brazil", item.address, @"Fail retrieving - Santos, State of São Paulo, Brazil");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchMoreThanOneAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchMoreThanOneAddress"];
    [AVCGMapItem searchAddress:@"springfield" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        AVCGMapItem *item = (AVCGMapItem *)arrayItems[2][0];
        XCTAssertEqualObjects(@"Springfield, MO, USA", item.address, @"Fail retrieving - Springfield, MO, USA");
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

-(void)testSearchInvalidAddress {
    XCTestExpectation *testExpectation = [self expectationWithDescription:@"searchInvalidAddress"];
    [AVCGMapItem searchAddress:@"sxptoydsadsa" withCompletionHandler:^(NSArray *arrayItems, NSError *error) {
        XCTAssertNil(error);
        XCTAssertTrue([arrayItems[1] count] == 0);
        [testExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:nil];
}

#pragma mark - Override

-(void)setUp {
    [super setUp];
}

-(void)tearDown {
    [super tearDown];
}

@end
