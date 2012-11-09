//
//  PlayArea.mm
//  SparrowBox2dRagdoll
//

#import "PlayArea.h"
#import "Constants.h"

@interface PlayArea()
- (void) createBox2DBodies;
@end

@implementation PlayArea


// ----------Initialization and deallocation
//------------------------------------------
+ (id) playAreaWithWorld:(b2World*)w :(float)width :(float)height
{
	return [[[self alloc] initWithWorld:w :(float)width :(float)height] autorelease];
}

- (id) initWithWorld:(b2World*)w :(float)width :(float)height
{	
	if ((self = [super init])) 
    {
		world = w;
        screenWidth = width;
        screenHeight = height;
        [self createBox2DBodies];     
	}
	return self;
}

- (void) dealloc 
{
    
	[super dealloc];
}


// ----------Box2D management 
//------------------------------------------
- (void) createBox2DBodies {
    
    // Add the walls
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0);
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
	
	b2EdgeShape groundBox;
    
	groundBox.Set(b2Vec2(0,0), b2Vec2(screenWidth/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	
	groundBox.Set(b2Vec2(0,screenHeight/PTM_RATIO), b2Vec2(screenWidth/PTM_RATIO,screenHeight/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	
	groundBox.Set(b2Vec2(0,screenHeight/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	
	groundBox.Set(b2Vec2(screenWidth/PTM_RATIO,screenHeight/PTM_RATIO), b2Vec2(screenWidth/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
    
}

@end

#ifdef DRAW_BOX2D_WORLD
@implementation PlayArea (Rendering)
 
- (void)render:(SPRenderSupport *)support
{
    [support bindTexture:nil];
	glEnableClientState(GL_VERTEX_ARRAY);
	world->DrawDebugData();
	glDisableClientState(GL_VERTEX_ARRAY);
}
 
@end
#endif


