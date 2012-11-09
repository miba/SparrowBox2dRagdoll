//
//  Constants.h
//  SparrowBox2dRagdoll
//


//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32

//#define DRAW_BOX2D_WORLD  // <--------! Debug Draw ON/OFF

#define kStartTerrainStep 6

// Main objects
#define dolphinTag 1
#define terrainTag 12345
#define dustTag 11

// Collectable object
#define ringTag 2
#define ballTag 3
#define coinTag 4
#define tokenCoinTag 44

// Enemy objects
#define pepperTag 5
#define tokenPepperTag 55
#define turtleTag 6
#define hittedTurtleTag 66
#define gatorTag 7
#define hittedGatorTag 77
#define gatorPartTag 777
#define trunkTag 8
#define hittedTrunkTag 88
#define fishTag 9
#define hittedFishTag 99
#define piranhaTag 10
#define hittedPiranhaTag 1010

// Game layering
#define kSkyLevel 0
#define kMainLevel 2
#define kGUILevel 3

#define kWaterBkgLevel 0
#define kParticlesLevel 1
#define kUnderWaterLevel 2
#define kHeroLevel 3
#define kForegroundLevel 4
#define kWaterFrgLevel 5
#define kTerrainLevel 6
#define kGuiLevel 7
