//
//  Analyzer.h
//  DaonFaceSDK
//
//  Copyright © 2015-18 Daon. All rights reserved.
//

#ifndef Analyzer_h
#define Analyzer_h

#import <CoreVideo/CVPixelBuffer.h>
#import <UIKit/UIKit.h>

#import <DaonFaceSDK/DFSModuleProtocol.h>


@protocol DFSAnalyzerProtocol <DFSModuleProtocol>


- (NSDictionary*_Nullable) analyzeData:(NSData*_Nonnull)buffer
                             timestamp:(long long)ms;

// Single frame
- (NSDictionary*_Nullable) analyzeData:(NSData*_Nonnull)buffer;

@end

#endif /* Analyzer_h */
