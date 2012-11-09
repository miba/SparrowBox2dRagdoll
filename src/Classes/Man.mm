//
//  Man.mm
//  SparrowBox2dRagdoll
//

#import "Constants.h"
#import "Man.h"
#import "Box2D.h"


@interface Man()
- (void) createBox2DBody;
@end

@implementation Man



// ----------Initialization and deallocation
//------------------------------------------
+ (id) manWithWorld:(b2World*)w :(SPPoint*)pos{
	return [[[self alloc] initWithWorld:(b2World*)w :(SPPoint*)pos] autorelease];
}

- (id) initWithWorld:(b2World*)w :(SPPoint*)pos{
	
	if ((self = [super init])) {
        
        // Initialize man variables
        world = w;
        startPosition = pos;

        
        // Create phisic bodies and joints
		[self createBox2DBody];

	}
	return self;
}

- (void) dealloc {
    
	[super dealloc];
}




// ----------Box2d body creation
//------------------------------------------
- (void) createBox2DBody {
    
    // -------------------------
    // Bodies ------------------
    // -------------------------
    b2BodyDef bd;
    bd.type = b2_dynamicBody;
    b2PolygonShape box;
    b2FixtureDef fixtureDef;
    
    // Head ------
    b2CircleShape headShape;
    headShape.m_radius = 3.75f/PTM_RATIO;
    fixtureDef.shape = &headShape;
    fixtureDef.density = 1.0f;
    fixtureDef.friction = 0.4f;
    fixtureDef.restitution = 0.3f;
    bd.position.Set(startPosition.x/PTM_RATIO, startPosition.y/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *head = [[SPImage alloc] initWithContentsOfFile:@"...."];
    [self addChild:head];
    bd.userData = testa;*/
#endif
    head = world->CreateBody(&bd);//b2Body *head
    head->CreateFixture(&fixtureDef);
    head->SetSleepingAllowed(true);

    
    // Torso1 ----
    box.SetAsBox(4.5f/PTM_RATIO, 3.0f/PTM_RATIO);
    fixtureDef.shape = &box;
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    bd.position.Set(startPosition.x/PTM_RATIO, (startPosition.y + 7.5f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *Storso1 = ...
    [self addChild:Storso1];
    bd.userData = Storso1;*/
#endif
    torso1 = world->CreateBody(&bd);
    torso1->CreateFixture(&fixtureDef);
    torso1->SetSleepingAllowed(true);

    
    // Torso2 ----
    box.SetAsBox(4.5f/PTM_RATIO, 3.0f/PTM_RATIO);
    fixtureDef.shape = &box;
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    bd.position.Set(startPosition.x/PTM_RATIO, (startPosition.y + 12.9f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *Storso2 = ...
    [self addChild:Storso2];
    bd.userData = Storso2;*/
#endif
    torso2 = world->CreateBody(&bd);
    torso2->CreateFixture(&fixtureDef);
    torso2->SetSleepingAllowed(true);

    
    // Torso3 ----
    box.SetAsBox(4.5f/PTM_RATIO, 3.0f/PTM_RATIO);
    fixtureDef.shape = &box;
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    bd.position.Set(startPosition.x/PTM_RATIO, (startPosition.y + 17.4f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *Storso3 = ...
    [self addChild:Storso3];
    bd.userData = Storso3;*/
#endif
    torso3 = world->CreateBody(&bd);
    torso3->CreateFixture(&fixtureDef);
    torso3->SetSleepingAllowed(true);

    
    // UpperArm --
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    
    // Left
    box.SetAsBox(5.3f/PTM_RATIO, 1.95f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x - 9.0f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SupperArmL = ...
    [self addChild:SupperArmL];
    bd.userData = SupperArmL;*/
#endif
    upperArmL = world->CreateBody(&bd);
    upperArmL->CreateFixture(&fixtureDef);
    upperArmL->SetSleepingAllowed(true);
    
    // Right
    box.SetAsBox(5.3f/PTM_RATIO, 1.95f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x + 9.0f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SupperArmR = ...
    [self addChild:SupperArmR];
    bd.userData = SupperArmR;*/
#endif
    upperArmR = world->CreateBody(&bd);
    upperArmR->CreateFixture(&fixtureDef);
    upperArmR->SetSleepingAllowed(true);

    
    // Lower Arm
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    // Left
    box.SetAsBox(5.3f/PTM_RATIO, 1.95f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x - 17.1f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SlowerArmL = ...
    [self addChild:SlowerArmL];
    bd.userData = SlowerArmL;*/
#endif
    lowerArmL = world->CreateBody(&bd);
    lowerArmL->CreateFixture(&fixtureDef);
    lowerArmL->SetSleepingAllowed(true);
    // Right
    box.SetAsBox(5.3f/PTM_RATIO, 1.95f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x + 17.1f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SlowerArmR = ...
    [self addChild:SlowerArmR];
    bd.userData = SlowerArmR;*/
#endif
    lowerArmR = world->CreateBody(&bd);
    lowerArmR->CreateFixture(&fixtureDef);
    lowerArmR->SetSleepingAllowed(true);

    
    // UpperLeg
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    // Left
    box.SetAsBox(2.25f/PTM_RATIO, 6.6f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x - 2.4f)/PTM_RATIO, (startPosition.y + 25.5f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SupperLeg = ...
    [self addChild:SupperLeg];
    bd.userData = SupperLeg;*/
#endif
    upperLegL = world->CreateBody(&bd);
    upperLegL->CreateFixture(&fixtureDef);
    upperLegL->SetSleepingAllowed(true);
    // Right
    box.SetAsBox(2.25f/PTM_RATIO, 6.6f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x + 2.4f)/PTM_RATIO, (startPosition.y + 25.5f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SupperLegR = ...
    [self addChild:SupperLegR];
    bd.userData = SupperLegR;*/
#endif
    upperLegR = world->CreateBody(&bd);
    upperLegR->CreateFixture(&fixtureDef);
    upperLegR->SetSleepingAllowed(true);

    
    // LowerLeg
    fixtureDef.density = 0.3f;
    fixtureDef.friction = 0.12f;
    fixtureDef.restitution = 0.03f;
    // Left
    box.SetAsBox(1.8f/PTM_RATIO, 6.0f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x - 2.4f)/PTM_RATIO, (startPosition.y + 36.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SLowerLegL = ...
    [self addChild:SLowerLegL];
    bd.userData = SLowerLegL;*/
#endif
    lowerLegL = world->CreateBody(&bd);
    lowerLegL->CreateFixture(&fixtureDef);
    lowerLegL->SetSleepingAllowed(true);
    // Right
    box.SetAsBox(1.8f/PTM_RATIO, 6.0f/PTM_RATIO);
    fixtureDef.shape = &box;
    bd.position.Set((startPosition.x + 2.4f)/PTM_RATIO, (startPosition.y + 36.0f)/PTM_RATIO);
#ifndef DRAW_BOX2D_WORLD
    /*SPImage *SlowerLegR = ...
    [self addChild:SlowerLegR];
    bd.userData = SlowerLegR;*/
#endif
    lowerLegR = world->CreateBody(&bd);
    lowerLegR->CreateFixture(&fixtureDef);
    lowerLegR->SetSleepingAllowed(true);

    
    // -------------------------
    // Joints ------------------
    // -------------------------
    b2RevoluteJointDef jd;
    jd.enableLimit = true;
    
    // Head to shoulders
    jd.lowerAngle = -40.0f / (180.0f / M_PI);
    jd.upperAngle = 40.0f / (180.0f / M_PI);
    jd.Initialize(torso1, head, b2Vec2((startPosition.x)/PTM_RATIO, (startPosition.y + 4.5f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    // Upper arm to shoulders
    // Left
    jd.lowerAngle = -85.0f / (180.0f / M_PI);
    jd.upperAngle = 130.0f / (180.0f / M_PI);
    jd.Initialize(torso1, upperArmL, b2Vec2((startPosition.x - 5.4f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO));
    world->CreateJoint(&jd);
    // Right
    jd.lowerAngle = -130.0f / (180.0f / M_PI);
    jd.upperAngle = 85.0f / (180.0f / M_PI);
    jd.Initialize(torso1, upperArmR, b2Vec2((startPosition.x + 5.4f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    
    // Lower arm to shoulders
    // Left
    jd.lowerAngle = -130.0f / (180.0f / M_PI);
    jd.upperAngle = 10.0f / (180.0f / M_PI);
    jd.Initialize(upperArmL, lowerArmL, b2Vec2((startPosition.x - 13.5f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO));
    world->CreateJoint(&jd);
    // Right
    jd.lowerAngle = -10.0f / (180.0f / M_PI);
    jd.upperAngle = 130.0f / (180.0f / M_PI);
    jd.Initialize(upperArmR, lowerArmR, b2Vec2((startPosition.x + 13.5f)/PTM_RATIO, (startPosition.y + 6.0f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    
    // Shoulders / stomach
    jd.lowerAngle = -15.0f / (180.0f / M_PI);
    jd.upperAngle = 15.0f / (180.0f / M_PI);
    jd.Initialize(torso1, torso2, b2Vec2((startPosition.x)/PTM_RATIO, (startPosition.y + 10.5f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    
    // Stomach / hips
    jd.Initialize(torso2, torso3, b2Vec2((startPosition.x)/PTM_RATIO, (startPosition.y + 15.0f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    
    // Torso to upper leg
    // Left
    jd.lowerAngle = -25.0f / (180.0f / M_PI);
    jd.upperAngle = 45.0f / (180.0f / M_PI);
    jd.Initialize(torso3, upperLegL, b2Vec2((startPosition.x - 2.4f)/PTM_RATIO, (startPosition.y + 21.6f)/PTM_RATIO));
    world->CreateJoint(&jd);
    // Right
    jd.lowerAngle = -45.0f / (180.0f / M_PI);
    jd.upperAngle = 25.0f / (180.0f / M_PI);
    jd.Initialize(torso3, upperLegR, b2Vec2((startPosition.x + 2.4f)/PTM_RATIO, (startPosition.y + 21.6f)/PTM_RATIO));
    world->CreateJoint(&jd);
    
    
    // Upper leg to lower leg
    // Left
    jd.lowerAngle = -25.0f / (180.0f / M_PI);
    jd.upperAngle = 115.0f / (180.0f / M_PI);
    jd.Initialize(upperLegL, lowerLegL, b2Vec2((startPosition.x - 2.4f)/PTM_RATIO, (startPosition.y + 31.5f)/PTM_RATIO));
    world->CreateJoint(&jd);
    // Right
    jd.lowerAngle = -115.0f / (180.0f / M_PI);
    jd.upperAngle = 25.0f / (180.0f / M_PI);
    jd.Initialize(upperLegR, lowerLegR, b2Vec2((startPosition.x + 2.4f)/PTM_RATIO, (startPosition.y + 31.5f)/PTM_RATIO));
    world->CreateJoint(&jd);
}

@end
