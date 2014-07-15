//
//  UIViewController+BlockSegueTest.m
//  SampleProject
//
//  Created by Jorge Maroto García on 14/05/14.
//  Copyright (c) 2014 Jorge Maroto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import <UIViewController+BlockSegue.h>

@interface UIViewController_BlockSegueTest : XCTestCase {
    UIStoryboard *story;
    UIViewController *sut;
}
@end


@implementation UIViewController_BlockSegueTest

static NSString *const storyBoardName = @"Main";
static NSString *const segueOneId = @"segue1";

- (void)setUp{
    [super setUp];
    story = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    sut = [[story instantiateInitialViewController] viewControllers][0];
}

- (void)tearDown{
    [super tearDown];
    story = nil;
    sut = nil;
}

#pragma mark - Test nils
- (void)testStoryboardIsNotNull {
    XCTAssertNotNil(story, @"Storyboard shouldn't be nil");
}

- (void)testMainViewController {
    XCTAssertTrue([sut isKindOfClass:[UIViewController class]], @"Root viewcontroller should be a viewcontroller");
}

#pragma mark - Test success cases
- (void)testConfigureSegueWithBlock {
    __block int varTest = 0;

    [sut configureSegue:segueOneId withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {
        varTest = 1;
    }];
    [sut performSegueWithIdentifier:segueOneId sender:nil];
    
    XCTAssertEqual(varTest, 1, @"Block should be executed");
}

- (void)testPerformSegueWithBlock {
    __block int varTest = 0;
 
    [sut performSegueWithIdentifier:segueOneId sender:nil withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {
        varTest = 1;
    }];
    
    XCTAssertEqual(varTest, 1, @"Block should be executed");
}


#pragma mark - Test square cases

#pragma mark Nil identifier
- (void)testConfigureWithSegueIdNil {
    XCTAssertThrowsSpecificNamed(
         [sut configureSegue:nil withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {}],
                     NSException,
                     NSInvalidArgumentException,
                     @"This should raise an excepcion like as original perform method"
    );
}

- (void)testPerformSegueWithSegueIdNil {
    XCTAssertThrowsSpecificNamed(
         [sut performSegueWithIdentifier:nil
                      sender:nil
                   withBlock:^(id sender, id destinationVC, UIStoryboardSegue *segue) {}],
                     NSException,
                     NSInvalidArgumentException,
                     @"This should raise an excepcion like as original perform method"
    );
}

#pragma mark Nil block
- (void)testConfigureWithBlockNil {
    id vcMock = [OCMockObject partialMockForObject:sut];
    [vcMock configureSegue:segueOneId withBlock:nil];
    [vcMock performSegueWithIdentifier:segueOneId sender:nil];
    
    [[vcMock expect] prepareForSegue:nil sender:nil];
    
    XCTAssertThrows([vcMock verify], @"If block is nil, prepareForSegue isn't called");
}

- (void)testPerformSegueWithBlockNil {
    id vcMock = [OCMockObject partialMockForObject:sut];
    [vcMock performSegueWithIdentifier:segueOneId sender:nil withBlock:nil];
    
    [[vcMock expect] prepareForSegue:nil sender:nil];
    
    XCTAssertThrows([vcMock verify], @"If block is nil, prepareForSegue isn't called");
}

@end