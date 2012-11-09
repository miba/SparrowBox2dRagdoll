//
//  PlayArea.h
//  SparrowBox2dRagdoll
//

#import "Box2D.h"

@interface PlayArea : SPSprite {
    
    b2World *world;
    float screenWidth;
    float screenHeight;
  
}

+ (id) playAreaWithWorld:(b2World*)w :(float)width :(float)height;
- (id) initWithWorld:(b2World*)w :(float)width :(float)height;

@end
