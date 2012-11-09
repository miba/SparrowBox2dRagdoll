//
//  Game.h
//  SparrowBox2dRagdoll
//

#import <Foundation/Foundation.h>
#import <UIKit/UIDevice.h>
#import "Box2D.h"
#import "GLES-Render.h"
#import "PlayArea.h"


@interface Game : SPSprite
{
  @private 
    float mGameWidth;
    float mGameHeight;
    
    b2World* _world;
    GLESDebugDraw *_render;
    
    PlayArea *_playArea;
}

- (id)initWithWidth:(float)width height:(float)height;

@property (nonatomic, assign) float gameWidth;
@property (nonatomic, assign) float gameHeight;

@end
