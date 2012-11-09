//
//  Man.h
//  SparrowBox2dRagdoll
//

#import "Box2D.h"


@interface Man : SPSprite {
    
    SPPoint *startPosition;
    
    b2World *world;
    
    b2Body *head;
    b2Body *torso1;
    b2Body *torso2;
    b2Body *torso3;
    b2Body *upperArmL;
    b2Body *upperArmR;
    b2Body *lowerArmL;
    b2Body *lowerArmR;
    b2Body *upperLegL;
    b2Body *upperLegR;
    b2Body *lowerLegL;
    b2Body *lowerLegR;
    b2Body *boat;

}

+ (id) manWithWorld:(b2World*)w :(SPPoint*)pos;
- (id) initWithWorld:(b2World*)w :(SPPoint*)pos;

@end
