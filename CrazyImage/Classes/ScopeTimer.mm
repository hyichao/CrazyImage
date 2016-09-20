//
//  ScopedCostTimeHelper.m
//  faceIOS
//
//  Created by yichaohuang on 16/4/7.
//  Copyright © 2016年 tencent. All rights reserved.
//

#import "ScopeTimer.h"

ScopeTimer::ScopeTimer(const std::string &prefix)
: _prefix(prefix)
{
    
}

ScopeTimer::~ScopeTimer()
{
    @autoreleasepool {
        NSLog(@"%s", getRecordStr().c_str());
    }
}

void ScopeTimer::startRecord()
{
    _costIdArray.clear();
    _costTimeArray.clear();
    _costIdArray.push_back(kSpecialCostIdStart);
    _costTimeArray.push_back(CFAbsoluteTimeGetCurrent());
}

void ScopeTimer::addRecord(const std::string& costId)
{
    _costIdArray.push_back(costId);
    _costTimeArray.push_back(CFAbsoluteTimeGetCurrent());
}

std::string ScopeTimer::getRecordStr()
{
    @autoreleasepool {
        NSMutableString *str = [NSMutableString stringWithFormat:@"COST %s:", _prefix.c_str()];
        if ( _costIdArray.size() <=1 || _costIdArray[0].compare(kSpecialCostIdStart) != 0 ) {
            return str.UTF8String;
        }
        
        double startTime = _costTimeArray[0];
        
        for ( int i=1; i<_costIdArray.size(); i++ ) {
            std::string costId = _costIdArray[i];
            double endTime = _costTimeArray[i];
            [str appendFormat:@" %s[%.3f],", costId.c_str(), (endTime-startTime)*1000.0];
            startTime = endTime;
        }
        return str.UTF8String;
    }
}
