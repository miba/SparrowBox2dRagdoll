//
//  Game.mm
//  SparrowBox2dRagdoll
//

#import "Game.h" 
#import "Constants.h"
#import "Man.h"

// --- private interface ---------------------------------------------------------------------------

@interface Game ()

- (void)setup;
- (void)onImageTouched:(SPTouchEvent *)event;
- (void)onResize:(SPResizeEvent *)event;

- (void) initPhysics;

@end


// --- class implementation ------------------------------------------------------------------------

@implementation Game

@synthesize gameWidth  = mGameWidth;
@synthesize gameHeight = mGameHeight;

- (id)initWithWidth:(float)width height:(float)height
{
    if ((self = [super init]))
    {
        mGameWidth = width;
        mGameHeight = height;
        
        [self setup];
    }
    return self;
}

- (void)dealloc
{
    // release any resources here
    
    [Media releaseAtlas];
    [Media releaseSound];
    
    [super dealloc];
}

- (void)setup
{

    [SPAudioEngine start];  // starts up the sound engine   
    [Media initAtlas];      // loads your texture atlas -> see Media.h/Media.m
    [Media initSound];      // loads all your sounds    -> see Media.h/Media.m
    
    // Create a background image. 
    SPImage *background = [[SPImage alloc] initWithContentsOfFile:@"background.jpg"];
    background.pivotX = background.width / 2;
    background.pivotY = background.height / 2;
    background.x = mGameWidth / 2;
    background.y = mGameHeight / 2;
    [self addChild:background];
    
    
    // Display the Sparrow egg
    SPImage *image = [[SPImage alloc] initWithTexture:[Media atlasTexture:@"sparrow"]];
    image.pivotX = (int)image.width / 2;
    image.pivotY = (int)image.height / 2;
    image.x = mGameWidth / 2;
    image.y = mGameHeight / 2 + 40;
    [self addChild:image];
    
    // play a sound when the image is touched
    [image addEventListener:@selector(onImageTouched:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
    
    // and animate it a little
    SPTween *tween = [SPTween tweenWithTarget:image time:1.5 transition:SP_TRANSITION_EASE_IN_OUT];
    [tween animateProperty:@"y" targetValue:image.y + 30];
    [tween animateProperty:@"rotation" targetValue:0.1];
    tween.loop = SPLoopTypeReverse;
    [[SPStage mainStage].juggler addObject:tween];
    
    
    // Create a text field
    NSString *text = @"Tap the screen to add a ragdoll";
    
    SPTextField *textField = [[SPTextField alloc] initWithWidth:280 height:80 text:text];
    textField.x = (mGameWidth - textField.width) / 2;
    textField.y = image.y - 175;
    [self addChild:textField];
    
    // Add the event listeners 
    [self addEventListener:@selector(onResize:) atObject:self forType:SP_EVENT_TYPE_RESIZE];
    [self addEventListener:@selector(onEnterFrame:) atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
    [self addEventListener:@selector(onTouch:) atObject:self forType:SP_EVENT_TYPE_TOUCH];
    
    // We release the objects, because we don't keep any reference to them.
    [background release];
    [image release];
    [textField release];
    
    // Initi physic
    [self initPhysics];
    
    // Add the play area
    _playArea = [PlayArea playAreaWithWorld:_world :mGameWidth : mGameHeight];
    [self addChild:_playArea];

}

- (void)onImageTouched:(SPTouchEvent *)event
{
    NSSet *touches = [event touchesWithTarget:self andPhase:SPTouchPhaseEnded];
    if ([touches anyObject])
    {
        [Media playSound:@"sound.caf"];
    }
}

- (void)onResize:(SPResizeEvent *)event
{
    NSLog(@"new size: %.0fx%.0f (%@)", event.width, event.height, 
          event.isPortrait ? @"portrait" : @"landscape");
}

- (void)onTouch:(SPTouchEvent *)event
{
    SPTouch *touch = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
    if (touch) {
        SPPoint *touchPosition = [touch locationInSpace:self];
        Man *hero = [Man manWithWorld:_world :touchPosition];
        [_playArea addChild:hero];
    }
}

-(void) initPhysics
{
	
	b2Vec2 gravity;
	gravity.Set(0.0f, 10.0f);
	_world = new b2World(gravity);
    
#ifdef DRAW_BOX2D_WORLD
    _render = new GLESDebugDraw(PTM_RATIO);
	_world->SetDebugDraw(_render);
	uint32 flags = 0;
	flags += b2Draw::e_shapeBit;
    flags += b2Draw::e_jointBit;
    //	flags += b2Draw::e_aabbBit;
    //	flags += b2Draw::e_pairBit;
    //	flags += b2Draw::e_centerOfMassBit;
	_render->SetFlags(flags);
#endif
	
	_world->SetAllowSleeping(true);
	_world->SetContinuousPhysics(true);

}

- (void)onEnterFrame:(SPEnterFrameEvent *)event
{
    // FPS counter
    static int frameCount = 0;
    static double totalTime = 0;
    totalTime += event.passedTime;
    if (++frameCount % 60 == 0){
        NSLog(@"fps: %.2f", frameCount / totalTime);
        frameCount = totalTime = 0;
    }
    
    // Update box2d world
    int32 velocityIterations = 8;
	int32 positionIterations = 3;
	_world->Step(event.passedTime, velocityIterations, positionIterations);
    
#ifndef DRAW_BOX2D_WORLD
    // Update block's position and rotation
    for (b2Body* b = _world->GetBodyList(); b; b = b->GetNext())
	{
		if (b->GetUserData() != NULL)
        {
			SPImage *block = (SPImage*)b->GetUserData();
            block.x = b->GetPosition().x * PTM_RATIO;
            block.y = b->GetPosition().y * PTM_RATIO;
            block.rotation = b->GetAngle();
        }
	}
#endif
    
}


@end


