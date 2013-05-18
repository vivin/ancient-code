

'FROM:    KARINA MISTER(WPBS12B)

'How would you all like to see a Final Fantasy-style RPG game

'engine? The overworld maps would be in SCREEN 7 text, but

'the battle scenes would use REAL graphics (SCREEN 7, again,

'but hey, I'm posting this on $P$rodigy!). You would control

'3 characters: Kyta, Glenlin, and Kohlen. One is a fighter,

'one a mage, and the other a ninja. Think of treasure chests

'(some of them containing monsters!), weapon/armor shops,

'inns, 12 magic spells, and a rather short and abrupt

'storyline. Think of battles against foes, changing

'background graphics, and, best of all, the ability to edit

'it to make ANYTHING YOU WANT out of it RPG-wise.

'                                                 [>]

'Think of a few days, 2 weeks at most. I've already started,

'and I'm about 60% done (in two days!). Here's what's left:

'* Weapon/armor shop

'* Inn

'* Interactive battle scenes

'* Talking to the king

'That's it!

'It's already pretty large, and I'm not sure how much larger

'it will get. However, I will either post it here, send it

'out via email, or BOTH. It's completely self-contained, but

'only because I'm posting it on $P$rodigy (or thinking about

'it, anyway). It can be converted to data files without any >

'problem. Anyway, though, reply here and tell me what you

'think. Here's a taste of what it'll be like: the SPELLS!

'CURE         Recover HP in one party member

'HEAL " in all party members                         "

'FIRE         Fire attack

'ICE          Ice attack

'LIGHTNING    Lightning attack

'TREMOR       Earth attack

'DROWN        Water attack

'WALL         Block spells

'LIFE         Bring back to life

'[>]

'QUAKE        Major earth attack against all enemies

'PHASE        Major attack against all enemies

'TIDAL WAVE   Major water attack against all enemies

'

'~-ThOmAs

'OK, I'm ALMOST done. Here's what remains:

'* Enemies still need to be able to cast HEAL, PENETRATE, and

'  TREMOR.

'* You still need to be able to get experience and gold from

'  defeating enemies (piece of cake to program).

'* You still need to be able to run from battles (no prob).

'* You still need to be able to camp (no prob).

'* The weapon/armor shop and inventory screen still need to

'  be created.

'* The game over screen (NOTICE: you are dead) still needs

'  to be created.

'That's IT! It may sound like a lot, but trust me:    [>]

'compared to what I've already done, that's dust on the

'floor!



'Also, I may or may not be sending copies via Internet email.

'It may be easier to just send via $P$rodigy email.













                                 '~-ThOmAs



'Finally, it's done! :) The following 30 subjects contain the

'source code to one of the most complex RPG's ever posted on

'this bb. The battle scenes are similar to those in Final

'Fantasy II, with 3 characters battling 1 to 4 enemies, the

'strongest characters moving first. There are many different

'types of attacks, as well: 3 different weapon attacks, 3

'different beam attacks, 2 different star attacks, a jumping

'attack, and 12 magic spells. Each spell uses an elemental to

'inflict damage, and if the enemy is weak against that

'elemental, it will receive up to 3x as much damage. However,

'if the enemy is STRONG against that elemental, it will GAIN

'life instead of losing it.       [>]

'There's also the ever-popular WALL spell, which will NOT

'ONLY *block* the enemies' spells, but also BOUNCE THEM BACK

'at the enemy! And new spells are learned as you gain levels!

'Of course, this game also has the usual RPG elements:

'weapon/armor shops, status screens, HP, MP, GP, inns,

'campgrounds, a storyline, and a shocking final battle.

'

'Best of all... this game runs from an RPG game engine, which

'can be easily EDITED to make... you guessed it... your OWN

'RPG!!!

'

'Please reply with any and all comments, and HAVE FUN!   ~T~



'Note 1 of 30

'$DYNAMIC

DEFINT A-Z

DECLARE FUNCTION Surrounding% (ttlf$)

DECLARE SUB Epilogue ()

DECLARE SUB StayTheNight ()

DECLARE SUB CampGround ()

DECLARE SUB StatusScreen ()

DECLARE SUB EquipItems ()

DECLARE SUB Mosaic (Siz)

DECLARE SUB CheapSkate ()

DECLARE SUB EnsueBattle ()

DECLARE SUB WinBattle ()

DECLARE SUB SetBattle (batnum, enum)

DECLARE SUB RandBattle (batnum1, batnum2)

DECLARE SUB PlaceEnemies ()

DECLARE SUB AreYouDead ()

DECLARE SUB CharMenu (sabro)

DECLARE SUB CharAttack (sabro)

DECLARE SUB KytaAttack (etarg)

DECLARE SUB GlenlinAttack (etarg)

DECLARE SUB KohlenAttack (etarg)

DECLARE SUB BeamAttack (bnum, et)

DECLARE SUB JumpAttack (et)

DECLARE SUB TossStar (snum, etarg)

DECLARE SUB EnemyAttack (enum)

DECLARE SUB KillEnemy (et)

DECLARE SUB KillChar (et)

DECLARE SUB EnemyGo (sabro)

DECLARE SUB TargetEnemy1 (sabro)

DECLARE SUB TargetEnemy2 (sabro)

DECLARE SUB TargetChar (sabro)

DECLARE SUB ChooseBeam ()

DECLARE SUB ChooseMagic ()

DECLARE SUB ChooseStar ()

DECLARE SUB CastSpell (spnum, etarg)

DECLARE SUB EnemySpell (spnum)

DECLARE SUB ReflectSpell (spnum, et)

DECLARE SUB FireSpell (ex, ey, et)

DECLARE SUB IceSpell (ex, ey, et)

DECLARE SUB LightningSpell (ex, ey, et)

DECLARE SUB DrownSpell (ex, ey, et)

DECLARE SUB TremorSpell (ex, ey, et)

DECLARE SUB DamageChar (tdmg, et)

DECLARE SUB DamageEnemy (elm, tdmg, etarg)

DECLARE SUB NotEnoughMP ()

DECLARE SUB RunAway ()

DECLARE SUB InitializeGame ()

DECLARE SUB DrawBattleField ()

DECLARE SUB DrawBattleCave ()

DECLARE SUB DrawMap (backcolor)

DECLARE SUB DrawGraphic (xcoor, x2010)

DECLARE SUB GetGraphics ()

DECLARE SUB PlayMainGame ()

DECLARE SUB VillagerTalk (vlgnum)

DECLARE SUB InnkeeperTalk ()

DECLARE SUB ShopkeeperTalk ()

DECLARE SUB BuyItem ()

DECLARE SUB SellItem ()

DECLARE SUB QueenTalk ()

DECLARE SUB KingTalk ()

DECLARE SUB TreasureChest (trnum, fght, itmnum, quan)

DECLARE SUB EmptyChest ()

DECLARE SUB RemoveGraphics ()

DECLARE SUB delay (deltime!)

DIM SHARED Kyta1(140), Kyta2(140), Glenlin1(140), Glenlin2(140)

DIM SHARED Kohlen1(140), Kohlen2(140), Lit1(140), Lit2(140)

DIM SHARED Heal1(140), Vampira1(140), Bat1(140), Shruik1(140)

DIM SHARED Bang1(70), Bangm(70), Villager$(7, 3), treasure(6)

DIM SHARED Kytam(140), Kytm2(140), Glenlinm(140), Glenlim2(140)

DIM SHARED Kohlenm(140), Kohlem2(140), Litm(140), Lim2(140)

DIM SHARED Healm(140), Vampiram(140), Batm(140), Shruikm(140)

DIM SHARED curmap$(20), px, py, qu$(6), ki$(9), totalback, mn$(12)

DIM SHARED etype(5, 13), ename$(5), inven(18), equip(3, 2)

DIM SHARED charstat(3, 4), curhp(3), curgold, curmp, erlvl

DIM SHARED mpused(12), levelup(4), curexp(3), curlev(3), in$(18)

DIM SHARED spellsknown(12), mapnumber, enemyat(4), cannotrun

DIM SHARED weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2)

DIM SHARED canequip(3, 4), chosen(3, 3), power(6 TO 17, 2)

DIM SHARED ehit(4), totalexp, totalgold, gitm(4), walled(4)

InitializeGame

PlayMainGame

RemoveGraphics

SCREEN 0: WIDTH 80: CLS : SYSTEM

'Data for KYTA character

DATA x,x,x,x,x,x,x,x,x,x,11,11,11,11,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,11,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,1,14,14,14,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,14,14,14,14,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,2,6,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,6,10,6,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,6,10,6,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,6,10,6,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,6,10,6,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,2,6,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,2,2,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,6,6,6,6,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,6,6,6,6,6,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,11,11,11,11,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,11,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,1,14,14,14,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,14,14,14,14,11,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,2,6,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,15,2,2,6,10,6,2,2,x,x,x,x,x

DATA x,x,x,7,7,7,7,15,6,6,10,6,2,2,2,x,x,x,x,x

DATA x,x,7,8,8,8,8,6,10,10,6,2,2,2,2,x,x,x,x,x

DATA x,x,x,7,7,7,7,15,6,6,2,2,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,15,2,2,2,2,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,2,2,2,2,2,2,2,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,6,6,6,6,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,6,6,6,6,6,x,x,x,x,x,x,x

'Data for GLENLIN character

DATA x,x,x,x,x,x,x,x,x,x,15,15,15,15,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,15,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,12,14,14,14,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,14,14,14,14,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,11,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,8,8,8,7,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,8,8,8,8,8,7,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,8,8,7,8,8,7,x,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,7,8,7,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,7,8,7,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,7,8,7,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,7,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,7,x,x,x

DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,7,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,6,6,6,12,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,6,6,6,6,12,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,15,15,15,15,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,15,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,12,14,14,14,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,14,14,14,14,15,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,11,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,7,8,7,8,8,8,8,7,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,8,7,7,8,8,8,7,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,7,8,8,7,8,8,7,x,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,7,7,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,7,x,x,x,x

DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,7,x,x,x

DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,7,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,14,14,14,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,6,6,6,12,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,6,6,6,6,12,x,x,x,x,x,x,x

'Data for KOHLEN character

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,9,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,0,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,0,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,8,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,8,0,8,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,8,0,8,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,8,0,8,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,8,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,0,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,0,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,0,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,4,4,4,4,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,9,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,0,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,0,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,8,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,8,8,0,8,0,8,8,x,x,x,x

DATA x,x,x,x,x,x,x,8,0,0,0,8,0,0,8,0,8,x,x,x

DATA x,x,x,x,x,x,x,x,8,8,8,0,0,0,8,8,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,0,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,0,0,0,0,8,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,0,0,8,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,8,0,8,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,8,0,8,8,8,8,8,4,x,x,x

DATA x,x,x,x,x,x,x,x,8,0,8,x,x,8,8,8,4,x,x,x

DATA x,x,x,x,x,x,4,4,4,4,x,x,x,x,x,x,4,x,x,x

'Data for LIGHTNING spell

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,14,14,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,14,x,x,14,14,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,14,x,14,x,x,14,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,14,x,14,x,x,x,14,x,x,14,14,14,14,x,x,x,x

DATA x,x,14,14,x,14,x,x,x,14,14,14,x,x,x,14,x,x,x,x

DATA x,x,14,14,x,x,14,x,14,x,x,x,x,14,14,14,x,x,x,x

DATA x,x,14,x,14,14,x,14,14,14,x,x,14,x,14,x,x,x,x,x

DATA x,x,14,x,x,x,14,x,x,14,x,14,x,x,14,x,x,x,x,x

DATA x,x,14,x,x,x,x,14,x,14,14,x,x,14,x,14,14,x,x,x

DATA x,x,14,14,x,14,14,14,x,14,x,14,14,x,x,x,x,14,x,x

DATA x,x,x,14,14,x,x,x,14,14,14,14,x,x,x,x,x,14,x,x

DATA x,x,x,14,x,x,x,14,x,14,x,x,14,14,x,x,14,x,x,x

DATA x,x,x,x,14,x,14,x,x,x,14,x,x,x,14,x,14,x,x,x

DATA x,x,x,x,14,14,x,14,x,x,14,x,14,14,x,14,14,x,x,x

DATA x,x,x,x,x,14,14,x,14,x,x,14,x,x,14,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,14,x,x,14,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,14,x,14,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,14,14,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,14,14,x,14,14,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,14,x,14,14,x,14,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,14,x,14,14,x,x,14,x,x,14,14,14,14,x,x,x,x

DATA x,x,14,14,x,14,14,x,x,14,14,14,x,14,14,14,x,x,x,x

DATA x,x,14,14,x,x,14,14,14,x,x,x,14,14,14,14,x,x,x,x

DATA x,x,14,14,14,14,x,14,14,14,x,14,14,x,14,x,x,x,x,x

DATA x,x,14,x,14,14,14,x,x,14,14,14,x,14,14,x,x,x,x,x

DATA x,x,14,x,x,x,14,14,x,14,14,x,14,14,14,14,14,x,x,x

DATA x,x,14,14,x,14,14,14,x,14,x,14,14,14,x,x,x,14,x,x

DATA x,x,x,14,14,x,x,14,14,14,14,14,14,14,x,x,x,14,x,x

DATA x,x,x,14,x,x,14,14,14,14,14,14,14,14,14,14,14,x,x,x

DATA x,x,x,x,14,14,14,14,x,14,14,14,14,14,14,14,14,x,x,x

DATA x,x,x,x,14,14,14,14,x,14,14,14,14,14,x,14,14,x,x,x

DATA x,x,x,x,x,14,14,x,14,x,14,14,x,x,14,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,14,x,14,14,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,14,x,14,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,14,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'Data for HEAL spell

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,10,x,10,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,10,x,10,2,10,2,10,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,10,2,10,2,10,2,10,2,10,x,x,x,x,x

DATA x,x,x,x,10,2,10,2,10,2,10,2,10,2,10,x,x,x,x,x

DATA x,x,x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,x,2,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,2,10,2,x,x

DATA x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,2,10,2,x,x

DATA x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,x,2,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,x,x,10,2,10,2,10,2,10,2,10,2,10,2,10,x,x,x

DATA x,x,x,x,10,2,10,2,10,2,10,2,10,2,10,x,x,x,x,x

DATA x,x,x,x,x,x,10,2,10,2,10,2,10,2,10,x,x,x,x,x

DATA x,x,x,x,x,x,10,x,10,2,10,2,10,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,10,x,10,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'Data for VAMPIRA enemy

DATA x,x,x,x,x,x,x,x,6,2,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,0,x,9,x,2,6,x,8,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,0,x,6,x,x,3,8,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,0,0,x,x,6,x,x,8,x,x,x,x,x,x,x

DATA x,x,x,x,5,x,x,6,x,x,6,x,8,8,x,x,x,x,x,x

DATA x,x,x,9,x,13,13,x,8,x,x,2,13,13,8,x,x,x,x,x

DATA x,x,x,x,0,13,13,x,8,x,x,x,13,13,8,x,x,x,x,x

DATA x,x,x,8,x,0,x,2,2,x,2,x,8,8,8,8,x,x,x,x

DATA x,x,x,9,8,0,x,x,x,2,x,6,8,8,8,8,x,x,x,x

DATA x,x,x,0,8,3,0,x,8,x,6,x,8,8,8,8,x,x,x,x

DATA x,x,x,0,x,8,x,x,8,1,3,x,8,8,8,8,x,x,x,x

DATA x,x,x,x,0,8,8,8,8,6,3,x,8,8,8,8,x,x,x,x

DATA x,x,x,x,x,x,3,7,x,6,x,x,8,8,8,8,x,x,x,x

DATA x,x,x,x,11,3,x,3,6,x,x,x,8,11,8,8,x,x,x,x

DATA x,x,x,x,11,11,11,11,11,11,11,11,11,11,8,x,x,x,x,x

DATA x,x,x,x,x,11,11,x,6,x,x,11,11,8,8,x,x,x,x,x

DATA x,x,x,x,3,0,11,11,11,11,11,11,8,8,x,x,x,x,x,x

DATA x,x,x,x,x,0,0,x,8,8,6,x,8,x,x,x,x,x,x,x

DATA x,x,x,x,3,0,x,x,8,8,2,8,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,3,x,6,x,8,x,x,x,x,x,x,x,x

'Data for VAMPIRE BAT enemy

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,13,13,x,x,x,x,x,x,x,x,x

DATA x,13,x,13,x,x,x,x,13,5,5,13,x,x,x,x,13,x,13,x

DATA x,13,13,5,13,x,13,x,9,5,9,13,x,13,x,13,5,13,13,x

DATA x,13,5,5,13,13,5,13,13,5,5,13,13,5,13,13,5,5,13,x

DATA x,13,5,5,5,5,5,13,13,5,5,13,13,5,5,5,5,5,13,x

DATA x,13,5,13,5,13,5,5,5,5,5,5,5,5,5,13,5,5,13,x

DATA x,13,5,5,5,13,5,13,5,5,13,5,5,13,5,13,5,5,13,x

DATA x,x,13,13,5,5,5,13,5,5,13,5,5,13,5,5,13,13,x,x

DATA x,x,x,x,13,5,5,5,5,5,5,5,5,5,5,13,x,x,x,x

DATA x,x,x,x,x,13,13,5,5,5,5,5,5,13,13,x,x,x,x,x

DATA x,x,x,x,x,x,x,13,13,13,13,13,13,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'Data for SHRUIKEN item

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,7,7,7,7,7,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,7,8,8,8,8,8,7,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,7,8,8,8,8,7,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,8,8,8,7,x,x,x,x,x,7,x,x

DATA x,x,x,x,x,x,x,x,7,8,8,7,x,x,x,x,7,8,7,x

DATA x,x,x,x,x,x,x,x,7,8,8,7,x,x,x,7,8,8,7,x

DATA x,x,x,x,x,x,x,x,7,8,8,8,7,7,7,8,8,8,7,x

DATA x,x,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,7,x

DATA x,7,8,8,8,8,8,8,8,7,7,8,8,8,8,8,8,8,7,x

DATA x,7,8,8,8,8,8,8,8,8,8,8,7,7,7,7,7,7,x,x

DATA x,7,8,8,8,7,7,7,8,8,8,7,x,x,x,x,x,x,x,x

DATA x,7,8,8,7,x,x,7,8,8,7,x,x,x,x,x,x,x,x,x

DATA x,7,8,7,x,x,x,7,8,8,7,x,x,x,x,x,x,x,x,x

DATA x,x,7,x,x,x,x,7,8,8,7,x,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,8,8,8,7,x,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,8,8,8,8,7,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,7,8,8,8,8,8,7,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,7,7,7,7,7,x,x,x,x,x,x,x

DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'Data for FIRE spell and various effects

DATA 4,4,4,x,x,4,4,x,x,4

DATA x,12,12,12,12,12,4,x,12,x

DATA x,x,4,12,12,12,12,4,12,x

DATA 4,4,12,12,14,14,12,12,12,4

DATA 4,12,12,14,14,14,14,14,12,4

DATA 4,12,14,14,15,15,14,12,12,x

DATA x,4,12,14,14,14,14,12,12,4

DATA x,4,12,12,12,14,14,12,12,4

DATA 4,4,4,x,12,12,12,12,12,4

DATA 4,4,x,x,x,4,4,x,4,4

'Data for villagers

DATA "Beware the king. He has not"

DATA "been himself lately.",""

DATA "Treaure chests are not","always good things. Beware"

DATA "creatures that lurk in them."

DATA "Buy a sword, a staff, and a","murasame as soon as you"

DATA "can. They'll help you."

DATA "The plate mail and ninja","suit are readily avail-"

DATA "able. Where's the Guru Cloak?"

DATA "This isn't much of a game,","but the engine can be"

DATA "used to make a VERY cool one."

DATA "This game engine was created"

DATA "by Thomas Lipschultz in","June 1995."

DATA "I'm worried about the king.","Queenie says he's been"

DATA "kidnapped, but I don't know..."

'Data for Queenie

DATA "QUEEN: Oh! This is horrible! The king"

DATA "has been kidnapped by vampires! Go into"

DATA "the cave behind me and rescue him!"

DATA "Please make haste! The kingdom depends"

DATA "on you! Good luck!"

DATA "KYTA: Don't worry, we'll get him back."

'Data for Kingie

DATA "KYTA: King! Are you all right?"

DATA "KING: Of course I am! I just wanted"

DATA "some time alone."

DATA "KYTA: But we were told you'd been"

DATA "kidnapped by vampires!"

DATA "KING: Oh yes, that..."

DATA "GLENLIN: Vampira!"

DATA "VAMPIRA: That's right! The king's"

DATA "body is OURS!"

'Data for inventory

DATA 10,10,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0

DATA "Shruiken","Ninja Star","Phaser","Spazer","Wide Beam"

DATA "Sword","Staff","Murasame","Dagger","Wand","Machete"

DATA "Chain Mail","Robes","Turtle Hide","Plate Mail"

DATA "Guru Cloak","Ninja Suit","Tent",9,12,10,13,11,14

DATA 6,9,12,15,7,10,13,16,8,11,14,17

'Data for character status

DATA 5467,0,107,95,3489,100,57,78,7886,0,99,97

'Data for weapon/armor power/price

DATA 182,109,203,107,57,99,95,78,97,137,255,151

DATA 1000,500,750,200,100,250,100,50,200,1000,15000,2000

'Data for magic

DATA "Cure","Heal","Fire","Ice","Lightning","Tremor","Drown"

DATA "Wall","Life","Quake","Phase","TidalWave"

DATA 1,1,1,1,1,1,1,1,1,0,0,0,5,8,7,7,7,10,10,6,15,20,40,40

DATA 10,11,12,0,6,0,6,1,1,0,2,0,3,0,5,0,4,0,7,0,8,0,5,1

DATA 0,1,4,1

'Data for enemies

DATA "EnergyOrb","Mage Bat","LifeDrainer","Vampire Bat"

DATA "Vampira",5,3,3,5,4,3,1,5,2,1

DATA 210,50,25,0,0,1,1,0,0,0,100,150,0

DATA 500,10,5,1,1,0,0,1,0,0,200,250,1

DATA 190,50,200,1,0,1,1,0,0,0,200,500,7

DATA 500,75,25,1,1,1,0,1,1,0,350,750,2

DATA 1000,50,100,1,1,1,1,1,1,1,750,1500,18

'Data for level-ups

DATA 500,1500,4000,10000

CityMap:

DATA "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxAxx"

DATA "x                           xI         x"

DATA "x x xxxxxxxxxxxxxxxxxxxxxxx xxx    xxx x"

DATA "x x x                       xW     xQx x"

DATA "x x x xxxxxxxxxxxx xxxxxxxxxxxxxxx     x"

DATA "x x x xx       b x x v    x      x     x"

DATA "x x x xx xxxxxxxxx xxxxx  x  7         x"

DATA "x x x xx                  x      xxxxxxx"

DATA "x x x  xxxxxxxxxxxxxxxxxxxx      x     x"

DATA "x x xx             x      x  xxxxx  x  x"

DATA "x x  xxxxxxxxxxxxx x  xxx x  x      x  x"

DATA "x xx             x x  x   xx x  xxxxx  x"

DATA "x  xxxxxxxxxxxxx x x  x      x  x      x"

DATA "x  x6x5 x 1 x 2x x x  xxxxxxxx  x  xxxxx"

DATA "x  x xx xx xxx x x x            x  x a x"

DATA "x              x x xxxxxxxxxxxxxx  x   x"

DATA "x          3   x x                 xx  x"

DATA "xxx  4       xxx xxxxxxxxxxxxxxxxxxxx  x"

DATA "xI            Wx                       x"

DATA "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

CaveMap:

DATA "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

DATA "X   XXXXXXXXXXXXdXXXXXXX        XX     X"

DATA "X X XXXX CC XXXX XXXXXXX XXXXXX XX XXX X"

DATA "X X XXX      XXX XXXXXXX XXXXXX XX XKX X"

DATA "X X XX        XX XXXXXXX XXXXXX XX     X"

DATA "X X                      XXXXXX        X"

DATA "X XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

DATA "X X                                   cX"

DATA "X X XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

DATA "X X XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

DATA "X X                                    X"

DATA "X XXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXX X"

DATA "X XXXXX                X XXXXXXXXXXVXX X"

DATA "X XXXXX  XXXXXXXX XXXX X XXXXXXXXXX XX X"

DATA "X     XX  XXXXXXX XXXX X XXXXXXXXXX XX X"

DATA "XXXXX XXX  XXXXXX XXXX X XXXXXXXXXX XX X"

DATA "X      XXX  XXXX   XXX X            XX X"

DATA "X XXXXXXXXX  XXX   XXX XXXXXXXXXXXXXXX X"

DATA "X            XXXX XXXX                 X"

DATA "XXXXXXXXXXXXXXXXXBXXXXXXXXXXXXXXXXXXXXXX"

'SP-Precision by Thomas Lipschultz: End of program.



REM $STATIC

SUB AreYouDead STATIC

FOR ga = 1 TO 3: IF curhp(ga) > 0 THEN EXIT SUB

NEXT: COLOR 15: LINE (0, 0)-(319, 31), 0, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "NOTICE: you are dead. The enemies"

PRINT "devour your body. Have a": PRINT "nice day!"

LOCATE 3, 40: PRINT CHR$(254): PCOPY 6, 0: SLEEP

dmb$ = INKEY$: RemoveGraphics: SCREEN 0: WIDTH 80: SYSTEM

END SUB



REM $DYNAMIC

SUB BeamAttack (bnum, et) STATIC

DIM ex(4), ey(4)

ex(1) = 35: ey(1) = 110: ex(2) = 110: ey(2) = 110

ex(3) = 35: ey(3) = 60: ex(4) = 110: ey(4) = 60

PCOPY 6, 3: LINE (225, 5)-(314, 25), 0, BF

LINE (225, 5)-(314, 25), 12, B: LOCATE 2, 30

COLOR 15: PRINT in$(bnum + 2): PCOPY 6, 0: delay 1: PCOPY 3, 0

PCOPY 3, 6: FOR yowsa = 1 TO 4: IF enemyat(et) = 0 THEN et = et + 1

IF et = 5 THEN et = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 60)-(299, 79), coverup: SCREEN 7, 0, 6, 0

PUT (280, 60), coverup, PSET: PUT (280, 60), Kytm2, AND

PUT (280, 60), Kyta2, XOR: PCOPY 6, 3: SELECT CASE bnum

CASE 1:

FOR xc = 315 TO ex(et) STEP -5: COLOR 12: PCOPY 3, 6

LINE (320, ey(et) + 10)-(xc, ey(et) + 10): COLOR 4

LINE (320, ey(et) + 11)-(xc, ey(et) + 11)

LINE (320, ey(et) + 9)-(xc, ey(et) + 9): PCOPY 6, 0

delay .05: NEXT

FOR xc = 315 TO ex(et) + 5 STEP -5: COLOR 12: PCOPY 3, 6

LINE (ex(et), ey(et) + 10)-(xc, ey(et) + 10): COLOR 4

LINE (ex(et), ey(et) + 11)-(xc, ey(et) + 11)

LINE (ex(et), ey(et) + 9)-(xc, ey(et) + 9)

PUT (ex(et), ey(et) + 5), Bangm, AND

PUT (ex(et), ey(et) + 5), Bang1, XOR: PCOPY 6, 0: delay .05

NEXT: PCOPY 3, 6: PCOPY 3, 0: DamageEnemy 0, 250, et

CASE 2:

ct = 0: FOR xc = 315 TO ex(et) STEP -5: COLOR 12: PCOPY 3, 6

IF xc / 3 = xc \ 3 THEN ct = ct + 1

LINE (320, ey(et) + 10)-(xc, ey(et) + 10): COLOR 4

LINE (320, ey(et) + 10 + ct)-(xc, ey(et) + 10 + ct)

LINE (320, ey(et) + 10 - ct)-(xc, ey(et) + 10 - ct): PCOPY 6, 0

delay .05: NEXT

FOR xc = 315 TO ex(et) + 5 STEP -5: COLOR 12: PCOPY 3, 6

IF xc / 3 = xc \ 3 THEN ct = ct - 1

LINE (ex(et), ey(et) + 10)-(xc, ey(et) + 10): COLOR 4

LINE (ex(et), ey(et) + 10 + ct)-(xc, ey(et) + 10 + ct)

LINE (ex(et), ey(et) + 10 - ct)-(xc, ey(et) + 10 - ct)

PUT (ex(et), ey(et) + 5 - ct), Bangm, AND

PUT (ex(et), ey(et) + 5 - ct), Bang1, XOR

PUT (ex(et), ey(et) + 5 + ct), Bangm, AND

PUT (ex(et), ey(et) + 5 + ct), Bang1, XOR

PUT (ex(et), ey(et) + 5), Bangm, AND

PUT (ex(et), ey(et) + 5), Bang1, XOR

PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 3, 0

DamageEnemy 0, 350, et: PCOPY 6, 3: delay 1: DamageChar 75, 1

CASE 3:

FOR xc = 315 TO ex(et) STEP -5: COLOR 14: PCOPY 3, 6

LINE (320, ey(et) + 10)-(xc, ey(et) + 10)

LINE (320, ey(et) + 9)-(xc, ey(et) + 9), 12

LINE (320, ey(et) + 11)-(xc, ey(et) + 11), 12

PCOPY 6, 0: delay .05: NEXT: SCREEN 7, 0, 0, 0

COLOR 14: FOR xc = 1 TO 10

LINE (319, ey(et) + 10 - xc)-(ex(et), ey(et) + 10 - xc)

LINE (319, ey(et) + 10 + xc)-(ex(et), ey(et) + 10 + xc)

delay .1: NEXT: delay .4

LINE (ex(et), ey(et))-(319, ey(et) + 21), 12, BF

delay .5: LINE (ex(et), ey(et))-(319, ey(et) + 21), 4, BF

delay .5: SCREEN 7, 0, 6, 0: PCOPY 3, 0: PCOPY 3, 6

DamageEnemy 0, 450, et

END SELECT

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies

ERASE ex, ey, coverup

END SUB



SUB BuyItem STATIC

StartofBuyingSub:

COLOR 15: LINE (0, 0)-(319, 199), 1, BF: LINE (0, 0)-(319, 199), 12, B

LINE (0, 31)-(319, 31), 12: LOCATE 2, 3: PRINT "OK, whaddaya want?"

REDIM itmno(5): itmno(1) = 6: itmno(2) = 7: itmno(3) = 8

itmno(4) = 15: itmno(5) = 17: FOR gab = 1 TO 5: COLOR 14

LOCATE gab + 9, 12: PRINT in$(itmno(gab)): COLOR 15

LOCATE gab + 9, 30: PRINT "GP"; power(itmno(gab), 2): NEXT

PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 9, 10: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 0 THEN mychc = 5

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 6 THEN mychc = 1

CASE CHR$(27): ii$ = CHR$(13): mychc = 6

END SELECT

LOOP UNTIL ii$ = CHR$(13)

IF mychc = 6 THEN ERASE itmno: EXIT SUB

IF curgold < power(itmno(mychc), 2) THEN

cannotrun = 1: COLOR , totalback: CheapSkate: EXIT SUB

END IF

LOCATE 2, 3: PRINT "You sure you want it? (Y/N)"

PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""

IF UCASE$(ii$) = "Y" THEN

curgold = curgold - power(itmno(mychc), 2)

inven(itmno(mychc)) = inven(itmno(mychc)) + 1

IF inven(itmno(mychc)) = 100 THEN inven(itmno(mychc)) = 99

LOCATE 2, 3: PRINT "Sold!                         "

PCOPY 2, 0: delay 1

ELSE

GOTO StartofBuyingSub

END IF

ERASE itmno

END SUB



REM $STATIC

SUB CampGround STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "You've stumbled upon a campground."

IF inven(18) = 0 THEN

PRINT "Unfortunately, you don't"

PRINT "have a tent.": LOCATE 3, 40

PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmbo$ = INKEY$

ELSE

PRINT "Would you like to stay for"

PRINT "the night?           (Y/N)": LOCATE 3, 40

PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

IF UCASE$(dmb$) = "Y" THEN

curgold = curgold + 50

inven(18) = inven(18) - 1: StayTheNight

END IF

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

COLOR , totalback

END IF

END SUB



REM $DYNAMIC

SUB CastSpell (spnum, etarg) STATIC

DIM ex(4), ey(4), lx(4), ly(4)

ex(1) = 35: ey(1) = 110: ex(2) = 110: ey(2) = 110: ex(3) = 35

ey(3) = 60: ex(4) = 110: ey(4) = 60: ly(1) = 16: lx(1) = 4: ly(2) = 16

lx(2) = 15: ly(3) = 9: lx(3) = 4: ly(4) = 9: lx(4) = 15

IF magdata(spnum, 2) = 0 AND magdata(spnum, 1) < 6 THEN

FOR yowsa = 1 TO 4

IF enemyat(etarg) = 0 THEN etarg = etarg + 1

IF etarg = 5 THEN etarg = 1

NEXT

END IF

curmp = curmp - mpused(spnum)

DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 85)-(299, 104), coverup: SCREEN 7, 0, 6, 0

PUT (280, 85), coverup, PSET

PUT (280, 85), Glenlim2, AND: PUT (280, 85), Glenlin2, XOR

PCOPY 6, 3: LINE (225, 5)-(314, 25), 0, BF

LINE (225, 5)-(314, 25), 12, B: LOCATE 2, 30

COLOR 15: PRINT mn$(spnum): PCOPY 6, 0: delay 1: PCOPY 3, 0

PCOPY 3, 6

IF curmp < 0 THEN NotEnoughMP: curmp = 0: GOTO NoSpellCast

SELECT CASE spnum

CASE 1:

ey(1) = 60: ey(2) = 85: ey(3) = 110

FOR xarg = ey(etarg) - 30 TO ey(etarg) + 10 STEP 2: PCOPY 3, 6

PUT (280, xarg), Healm, AND: PUT (280, xarg), Heal1, XOR

PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0

IF curhp(etarg) > 0 THEN DamageChar -1400, etarg

CASE 2:

ey(1) = 60: ey(2) = 85: ey(3) = 110

FOR xarg = -30 TO 10 STEP 2: PCOPY 3, 6

FOR erf = 1 TO 3: PUT (280, ey(erf) + xarg), Healm, AND

PUT (280, ey(erf) + xarg), Heal1, XOR: NEXT

PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0

FOR erf = 1 TO 3

IF curhp(erf) > 0 THEN

DamageChar -700, erf: IF erf < 3 THEN delay 1

END IF

NEXT

CASE 3: FireSpell ex(etarg), ey(etarg), etarg

CASE 4: IceSpell ex(etarg), ey(etarg), etarg

CASE 5: LightningSpell ex(etarg), ey(etarg), etarg

CASE 6: TremorSpell ex(etarg), ey(etarg), etarg

CASE 7: DrownSpell ex(etarg), ey(etarg), etarg

CASE 8:

IF curhp(etarg) > 0 THEN

walled(etarg) = 1: ey(1) = 60: ey(2) = 85: ey(3) = 110

FOR gjkl = 1 TO 15

LINE (270, ey(etarg) + gjkl)-(290, ey(etarg) + gjkl + 10), gjkl

NEXT: PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

END IF

CASE 9:

ey(1) = 60: ey(2) = 85: ey(3) = 110: FOR abag = 1 TO 20: PCOPY 3, 6

xc = INT(RND(1) * 15): yc = INT(RND(1) * 15)

PUT (280 + xc, ey(etarg) + yc), Healm, AND

PUT (280 + xc, ey(etarg) + yc), Heal1, XOR

PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0

IF curhp(etarg) = 0 THEN curhp(etarg) = 1000

CASE 10:

ct! = 75: Xpvr! = 0

DO: IF ct! < 0 THEN ct! = ABS(ct!) - 1

IF ct! > 0 THEN ct! = -ct!

Xpvr! = Xpvr! + ct!: WAIT &H3DA, 8: OUT &H3D4, 13

OUT &H3D5, Xpvr!: LOOP UNTIL ct! = 0

OUT &H3D4, 13: OUT &H3D5, 0

FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 100

IF enemyat(dgct) > 0 THEN

IF weak(enemyat(dgct)) = magdata(10, 1) THEN

dmgcnt = dmgcnt + INT(RND(1) * 100) + 100

END IF

IF strn(enemyat(dgct)) = magdata(10, 1) THEN dmgcnt = -dmgcnt

dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))

ehit(dgct) = ehit(dgct) - dmgcnt

IF ehit(dgct) > etype(enemyat(dgct), 1) THEN

ehit(dgct) = etype(enemyat(dgct), 1)

END IF

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)

IF dmgcnt < 0 THEN COLOR 10

PRINT ABS(dmgcnt)

END IF

NEXT: FOR dgct = 1 TO 4

IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct

NEXT

CASE 11:

FOR bcad = 5 TO 25 STEP 5: PCOPY 3, 6: Mosaic bcad: PCOPY 6, 0

delay .1: NEXT: FOR bcad = 20 TO 5 STEP -5: PCOPY 3, 6

Mosaic bcad: PCOPY 6, 0: delay .1: NEXT: delay .25

PCOPY 3, 6: PCOPY 3, 0

FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 225

IF enemyat(dgct) > 0 THEN

dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))

ehit(dgct) = ehit(dgct) - dmgcnt

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)

PRINT dmgcnt

END IF

NEXT: FOR dgct = 1 TO 4

IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct

NEXT

CASE 12:

SCREEN 7, 0, 0, 0: FOR wasser = 0 TO 200 STEP 4

LINE (0, wasser)-(319, wasser), 3

LINE (0, wasser + 1)-(319, wasser + 1), 1

LINE (0, wasser + 2)-(319, wasser + 2), 9

LINE (0, wasser + 3)-(319, wasser + 3), 11

delay .05: NEXT: FOR water = 4 TO 199 STEP 8

SCREEN 7, 0, 6, 0: PCOPY 3, 6: FOR wasser = water TO 200 STEP 4

LINE (0, wasser)-(319, wasser), 3

LINE (0, wasser + 1)-(319, wasser + 1), 1

LINE (0, wasser + 2)-(319, wasser + 2), 9

LINE (0, wasser + 3)-(319, wasser + 3), 11

NEXT: PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 3, 0

FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 300

IF enemyat(dgct) > 0 THEN

IF weak(enemyat(dgct)) = magdata(12, 1) THEN

dmgcnt = dmgcnt + INT(RND(1) * 100) + 200

END IF

IF strn(enemyat(dgct)) = magdata(12, 1) THEN dmgcnt = -dmgcnt

dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))

ehit(dgct) = ehit(dgct) - dmgcnt

IF ehit(dgct) > etype(enemyat(dgct), 1) THEN

ehit(dgct) = etype(enemyat(dgct), 1)

END IF

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)

IF dmgcnt < 0 THEN COLOR 10

PRINT ABS(dmgcnt)

END IF

NEXT: FOR dgct = 1 TO 4

IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct

NEXT

END SELECT

NoSpellCast:

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies

ERASE ex, ey, lx, ly, coverup

END SUB



REM $STATIC

SUB CharAttack (sabro) STATIC

wiley = 0: FOR xardia = 1 TO 4: wiley = wiley + enemyat(xardia): NEXT

IF wiley = 0 THEN EXIT SUB

SELECT CASE sabro

CASE 1:

IF chosen(1, 1) = 1 THEN KytaAttack chosen(1, 3)

IF chosen(1, 1) = 2 THEN BeamAttack chosen(1, 2), chosen(1, 3)

IF chosen(1, 1) = 3 THEN RunAway

CASE 2:

IF chosen(2, 1) = 1 THEN GlenlinAttack chosen(2, 3)

IF chosen(2, 1) = 2 THEN CastSpell chosen(2, 2), chosen(2, 3)

IF chosen(2, 1) = 3 THEN RunAway

CASE 3:

IF chosen(3, 1) = 1 THEN KohlenAttack chosen(3, 3)

IF chosen(3, 1) = 2 THEN JumpAttack chosen(3, 3)

IF chosen(3, 1) = 3 THEN TossStar chosen(3, 2), chosen(3, 3)

IF chosen(3, 1) = 4 THEN RunAway

END SELECT

END SUB



SUB CharMenu (sabro) STATIC

DIM storechc$(4)

IF curhp(sabro) > 0 THEN

LINE (250, 150)-(300, 185), 0, BF: LINE (250, 150)-(300, 185), 12, B

ELSE

EXIT SUB

END IF

COLOR 15: SELECT CASE sabro

CASE 1:

LINE (280, 60)-(300, 80), 12, B

LOCATE 20, 33: PRINT "FIGHT": storechc$(1) = "FIGHT"

LOCATE 21, 33: PRINT "BEAM": storechc$(2) = "BEAM"

LOCATE 22, 33: PRINT "RUN": storechc$(3) = "RUN"

CASE 2:

LINE (280, 85)-(300, 105), 12, B

LOCATE 20, 33: PRINT "FIGHT": storechc$(1) = "FIGHT"

LOCATE 21, 33: PRINT "MAGIC": storechc$(2) = "MAGIC"

LOCATE 22, 33: PRINT "RUN": storechc$(3) = "RUN"

CASE 3:

LINE (280, 110)-(300, 130), 12, B

LOCATE 20, 33: PRINT "FIGHT": storechc$(1) = "FIGHT"

LOCATE 21, 33: PRINT "JUMP": storechc$(2) = "JUMP"

LOCATE 22, 33: PRINT "THROW": storechc$(3) = "THROW"

LOCATE 23, 33: PRINT "RUN": storechc$(4) = "RUN"

END SELECT

PCOPY 6, 3: LOCATE 20, 33: COLOR 13: PRINT "FIGHT"

mychoice = 1: DO: v$ = INKEY$: SELECT CASE v$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

SELECT CASE sabro

CASE 1, 2:

IF mychoice = 1 THEN mychoice = 3 ELSE mychoice = mychoice - 1

PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)

CASE 3:

IF mychoice = 1 THEN mychoice = 4 ELSE mychoice = mychoice - 1

PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)

END SELECT

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

SELECT CASE sabro

CASE 1, 2:

IF mychoice = 3 THEN mychoice = 1 ELSE mychoice = mychoice + 1

PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)

CASE 3:

IF mychoice = 4 THEN mychoice = 1 ELSE mychoice = mychoice + 1

PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)

END SELECT

CASE CHR$(13): chosen(sabro, 1) = mychoice: GOTO nextmenuifany

CASE CHR$(27):

chosen(sabro, 1) = 0: mychoice = 0: GOTO nextmenuifany

END SELECT

PCOPY 6, 0: LOOP

nextmenuifany:

saab = sabro: ERASE storechc$

IF mychoice = 1 THEN TargetEnemy1 sabro

IF sabro = 1 AND mychoice = 2 THEN

ChooseBeam

IF chosen(1, 2) > 0 THEN TargetEnemy1 sabro

END IF

IF sabro = 2 AND mychoice = 2 THEN ChooseMagic: TargetEnemy2 saab

IF sabro = 3 AND mychoice = 2 THEN TargetEnemy1 sabro

IF sabro = 3 AND mychoice = 3 THEN

ChooseStar

IF chosen(3, 2) > 0 THEN TargetEnemy1 sabro

END IF

PCOPY 4, 6: PCOPY 6, 0: delay .5

END SUB



SUB CheapSkate STATIC

SCREEN 7, 0, 2, 0

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "Hey, cheapskate! You don't have"

PRINT "enough GP! Do you think I'm just"

PRINT "gonna give it to you FOR FREE?!"

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

END SUB



SUB ChooseBeam STATIC

LINE (235, 150)-(314, 177), 0, BF: LINE (235, 150)-(314, 177), 12, B

COLOR 15: FOR gha = 3 TO 5

LOCATE 19 + gha - 2, 31: IF inven(gha) > 0 THEN PRINT in$(gha)

NEXT: PCOPY 6, 3: LOCATE 20, 31: COLOR 12: PRINT in$(3): mychoice = 1

DO: v$ = INKEY$: IF inven(5) > 0 THEN ja = 3 ELSE ja = 2

SELECT CASE v$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1

PCOPY 3, 6: LOCATE 19 + mychoice, 31: PRINT in$(mychoice + 2)

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1

PCOPY 3, 6: LOCATE 19 + mychoice, 31: PRINT in$(mychoice + 2)

CASE CHR$(13): chosen(1, 2) = mychoice: EXIT SUB

CASE CHR$(27):

chosen(1, 2) = 0: mychoice = 0: GOTO trytochooseagain1

END SELECT

PCOPY 6, 0: LOOP

trytochooseagain1:

PCOPY 4, 6: PCOPY 6, 0: erlvl = 1

END SUB



SUB ChooseMagic STATIC

LINE (225, 78)-(314, 177), 0, BF: LINE (225, 78)-(314, 177), 12, B

COLOR 15: FOR gha = 1 TO 12

LOCATE 10 + gha, 30: IF spellsknown(gha) > 0 THEN PRINT mn$(gha)

NEXT: PCOPY 6, 3: LOCATE 11, 30: COLOR 12: PRINT mn$(1): mychoice = 1

ja = 9: FOR uh = 10 TO 12: IF spellsknown(uh) > 0 THEN ja = uh

NEXT: DO: v$ = INKEY$

SELECT CASE v$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1

PCOPY 3, 6: LOCATE 10 + mychoice, 30: PRINT mn$(mychoice)

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1

PCOPY 3, 6: LOCATE 10 + mychoice, 30: PRINT mn$(mychoice)

CASE CHR$(13): chosen(2, 2) = mychoice: EXIT SUB

CASE CHR$(27):

chosen(2, 2) = 0: mychoice = 0: GOTO trytochooseagain3

END SELECT

PCOPY 6, 0: LOOP

trytochooseagain3:

PCOPY 4, 6: PCOPY 6, 0: erlvl = 1

END SUB



SUB ChooseStar STATIC

LINE (225, 150)-(314, 174), 0, BF: LINE (225, 150)-(314, 174), 12, B

COLOR 15: FOR gha = 1 TO 2

LOCATE 19 + gha, 30: IF inven(gha) > 0 THEN PRINT in$(gha)

NEXT: PCOPY 6, 3: LOCATE 20, 30: COLOR 12: PRINT in$(1): mychoice = 1

DO: v$ = INKEY$: IF inven(1) > 0 THEN ja1 = 1 ELSE ja1 = 2

IF inven(2) > 0 THEN ja2 = 2 ELSE ja2 = 1

IF inven(1) = 0 AND inven(2) > 0 THEN

mychoice = 2: LOCATE 21, 30: COLOR 12: PRINT in$(2)

LOCATE 20, 30: PRINT "        "

END IF

IF inven(1) = 0 AND inven(2) = 0 THEN GOTO trytochooseagain2

SELECT CASE v$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

IF mychoice = ja1 THEN mychoice = ja2 ELSE mychoice = mychoice - 1

PCOPY 3, 6: LOCATE 19 + mychoice, 30: PRINT in$(mychoice)

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

IF mychoice = ja2 THEN mychoice = ja1 ELSE mychoice = mychoice + 1

PCOPY 3, 6: LOCATE 19 + mychoice, 30: PRINT in$(mychoice)

CASE CHR$(13): chosen(3, 2) = mychoice: EXIT SUB

CASE CHR$(27): GOTO trytochooseagain2

END SELECT

PCOPY 6, 0: LOOP

trytochooseagain2:

chosen(3, 2) = 0: mychoice = 0: PCOPY 4, 6: PCOPY 6, 0: erlvl = 1

END SUB



REM $DYNAMIC

SUB DamageChar (tdmg, et) STATIC

DIM ly(3): ly(1) = 9: ly(2) = 12: ly(3) = 16: PCOPY 3, 6: PCOPY 3, 0

IF tdmg <> 0 THEN dmgcnt = INT(RND(1) * 50) + tdmg ELSE dmgcnt = 0

IF dmgcnt <> 0 THEN dmgcnt = dmgcnt - INT(.25 * charstat(et, 4))

curhp(et) = curhp(et) - dmgcnt

IF curhp(et) > charstat(et, 1) THEN curhp(et) = charstat(et, 1)

SCREEN 7, 0, 0, 0: LOCATE ly(et), 34

IF dmgcnt < 0 THEN COLOR 10 ELSE COLOR 12

IF dmgcnt = 0 THEN PRINT "Miss!" ELSE PRINT ABS(dmgcnt)

IF curhp(et) < 1 THEN curhp(et) = 0: KillChar et

ERASE ly

END SUB



SUB DamageEnemy (elm, tdmg, etarg) STATIC

DIM lx(4), ly(4): ly(1) = 16: lx(1) = 4: ly(2) = 16

lx(2) = 15: ly(3) = 9: lx(3) = 4: ly(4) = 9: lx(4) = 15

PCOPY 3, 6: PCOPY 3, 0: dmgcnt = INT(RND(1) * 50) + tdmg

IF weak(enemyat(etarg)) = magdata(elm, 1) THEN dmgcnt = dmgcnt * 3

IF strn(enemyat(etarg)) = magdata(elm, 1) THEN dmgcnt = -dmgcnt

dmgcnt = dmgcnt - INT(.25 * etype(enemyat(etarg), 3))

ehit(etarg) = ehit(etarg) - dmgcnt

IF ehit(etarg) > etype(enemyat(etarg), 1) THEN

ehit(etarg) = etype(enemyat(etarg), 1)

END IF

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(etarg), lx(etarg)

IF dmgcnt < 0 THEN COLOR 10

PRINT ABS(dmgcnt): IF ehit(etarg) < 1 THEN KillEnemy etarg

ERASE lx, ly

END SUB



REM $STATIC

SUB delay (deltime!) STATIC

dtx! = TIMER

WHILE TIMER < dtx! + deltime!: WEND

END SUB



SUB DrawBattleCave STATIC

SCREEN 7, 0, 7, 0: LINE (0, 0)-(319, 50), 6, BF

LINE (0, 51)-(319, 199), 6, BF: COLOR , 0

cntr = 1: FOR lookreal = 50 TO 199: cntr = cntr + 1

LINE (0, lookreal + 1)-(319, lookreal + cntr), 14, BF

lookreal = lookreal + cntr: NEXT

END SUB



SUB DrawBattleField STATIC

SCREEN 7, 0, 7, 0: COLOR 11, 0: LINE (0, 0)-(319, 50), , BF

LINE (0, 51)-(319, 199), 2, BF

cntr = 1: FOR lookreal = 50 TO 199: cntr = cntr + 1

LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF

lookreal = lookreal + cntr: NEXT

CIRCLE (160, 50), 25, 14, , 3.15: LINE (135, 50)-(185, 50), 14

PAINT (160, 48), 14: cntr = 0: COLOR 14: FOR lookreal = 51 TO 76

cntr = cntr + 1

LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)

lookreal = lookreal + cntr: NEXT

END SUB



SUB DrawGraphic (xcoor, x2010) STATIC

SCREEN 7, 0, 5, 0

IF x2010 THEN endcor = 19 ELSE endcor = 9

FOR yc = 0 TO endcor

FOR xc = xcoor TO xcoor + endcor

READ bitpixel$

IF bitpixel$ = "x" THEN

PSET (xc, yc), 0: PSET (xc, yc + endcor + 1), 15

ELSE

PSET (xc, yc), VAL(bitpixel$)

PSET (xc, yc + endcor + 1), 0

END IF

NEXT: NEXT

SCREEN 7, 0, 0, 0

END SUB



SUB DrawMap (backcolor) STATIC

SCREEN 7, 0, 5, 0: CLS : totalback = backcolor

FOR getmap = 1 TO 20: READ curmap$(getmap): NEXT

COLOR , backcolor: FOR drmap = 1 TO 20

FOR maploc = 1 TO 40: z$ = MID$(curmap$(drmap), maploc, 1)

SELECT CASE z$

CASE "x": COLOR 15: PRINT CHR$(219);

CASE "X": COLOR 14: PRINT CHR$(176);

CASE "C": COLOR 11: PRINT CHR$(254);

CASE "v", "V", "a", "b", "c", "d": COLOR 13: PRINT CHR$(235);

CASE "I", "W": COLOR 9: PRINT CHR$(2);

CASE "Q", "K": COLOR 14: PRINT CHR$(2);

CASE "1" TO "7": COLOR 15: PRINT CHR$(1);

CASE "A", "B": COLOR 8: PRINT CHR$(178);

CASE " ": PRINT " ";

END SELECT

NEXT: PRINT : NEXT

END SUB



SUB DrownSpell (ex, ey, et) STATIC

FOR bagha = 1 TO 20: PCOPY 3, 6: xc4me = INT(RND(1) * 15) + ex

yc4me = INT(RND(1) * 15) + ey: FOR ecirc = 1 TO 4

IF ecirc = 1 THEN clrc = 1

IF ecirc = 2 THEN clrc = 3

IF ecirc = 3 THEN clrc = 9

IF ecirc = 4 THEN clrc = 11

CIRCLE (xc4me, yc4me), ecirc, clrc: PCOPY 6, 0: delay .1: NEXT: NEXT

IF ex = 280 AND walled(et) = 1 THEN ReflectSpell 7, et: EXIT SUB

IF ex = 280 THEN DamageChar 600, et ELSE DamageEnemy 7, 175, et

END SUB



SUB EmptyChest STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1: PRINT "** EMPTY **"

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

END SUB



REM $DYNAMIC

SUB EnemyAttack (enum) STATIC

DIM ey(3): ey(1) = 65: ey(2) = 90: ey(3) = 115: PCOPY 6, 3

DO: rtarg = INT(RND(1) * 3) + 1: IF rtarg = 4 THEN rtarg = 3

LOOP UNTIL curhp(rtarg) > 0

PUT (280, ey(rtarg)), Bangm, AND: PUT (280, ey(rtarg)), Bang1, XOR

PCOPY 6, 0: PCOPY 3, 6: delay .25

PUT (290, ey(rtarg)), Bangm, AND: PUT (290, ey(rtarg)), Bang1, XOR

PCOPY 6, 0: PCOPY 3, 6: delay .25: PCOPY 3, 0

dmgrate = etype(enum, 2) * 8

IF chosen(rtarg, 1) = 0 THEN dmgrate = INT(.5 * dmgrate)

IF INT(RND(1) * 100) < 5 THEN dmgrate = 0

DamageChar dmgrate, rtarg: SCREEN 7, 0, 6, 0

PCOPY 7, 6: delay 1: PlaceEnemies: ERASE ey

END SUB



REM $STATIC

SUB EnemyGo (sabro) STATIC

IF enemyat(sabro) > 0 THEN

DO: FOR agha = 3 TO 10: echose = 0: chthis = INT(RND(1) * 100)

IF chthis < 10 THEN echose = agha: GOTO endenemygoloop

NEXT

endenemygoloop:

IF echose > 3 THEN

IF etype(enemyat(sabro), echose) = 0 THEN echose = 0

END IF

LOOP UNTIL echose > 0

SELECT CASE echose

CASE 3: EnemyAttack enemyat(sabro)

CASE ELSE: EnemySpell echose

END SELECT

END IF

END SUB



REM $DYNAMIC

SUB EnemySpell (spnum) STATIC

DIM ey(4): ey(1) = 60: ey(2) = 85: ey(3) = 110

DO: rtarg = INT(RND(1) * 3) + 1: IF rtarg = 4 THEN rtarg = 3

LOOP UNTIL curhp(rtarg) > 0

PCOPY 6, 3: LINE (5, 5)-(95, 25), 0, BF

LINE (5, 5)-(95, 25), 12, B: LOCATE 2, 2: COLOR 15

SELECT CASE spnum

CASE 4:

PRINT "Fire": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

FireSpell 280, ey(rtarg), rtarg

CASE 5:

PRINT "Ice": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

IceSpell 280, ey(rtarg), rtarg

CASE 6:

PRINT "Lightning": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

LightningSpell 280, ey(rtarg), rtarg

CASE 7:

disflag = 0: FOR gah = 1 TO 3

IF walled(gah) = 1 THEN disflag = 1: rtarg = gah

NEXT

IF disflag = 0 THEN

PRINT "Rage": EnemyAttack 4: GOTO ThatsitImoutta

END IF

PRINT "Penetrate": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

FOR wk = 270 TO 240 STEP -10: PCOPY 3, 6: FOR gjkl = 1 TO 15

LINE (wk, ey(rtarg) + gjkl)-(wk + 20, ey(rtarg) + gjkl + 10), gjkl

NEXT: PCOPY 6, 0: delay .25: NEXT: PCOPY 3, 0: PCOPY 3, 6

walled(rtarg) = 0

CASE 8:

PRINT "Drown": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

DrownSpell 280, ey(rtarg), rtarg

CASE 9:

PRINT "Tremor": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

TremorSpell 280, ey(rtarg), rtarg

CASE 10:

DIM mx(4), my(4): mx(1) = 35: my(1) = 110: mx(2) = 110

my(2) = 110: mx(3) = 35: my(3) = 60: mx(4) = 110: my(4) = 60

PRINT "Heal": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

FOR xarg = -30 TO 10 STEP 2: PCOPY 3, 6

FOR erf = 1 TO 4

IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Healm, AND

IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Heal1, XOR

NEXT: PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0

FOR erf = 1 TO 4

IF enemyat(erf) > 0 THEN

DamageEnemy 0, -700, erf: IF erf < 4 THEN delay 1

END IF

NEXT: ERASE mx, my

END SELECT

ThatsitImoutta:

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies: ERASE ey

END SUB



REM $STATIC

SUB EnsueBattle STATIC

IF mapnumber = 1 THEN DrawBattleField ELSE DrawBattleCave

erlvl = 0: totalexp = 0: totalgold = 0

FOR gh = 1 TO 4: gitm(gh) = 0: ehit(gh) = 0

IF enemyat(gh) > 0 THEN

ehit(gh) = etype(enemyat(gh), 1)

totalexp = totalexp + etype(enemyat(gh), 11)

totalgold = totalgold + etype(enemyat(gh), 12)

gitm(gh) = etype(enemyat(gh), 13)

END IF

NEXT: SCREEN 7, 0, 6, 0: PCOPY 7, 6: PlaceEnemies: DO: PCOPY 6, 4

FOR sabro = 1 TO 3: CharMenu sabro

IF erlvl = 1 THEN sabro = sabro - 1: erlvl = 0

NEXT: FOR xab = 300 TO 0 STEP -1: FOR sabro = 1 TO 3

IF charstat(sabro, 3) = xab THEN CharAttack sabro: AreYouDead

NEXT: FOR sabro = 1 TO 4

IF enemyat(sabro) > 0 THEN

ghaj = enemyat(sabro)

IF etype(ghaj, 2) = xab THEN EnemyGo sabro: AreYouDead

END IF

NEXT: NEXT: kjkl = 0: FOR jhaj = 1 TO 4

kjkl = kjkl + enemyat(jhaj): NEXT: IF kjkl = 0 THEN GOTO endbattle

PCOPY 6, 0: LOOP

endbattle:

PCOPY 6, 0: WinBattle

COLOR , totalback: SCREEN 7, 0, 2, 0: cannotrun = 0

FOR abab = 1 TO 4: enemyat(abab) = 0: NEXT

FOR abab = 1 TO 3: walled(abab) = 0: NEXT

END SUB



SUB Epilogue STATIC

COLOR 14, 0: LOCATE 15, 20: PRINT CHR$(2)

LOCATE 20, 15: PRINT CHR$(1); "    "; CHR$(1); "    "; CHR$(1)

COLOR 15: LOCATE 1, 1: PRINT "KING: Thank you for saving my body"

PRINT "from those awful Vampiras. You will"

PRINT "be well rewarded for this! You will"

PRINT "all be knighted, and held in the"

PRINT "highest of honor in my kingdom!"

delay 10: PRINT "I knight thee Sir Kyta Simit!"

COLOR 7: LOCATE 20, 15: PRINT CHR$(2): delay 5: COLOR 15

LOCATE 7, 1: PRINT "I knight thee Sir Glenlin Mugos!"

LOCATE 20, 20: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5

LOCATE 8, 1: PRINT "I knight thee Sir Kohlen Elder!"

LOCATE 20, 25: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5

CLS : PRINT "And so ends the RPG engine demo game..."

delay 3: PRINT "But YOU can continue the story...": delay 5

END SUB



SUB EquipItems STATIC

CLS : LINE (0, 0)-(319, 199), 1, BF

LINE (0, 0)-(319, 199), 12, B

LOCATE 2, 3: COLOR 15: PRINT "Equip who?"

COLOR 14: LOCATE 15, 17: PRINT "Kyta"

LOCATE 16, 17: PRINT "Glenlin"

LOCATE 17, 17: PRINT "Kohlen"

LOCATE 18, 17: PRINT "EXIT"

PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 14, 15: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 0 THEN mychc = 4

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 5 THEN mychc = 1

CASE CHR$(27): ii$ = CHR$(13): mychc = 4

END SELECT

LOOP UNTIL ii$ = CHR$(13)

IF mychc = 4 THEN EXIT SUB

mypers = mychc

OnceAgain:

mychc = mypers

CLS : LINE (0, 0)-(319, 199), 1, BF

LINE (0, 0)-(319, 41), 12, B

COLOR 15: LOCATE 2, 3

PRINT "HAND - ": LOCATE 3, 3: PRINT "BODY - "

LOCATE 7, 3: PRINT "Please choose a weapon:"

inven(equip(mychc, 1)) = inven(equip(mychc, 1)) + 1

inven(equip(mychc, 2)) = inven(equip(mychc, 2)) + 1

equip(mychc, 1) = 0: equip(mychc, 2) = 0

COLOR 14: FOR ha = 1 TO 2: LOCATE ha + 15, 10

IF inven(canequip(mychc, ha)) > 0 THEN

PRINT in$(canequip(mychc, ha))

LOCATE ha + 15, 28

goby$ = LTRIM$(STR$(power(canequip(mychc, ha), 1)))

IF LEN(goby$) = 2 THEN goby$ = "0" + goby$

PRINT goby$

ELSE

PRINT "<Nothing>"

END IF

NEXT: LOCATE 18, 10: PRINT "<Nothing>"

mypers = mychc

PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 0 THEN mychc = 3

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 4 THEN mychc = 1

END SELECT

LOOP UNTIL ii$ = CHR$(13): LOCATE 2, 8: COLOR 14

IF mychc < 3 AND inven(canequip(mypers, mychc)) > 0 THEN

mc = mychc

inven(canequip(mypers, mc)) = inven(canequip(mypers, mc)) - 1

equip(mypers, 1) = canequip(mypers, mychc)

charstat(mypers, 3) = power(canequip(mypers, mychc), 1)

PRINT in$(canequip(mypers, mychc))

ELSE

equip(mypers, 1) = 0: charstat(mypers, 3) = 0

PRINT "<Nothing>"

END IF

LINE (0, 42)-(319, 199), 1, BF: COLOR 15

LOCATE 7, 3: PRINT "Please choose an armor:"

COLOR 14: FOR ha = 3 TO 4: LOCATE ha + 13, 10

IF inven(canequip(mypers, ha)) > 0 THEN

PRINT in$(canequip(mypers, ha))

LOCATE ha + 13, 28

goby$ = LTRIM$(STR$(power(canequip(mypers, ha), 1)))

IF LEN(goby$) = 2 THEN goby$ = "0" + goby$

PRINT goby$

ELSE

PRINT "<Nothing>"

END IF

NEXT: LOCATE 18, 10: PRINT "<Nothing>"

PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 0 THEN mychc = 3

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 4 THEN mychc = 1

END SELECT

LOOP UNTIL ii$ = CHR$(13): LOCATE 3, 8: COLOR 14

IF mychc < 3 THEN

IF inven(canequip(mypers, mychc + 2)) > 0 THEN

mc = mychc + 2

inven(canequip(mypers, mc)) = inven(canequip(mypers, mc)) - 1

equip(mypers, 2) = canequip(mypers, mc)

charstat(mypers, 4) = power(canequip(mypers, mc), 1)

PRINT in$(canequip(mypers, mc))

ELSE

equip(mypers, 2) = 0: charstat(mypers, 4) = 0

PRINT "<Nothing>"

END IF

ELSE

equip(mypers, 2) = 0: charstat(mypers, 4) = 0

PRINT "<Nothing>"

END IF

LINE (0, 42)-(319, 199), 1, BF

LOCATE 16, 3: PRINT "Is this OK? (Y/N)": PCOPY 2, 0

DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""

IF UCASE$(ii$) = "Y" THEN EXIT SUB ELSE GOTO OnceAgain

END SUB



SUB FireSpell (ex, ey, et) STATIC

FOR bagha = 1 TO 20: PCOPY 3, 6: xc4me = INT(RND(1) * 15) + ex

yc4me = INT(RND(1) * 15) + ey: PUT (xc4me, yc4me), Bangm, AND

PUT (xc4me, yc4me), Bang1, XOR: PCOPY 6, 0: delay .1: NEXT

IF ex = 280 AND walled(et) = 1 THEN ReflectSpell 3, et: EXIT SUB

IF ex = 280 THEN DamageChar 400, et ELSE DamageEnemy 3, 150, et

END SUB



SUB GetGraphics STATIC

SCREEN 7, 0, 5, 0

GET (0, 0)-(19, 19), Kyta1: GET (0, 20)-(19, 39), Kytam

GET (20, 0)-(39, 19), Kyta2: GET (20, 20)-(39, 39), Kytm2

GET (40, 0)-(59, 19), Glenlin1: GET (40, 20)-(59, 39), Glenlinm

GET (60, 0)-(79, 19), Glenlin2: GET (60, 20)-(79, 39), Glenlim2

GET (80, 0)-(99, 19), Kohlen1: GET (80, 20)-(99, 39), Kohlenm

GET (100, 0)-(119, 19), Kohlen2: GET (100, 20)-(119, 39), Kohlem2

GET (120, 0)-(139, 19), Lit1: GET (120, 20)-(139, 39), Litm

GET (140, 0)-(159, 19), Lit2: GET (140, 20)-(159, 39), Lim2

GET (160, 0)-(179, 19), Heal1: GET (160, 20)-(179, 39), Healm

GET (180, 0)-(199, 19), Vampira1: GET (180, 20)-(199, 39), Vampiram

GET (200, 0)-(219, 19), Bat1: GET (200, 20)-(219, 39), Batm

GET (220, 0)-(239, 19), Shruik1: GET (220, 20)-(239, 39), Shruikm

GET (240, 0)-(249, 9), Bang1: GET (240, 10)-(249, 19), Bangm

END SUB



REM $DYNAMIC

SUB GlenlinAttack (etarg) STATIC

FOR yowsa = 1 TO 4

IF enemyat(etarg) = 0 THEN etarg = etarg + 1

IF etarg = 5 THEN etarg = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 85)-(299, 104), coverup: SCREEN 7, 0, 6, 0

PUT (280, 85), coverup, PSET

PUT (280, 85), Glenlim2, AND: PUT (280, 85), Glenlin2, XOR

PCOPY 6, 3: IF etarg = 1 THEN ex = 45: ey = 120: ly = 16: lx = 4

IF etarg = 2 THEN ex = 120: ey = 120: ly = 16: lx = 15

IF etarg = 3 THEN ex = 45: ey = 70: ly = 9: lx = 4

IF etarg = 4 THEN ex = 120: ey = 70: ly = 9: lx = 15

FOR xanth = 20 TO 1 STEP -1: PCOPY 3, 6

CIRCLE (ex, ey), xanth, 13: CIRCLE (ex, ey), xanth + 1, 12

PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0

PUT (280, 85), coverup, PSET

PUT (280, 85), Glenlinm, AND: PUT (280, 85), Glenlin1, XOR

ERASE coverup: pdamage = INT(RND(1) * 50) + charstat(2, 3) - 50

pdamage = pdamage - INT(.75 * etype(enemyat(etarg), 3))

pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx

IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage

SCREEN 7, 0, 6, 0: ehit(etarg) = ehit(etarg) - pdamage

IF ehit(etarg) < 1 THEN KillEnemy etarg

PCOPY 7, 6: delay 1: PlaceEnemies

END SUB



REM $STATIC

SUB IceSpell (ex, ey, et) STATIC

COLOR 15: FOR g2 = 1 TO 10: PCOPY 3, 6

LINE (ex, ey)-(ex + g2, ey + g2)

LINE (ex, ey + 20)-(ex + g2, ey + 20 - g2)

LINE (ex + 20, ey + 20)-(ex + 20 - g2, ey + 20 - g2)

LINE (ex + 20, ey)-(ex + 20 - g2, ey + g2)

PCOPY 6, 0: delay .05: NEXT: df = 0: FOR g2 = 1 TO 5: PCOPY 3, 6

LINE (ex, ey)-(ex + 10, ey + 10 - g2)

LINE (ex, ey)-(ex + 10 - g2, ey + 10)

LINE (ex + 20, ey)-(ex + 10, ey + 10 - g2)

LINE (ex + 20, ey)-(ex + 10 + g2, ey + 10)

LINE (ex, ey + 20)-(ex + 10 - g2, ey + 10)

LINE (ex, ey + 20)-(ex + 10, ey + 10 + g2)

LINE (ex + 20, ey + 20)-(ex + 10 + g2, ey + 10)

LINE (ex + 20, ey + 20)-(ex + 10, ey + 10 + g2)

IF g2 = 5 THEN df = 1

IF df = 1 THEN g2 = g2 - 2

IF g2 = -1 THEN g2 = 6

PCOPY 6, 0: delay .05: NEXT: FOR B = 9 TO 1 STEP -1: PCOPY 3, 6

LINE (ex + 10 - B, ey + 10 - B)-(ex + 10 + B, ey + 10 + B)

LINE (ex + 10 + B, ey + 10 - B)-(ex + 10 - B, ey + 10 + B)

PCOPY 6, 0: delay .05: NEXT

IF ex = 280 AND walled(et) = 1 THEN ReflectSpell 4, et: EXIT SUB

IF ex = 280 THEN DamageChar 400, et ELSE DamageEnemy 4, 150, et

END SUB



SUB InitializeGame STATIC

FOR xxx = 1 TO 4: treasure(xxx) = 0: enemyat(xxx) = 0

IF xxx < 4 THEN walled(xxx) = 0

NEXT: curgold = 1000: mapnumber = 1: treasure(5) = 0: treasure(6) = 0

px = 9: py = 19: SCREEN 7, 0, 0, 0: CLS : curmp = 100

COLOR 15: PRINT "Loading graphics...": RANDOMIZE TIMER

cannotrun = 0: FOR xcoor = 0 TO 220 STEP 20

COLOR 14

SELECT CASE xcoor

CASE 0: PRINT "'Kyta (standing)'"

CASE 20: PRINT "'Kyta (attacking)'"

CASE 40: PRINT "'Glenlin (standing)'"

CASE 60: PRINT "'Glenlin (attacking)'"

CASE 80: PRINT "'Kohlen (standing)'"

CASE 100: PRINT "'Kohlen (attacking)'"

CASE 120: PRINT "'Lightning #1'"

CASE 140: PRINT "'Lightning #2'"

CASE 160: PRINT "'Heal Spell'"

CASE 180: PRINT "'Vampira Enemy'"

CASE 200: PRINT "'Vampire Bat Enemy'"

CASE 220: PRINT "'Shruiken'"

END SELECT

DrawGraphic xcoor, 1

NEXT

COLOR 14: PRINT "'Fire Spell'": DrawGraphic 240, 0

GetGraphics

FOR xabc = 1 TO 7: FOR bbc = 1 TO 3

READ Villager$(xabc, bbc): NEXT: NEXT

FOR xabc = 1 TO 6: READ qu$(xabc): NEXT

FOR xabc = 1 TO 9: READ ki$(xabc): NEXT

FOR xabc = 1 TO 18: READ inven(xabc): NEXT

FOR xabc = 1 TO 18: READ in$(xabc): NEXT

FOR xa = 1 TO 3: FOR bc = 1 TO 2: READ equip(xa, bc): NEXT: NEXT

FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ canequip(xa, bc): NEXT: NEXT

FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ charstat(xa, bc): NEXT: NEXT

FOR xabc = 1 TO 3: curhp(xabc) = charstat(xabc, 1): NEXT

FOR xa = 1 TO 2: FOR bc = 6 TO 17: READ power(bc, xa): NEXT: NEXT

FOR xabc = 1 TO 12: READ mn$(xabc): NEXT

FOR xabc = 1 TO 12: READ spellsknown(xabc): NEXT

FOR xabc = 1 TO 12: READ mpused(xabc): NEXT

FOR xabc = 2 TO 5: READ maglearn(xabc): NEXT

FOR xabc = 1 TO 12: READ magdata(xabc, 1): READ magdata(xabc, 2)

NEXT: FOR xabc = 1 TO 5: READ ename$(xabc): NEXT

FOR xabc = 1 TO 5: READ weak(xabc): READ strn(xabc): NEXT

FOR xa = 1 TO 5: FOR bc = 1 TO 13: READ etype(xa, bc): NEXT: NEXT

FOR xabc = 1 TO 4: READ levelup(xabc): NEXT

FOR xabc = 1 TO 3: curexp(xabc) = 1: curlev(xabc) = 1: NEXT

SCREEN 7, 0, 0, 0: CLS : RESTORE CityMap: DrawMap 2

END SUB



SUB InnkeeperTalk STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "Care to stay the night? It's"

PRINT "only 50 GP."

PRINT "                       (Y/N)"

LOCATE 3, 40: PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

IF UCASE$(dmb$) = "Y" THEN StayTheNight

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

COLOR , totalback

END SUB



REM $DYNAMIC

SUB JumpAttack (et) STATIC

DIM ex(4), ey(4): ex(1) = 35: ey(1) = 110: ex(2) = 110

ey(2) = 110: ex(3) = 35: ey(3) = 60: ex(4) = 110: ey(4) = 60

PCOPY 6, 3: LINE (225, 5)-(314, 25), 0, BF

LINE (225, 5)-(314, 25), 12, B: LOCATE 2, 30

COLOR 15: PRINT "Jump": PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6

FOR yowsa = 1 TO 4: IF enemyat(et) = 0 THEN et = et + 1

IF et = 5 THEN et = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 110)-(299, 129), coverup: SCREEN 7, 0, 6, 0

PUT (280, 110), coverup, PSET: PCOPY 6, 3

FOR bja = 110 TO 0 STEP -5: PCOPY 3, 6

PUT (280, bja), Kohlem2, AND: PUT (280, bja), Kohlen2, XOR

PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 0: delay 1

FOR bja = 0 TO ey(et) STEP 5: PCOPY 3, 6

PUT (ex(et), bja), Kohlenm, AND: PUT (ex(et), bja), Kohlen1, XOR

PCOPY 6, 0: delay .05: NEXT: FOR bja = ex(et) TO 300 STEP 5

PCOPY 3, 6: PUT (bja, ey(et)), Kohlem2, AND

PUT (bja, ey(et)), Kohlen2, XOR: PCOPY 6, 0: delay .05: NEXT

PCOPY 3, 0: delay 1: FOR bja = 0 TO 110 STEP 5: PCOPY 3, 6

PUT (280, bja), Kohlenm, AND: PUT (280, bja), Kohlen1, XOR

PCOPY 6, 0: delay .05: NEXT: PCOPY 6, 3: DamageEnemy 0, 275, et

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies

ERASE ex, ey, coverup

END SUB



SUB KillChar (et) STATIC

IF et = 2 THEN FOR bgh = 1 TO 3: walled(bgh) = 0: NEXT

delay 1: curhp(et) = 0: chosen(et, 1) = 0: walled(et) = 0

DIM ey(4), lner(20): ey(1) = 60: ey(2) = 85

ey(3) = 110: FOR xha = 10 TO 1 STEP -1

FOR ew = ey(et) TO ey(et) + 20 STEP xha

SCREEN 7, 0, 7, 0: GET (270, ew)-(310, ew), lner

SCREEN 7, 0, 6, 0: PUT (270, ew), lner, PSET

PCOPY 6, 0: delay .00001: NEXT: NEXT: ERASE ey, lner

END SUB



SUB KillEnemy (et) STATIC

delay 1: ehit(et) = 0: enemyat(et) = 0

DIM ex(4), ey(4), lner(20): ex(1) = 35: ey(1) = 110: ex(2) = 110

ey(2) = 110: ex(3) = 35: ey(3) = 60: ex(4) = 110: ey(4) = 60

FOR xha = 10 TO 1 STEP -1

FOR ew = ey(et) - 10 TO ey(et) + 30 STEP xha

SCREEN 7, 0, 7, 0: GET (ex(et) - 10, ew)-(ex(et) + 30, ew), lner

SCREEN 7, 0, 6, 0: PUT (ex(et) - 10, ew), lner, PSET

PCOPY 6, 0: delay .00001: NEXT: NEXT: ERASE ex, ey, lner

END SUB



REM $STATIC

SUB KingTalk STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12

FOR cba = 1 TO 2

FOR ABC = 1 TO 3

LOCATE ABC, 1: IF cba = 1 THEN PRINT ki$(ABC) ELSE PRINT ki$(ABC + 3)

NEXT: LOCATE 3, 40

IF cba = 2 THEN

PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

PCOPY 2, 0: delay 1: COLOR 13: LOCATE 4, 37: PRINT CHR$(2)

LOCATE 5, 36: PRINT CHR$(2): LOCATE 5, 38: PRINT CHR$(2)

LOCATE 6, 37: PRINT CHR$(2): PCOPY 2, 0: delay 3

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1: FOR bcdc = 7 TO 9

PRINT ki$(bcdc): NEXT: LOCATE 3, 40: PRINT CHR$(254)

PCOPY 2, 0: SLEEP: dmbo$ = INKEY$: FOR whoohoo = 1 TO 4

SetBattle whoohoo, 5: NEXT: cannotrun = 1: EnsueBattle

SCREEN 7, 0, 0, 0: CLS : Epilogue: EXIT SUB

END IF

IF cba = 1 THEN

PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12

END IF

NEXT

END SUB



REM $DYNAMIC

SUB KohlenAttack (etarg) STATIC

FOR yowsa = 1 TO 4

IF enemyat(etarg) = 0 THEN etarg = etarg + 1

IF etarg = 5 THEN etarg = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 110)-(299, 129), coverup: SCREEN 7, 0, 6, 0

PUT (280, 110), coverup, PSET

PUT (280, 110), Kohlem2, AND: PUT (280, 110), Kohlen2, XOR

PCOPY 6, 3: IF etarg = 1 THEN ex = 50: ey = 120: ly = 16: lx = 4

IF etarg = 2 THEN ex = 125: ey = 120: ly = 16: lx = 15

IF etarg = 3 THEN ex = 50: ey = 70: ly = 9: lx = 4

IF etarg = 4 THEN ex = 125: ey = 70: ly = 9: lx = 15

FOR xanth = 1 TO 20: PCOPY 3, 6

PUT (ex - xanth, ey), Bangm, AND: PUT (ex - xanth, ey), Bang1, XOR

PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0

PUT (280, 110), coverup, PSET

PUT (280, 110), Kohlenm, AND: PUT (280, 110), Kohlen1, XOR

ERASE coverup: pdamage = INT(RND(1) * 50) + charstat(3, 3) - 50

pdamage = pdamage - INT(.75 * etype(enemyat(etarg), 3))

pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx

IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage

SCREEN 7, 0, 6, 0: ehit(etarg) = ehit(etarg) - pdamage

IF ehit(etarg) < 1 THEN KillEnemy etarg

PCOPY 7, 6: delay 1: PlaceEnemies

END SUB



SUB KytaAttack (etarg) STATIC

FOR yowsa = 1 TO 4

IF enemyat(etarg) = 0 THEN etarg = etarg + 1

IF etarg = 5 THEN etarg = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 60)-(299, 79), coverup: SCREEN 7, 0, 6, 0

PUT (280, 60), coverup, PSET

PUT (280, 60), Kytm2, AND: PUT (280, 60), Kyta2, XOR

PCOPY 6, 3: IF etarg = 1 THEN ex = 55: ey = 120: ly = 16: lx = 4

IF etarg = 2 THEN ex = 130: ey = 120: ly = 16: lx = 15

IF etarg = 3 THEN ex = 55: ey = 70: ly = 9: lx = 4

IF etarg = 4 THEN ex = 130: ey = 70: ly = 9: lx = 15

FOR xanth = 1 TO 20: PCOPY 3, 6: LINE (ex, ey)-(ex - xanth, ey), 12

LINE (ex, ey - 1)-(ex - xanth, ey - 1), 4

LINE (ex, ey + 1)-(ex - xanth, ey + 1), 4

PCOPY 6, 0: delay .05: NEXT: ex = ex - 20

FOR xanth = 19 TO 1 STEP -1: PCOPY 3, 6

LINE (ex, ey)-(ex + xanth, ey), 12

LINE (ex, ey - 1)-(ex + xanth, ey - 1), 4

LINE (ex, ey + 1)-(ex + xanth, ey + 1), 4

PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 0

PCOPY 3, 6: PUT (280, 60), coverup, PSET

PUT (280, 60), Kytam, AND: PUT (280, 60), Kyta1, XOR: ERASE coverup

pdamage = INT(RND(1) * 50) + charstat(1, 3) - 50

pdamage = pdamage - INT(.75 * etype(enemyat(etarg), 3))

pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0

SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx

IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage

SCREEN 7, 0, 6, 0: ehit(etarg) = ehit(etarg) - pdamage

IF ehit(etarg) < 1 THEN KillEnemy etarg

PCOPY 7, 6: delay 1: PlaceEnemies

END SUB



REM $STATIC

SUB LightningSpell (ex, ey, et) STATIC

FOR aga = 1 TO 20: PCOPY 3, 6

IF aga / 2 = aga \ 2 THEN

PUT (ex, ey), Lim2, AND

PUT (ex, ey), Lit2, XOR

ELSE

PUT (ex, ey), Litm, AND

PUT (ex, ey), Lit1, XOR

END IF

PCOPY 6, 0: delay .1: NEXT

IF ex = 280 AND walled(et) = 1 THEN ReflectSpell 5, et: EXIT SUB

IF ex = 280 THEN DamageChar 400, et ELSE DamageEnemy 5, 150, et

END SUB



SUB Mosaic (Siz) STATIC

FOR BCs = 0 TO 199 STEP Siz

FOR CDs = 0 TO 319 STEP Siz

Ns = POINT(CDs, BCs)

LINE (CDs, BCs)-(CDs + (Siz - 1), BCs + (Siz - 1)), Ns, BF

NEXT: NEXT

END SUB



SUB NotEnoughMP STATIC

COLOR 15: LINE (0, 0)-(319, 31), 0, BF

LINE (0, 31)-(319, 31), 12

LOCATE 1, 1: PRINT "You don't have enough MP"

PRINT "to cast that spell!": LOCATE 3, 40: PRINT CHR$(254)

PCOPY 6, 0: SLEEP: dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0

END SUB



SUB PlaceEnemies STATIC

LINE (5, 150)-(100, 185), 0, BF: LINE (5, 150)-(100, 185), 12, B

COLOR 15: FOR abdf = 1 TO 4: LOCATE 19 + abdf, 2

IF enemyat(abdf) > 0 THEN PRINT ename$(enemyat(abdf))

NEXT: LINE (150, 150)-(314, 180), 0, BF

LINE (150, 150)-(314, 180), 12, B

FOR abdf = 1 TO 3: LOCATE 19 + abdf, 20

SELECT CASE abdf

CASE 1: PRINT "Kyta    HP ";

CASE 2: PRINT "Glenlin HP ";

CASE 3: PRINT "Kohlen  HP ";

END SELECT

jnum$ = STR$(curhp(abdf)): knum$ = STR$(charstat(abdf, 1))

jnum$ = LTRIM$(jnum$): knum$ = LTRIM$(knum$)

FOR bghg = 1 TO 3: IF LEN(jnum$) < 4 THEN jnum$ = "0" + jnum$

IF LEN(knum$) < 4 THEN knum$ = "0" + knum$

NEXT: PRINT jnum$; "/"; knum$: NEXT

IF curhp(1) > 0 THEN

PUT (280, 60), Kytam, AND: PUT (280, 60), Kyta1, XOR

END IF

IF curhp(2) > 0 THEN

PUT (280, 85), Glenlinm, AND: PUT (280, 85), Glenlin1, XOR

END IF

IF curhp(3) > 0 THEN

PUT (280, 110), Kohlenm, AND: PUT (280, 110), Kohlen1, XOR

END IF

FOR xaljh = 1 TO 4

IF xaljh = 1 THEN sposx = 35: sposy = 110

IF xaljh = 2 THEN sposx = 110: sposy = 110

IF xaljh = 3 THEN sposx = 35: sposy = 60

IF xaljh = 4 THEN sposx = 110: sposy = 60

SELECT CASE enemyat(xaljh)

CASE 1, 3:

FOR xabc = 1 TO 15

CIRCLE (sposx + 15, sposy + 15), xabc, xabc: NEXT

CASE 2, 4:

PUT (sposx, sposy), Batm, AND: PUT (sposx, sposy), Bat1, XOR

CASE 5:

PUT (sposx, sposy), Vampiram, AND

PUT (sposx, sposy), Vampira1, XOR

END SELECT

NEXT

END SUB



SUB PlayMainGame STATIC

SCREEN 7, 0, 2, 0: CLS

DO: PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

a$ = INKEY$

SELECT CASE a$

CASE CHR$(0) + CHR$(72): 'up arrow

tm$ = MID$(curmap$(py - 1), px, 1)

IF tm$ = " " OR tm$ = "A" OR tm$ = "B" THEN py = py - 1

CASE CHR$(0) + CHR$(75): 'left arrow

tm$ = MID$(curmap$(py), px - 1, 1)

IF tm$ = " " OR tm$ = "A" OR tm$ = "B" THEN px = px - 1

CASE CHR$(0) + CHR$(77): 'right arrow

tm$ = MID$(curmap$(py), px + 1, 1)

IF tm$ = " " OR tm$ = "A" OR tm$ = "B" THEN px = px + 1

CASE CHR$(0) + CHR$(80): 'down arrow

tm$ = MID$(curmap$(py + 1), px, 1)

IF tm$ = " " OR tm$ = "A" OR tm$ = "B" THEN py = py + 1

CASE CHR$(13): StatusScreen'Enter key

CASE " ":                  'space bar

IF Surrounding("1") THEN VillagerTalk 1

IF Surrounding("2") THEN VillagerTalk 2

IF Surrounding("3") THEN VillagerTalk 3

IF Surrounding("4") THEN VillagerTalk 4

IF Surrounding("5") THEN VillagerTalk 5

IF Surrounding("6") THEN VillagerTalk 6

IF Surrounding("7") THEN VillagerTalk 7

IF Surrounding("Q") THEN QueenTalk

IF Surrounding("K") THEN KingTalk: EXIT SUB

IF Surrounding("I") THEN InnkeeperTalk

IF Surrounding("W") THEN ShopkeeperTalk

IF Surrounding("C") THEN CampGround

IF Surrounding("a") THEN TreasureChest 1, 0, 1, 10

IF Surrounding("b") THEN TreasureChest 2, 0, 2, 10

IF Surrounding("c") THEN TreasureChest 3, 0, 16, 1

IF Surrounding("d") THEN TreasureChest 4, 0, 18, 1

IF Surrounding("v") THEN

SetBattle 1, 5: TreasureChest 5, 1, 0, 0

END IF

IF Surrounding("V") THEN

SetBattle 1, 4: SetBattle 2, 5: TreasureChest 6, 1, 5, 1

END IF

END SELECT

IF MID$(curmap$(py), px, 1) = "A" THEN

SCREEN 7, 0, 0, 0: CLS : RESTORE CaveMap: DrawMap 6

px = 18: py = 19: SCREEN 7, 0, 2, 0: mapnumber = 2

END IF

IF MID$(curmap$(py), px, 1) = "B" THEN

SCREEN 7, 0, 0, 0: CLS : RESTORE CityMap: DrawMap 2

px = 38: py = 2: SCREEN 7, 0, 2, 0: mapnumber = 1

END IF

PCOPY 2, 0

IF a$ <> "" AND a$ <> CHR$(27) THEN

xaxa = INT(RND(1) * 100)

IF mapnumber = 1 AND xaxa < 6 THEN RandBattle 1, 2

IF mapnumber = 2 AND xaxa < 5 THEN

IF INT(RND(1) * 100) < 20 THEN

SetBattle 1, 5: EnsueBattle

ELSE

RandBattle 3, 4

END IF

END IF

END IF

LOOP UNTIL a$ = CHR$(27)

END SUB



SUB QueenTalk STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12

FOR cba = 1 TO 2

FOR ABC = 1 TO 3

LOCATE ABC, 1: IF cba = 1 THEN PRINT qu$(ABC) ELSE PRINT qu$(ABC + 3)

NEXT: LOCATE 3, 40

IF cba = 2 THEN PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

IF cba = 1 THEN

PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12

END IF

NEXT

END SUB



SUB RandBattle (batnum1, batnum2) STATIC

xav = INT(RND(1) * 4) + 1

IF xav > 4 THEN xav = 4

FOR abab = 1 TO xav

xabh = INT(RND(1) * (batnum2 - batnum1 + 1)) + 1

IF xabh > batnum2 - batnum1 + 1 THEN xabh = batnum2 - batnum1 + 1

SetBattle abab, batnum1 - 1 + xabh

NEXT

EnsueBattle

END SUB



SUB ReflectSpell (spnum, et) STATIC

curmp = curmp + mpused(spnum): DIM ey(3)

walled(etarg) = 1: ey(1) = 60: ey(2) = 85: ey(3) = 110

PCOPY 3, 6: FOR gjkl = 1 TO 15

LINE (270, ey(et) + gjkl)-(290, ey(et) + gjkl + 10), gjkl

NEXT: PCOPY 6, 0: delay 1: PCOPY 3, 0: PCOPY 3, 6: ERASE ey

FOR lada = 1 TO 4: IF enemyat(lada) > 0 THEN etarg = lada

NEXT: CastSpell spnum, etarg

END SUB



REM $DYNAMIC

SUB RemoveGraphics STATIC

ERASE Kyta1, Kyta2, Glenlin1, Glenlin2, Kohlen1, Kohlen2

ERASE Lit1, Lit2, Heal1, Vampira1, Bat1, Shruik1, Shruikm

ERASE Bang1, Bangm, Kytam, Kytm2, Glenlinm, Glenlim2, curlev

ERASE Kohlenm, Kohlem2, Litm, Lim2, Healm, Vampiram, Batm

ERASE Villager$, treasure, curmap$, qu$, ki$, curhp, curexp

ERASE etype, ename$, inven, equip, charstat, power, mpused

ERASE spellsknown, enemyat, weak, strn, maglearn, magdata

ERASE canequip, chosen, ehit, gitm, walled

END SUB



REM $STATIC

SUB RunAway STATIC

PCOPY 6, 3: COLOR 15: LINE (0, 0)-(319, 31), 0, BF

LINE (0, 31)-(319, 31), 12: cnrn = INT(RND(1) * 100)

LOCATE 1, 1

IF cannotrun = 1 THEN

PRINT "You cannot escape from": PRINT "this battle!"

LOCATE 3, 40: PRINT CHR$(254): PCOPY 6, 0: SLEEP

dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0: delay 1: EXIT SUB

END IF

IF cnrn < 50 THEN

PRINT "Somehow, you manage to elude"

PRINT "the enemy and escape from": PRINT "battle."

LOCATE 3, 40: PRINT CHR$(254): PCOPY 6, 0: SLEEP

dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0

totalgold = 0: totalexp = 0: FOR xg = 1 TO 4

gitm(xg) = 0: enemyat(xg) = 0: ehit(xg) = 0: NEXT

ELSE

PRINT "You attempt an escape, but"

PRINT "the enemy sees you."

LOCATE 3, 40: PRINT CHR$(254): PCOPY 6, 0: SLEEP

dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0: delay 1: EXIT SUB

END IF

END SUB



SUB SellItem STATIC

StartofSellingSub:

COLOR 15: LINE (0, 0)-(319, 199), 1, BF: LINE (0, 0)-(319, 199), 12, B

LINE (0, 31)-(319, 31), 12: LOCATE 2, 3: PRINT "Sell what?"

FOR gab = 6 TO 17: COLOR 14

LOCATE gab + 2, 12: PRINT in$(gab): COLOR 15

LOCATE gab + 2, 30: PRINT "GP"; INT(.5 * power(gab, 2))

NEXT: PCOPY 2, 1: mychc = 6: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 2, 10: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 5 THEN mychc = 17

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 18 THEN mychc = 6

CASE CHR$(27): ii$ = CHR$(13): mychc = 18

END SELECT

LOOP UNTIL ii$ = CHR$(13)

IF mychc = 18 THEN EXIT SUB

IF inven(mychc) = 0 THEN

LOCATE 2, 3: PRINT "You don't have any, you idiot!"

PCOPY 2, 0: delay 1: GOTO StartofSellingSub

END IF

LOCATE 2, 3: PRINT "You sure you don't want it? (Y/N)"

PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""

IF UCASE$(ii$) = "Y" THEN

curgold = curgold + INT(.5 * power(mychc, 2))

inven(mychc) = inven(mychc) - 1

IF curgold > 9999 THEN curgold = 9999

LOCATE 2, 3: PRINT "Done!                             "

PCOPY 2, 0: delay 1

ELSE

GOTO StartofSellingSub

END IF

END SUB



SUB SetBattle (batnum, enum) STATIC

enemyat(batnum) = enum

END SUB



SUB ShopkeeperTalk STATIC

DO: CLS : LINE (0, 0)-(319, 199), 1, BF

LINE (0, 0)-(319, 199), 12, B: LOCATE 2, 3: PCOPY 2, 0

COLOR 15, 1: PRINT "What'll it be?"

COLOR 14: LOCATE 18, 18: PRINT "BUY": LOCATE 19, 18

PRINT "SELL": LOCATE 20, 18: PRINT "EXIT": PCOPY 2, 0

PCOPY 2, 1: yurc = 1: DO: PCOPY 1, 2: LOCATE yurc + 17, 16

COLOR 15: PRINT CHR$(26): PCOPY 2, 0: ii$ = INKEY$

SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

yurc = yurc - 1: IF yurc = 0 THEN yurc = 3

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

yurc = yurc + 1: IF yurc = 4 THEN yurc = 1

CASE CHR$(27): ii$ = CHR$(13): yurc = 3

END SELECT

LOOP UNTIL ii$ = CHR$(13)

SELECT CASE yurc

CASE 1: BuyItem: IF cannotrun = 1 THEN cannotrun = 0: EXIT SUB

CASE 2: SellItem

CASE 3: GOTO Loopershop

END SELECT

LOOP

Loopershop:

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

COLOR 15, totalback: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "Nice doin' business with ya'!": LOCATE 3, 40

PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);

END SUB



SUB StatusScreen STATIC

DO: CLS : LINE (0, 0)-(319, 199), 1, BF

LINE (0, 0)-(319, 199), 12, B: PCOPY 2, 0

COLOR 15, 1: FOR abdf = 1 TO 3: LOCATE 19 + abdf, 2

SELECT CASE abdf

CASE 1: PRINT "Kyta    HP ";

CASE 2: PRINT "Glenlin HP ";

CASE 3: PRINT "Kohlen  HP ";

END SELECT

jnum$ = STR$(curhp(abdf)): knum$ = STR$(charstat(abdf, 1))

jnum$ = LTRIM$(jnum$): knum$ = LTRIM$(knum$)

FOR bghg = 1 TO 3: IF LEN(jnum$) < 4 THEN jnum$ = "0" + jnum$

IF LEN(knum$) < 4 THEN knum$ = "0" + knum$

NEXT: PRINT jnum$; "/"; knum$; " MP ";

IF abdf = 1 OR abdf = 3 THEN

PRINT "000/000"; " LV"; curlev(abdf)

ELSE

njh$ = LTRIM$(STR$(curmp)): FOR baha = 1 TO 3

IF LEN(njh$) < 3 THEN njh$ = "0" + njh$

NEXT

PRINT njh$; "/"; LTRIM$(STR$(charstat(2, 2)));

PRINT " LV"; curlev(abdf)

END IF

NEXT: LOCATE 18, 18: PRINT "GP"; curgold

COLOR 14: LOCATE 5, 15: PRINT "INVENTORY"

LOCATE 6, 15: PRINT "EQUIP"

LOCATE 7, 15: PRINT "EXIT"

PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15

LOCATE mychc + 4, 13: PRINT CHR$(26): PCOPY 2, 0

ii$ = INKEY$: SELECT CASE ii$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

mychc = mychc - 1: IF mychc = 0 THEN mychc = 3

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

mychc = mychc + 1: IF mychc = 4 THEN mychc = 1

CASE CHR$(27): ii$ = CHR$(13): mychc = 3

END SELECT

LOOP UNTIL ii$ = CHR$(13)

IF mychc = 3 THEN

PCOPY 5, 2: LOCATE py, px

COLOR 14, totalback: PRINT CHR$(1): EXIT SUB

END IF

IF mychc = 2 THEN EquipItems

IF mychc = 1 THEN

CLS : LINE (0, 0)-(319, 199), 1, BF

LINE (0, 0)-(319, 199), 12, B

COLOR 15: LOCATE 2, 3: PRINT "Press any key to exit."

COLOR 14: cloc = 5: FOR bala = 1 TO 18: LOCATE cloc, 10

IF inven(bala) > 0 THEN

PRINT in$(bala): LOCATE cloc, 29

hag$ = LTRIM$(STR$(inven(bala)))

IF LEN(hag$) = 1 THEN hag$ = "0" + hag$

PRINT hag$: cloc = cloc + 1

END IF

NEXT

PCOPY 2, 0: SLEEP: dmbo$ = INKEY$

END IF

LOOP

END SUB



SUB StayTheNight STATIC

IF curgold < 50 THEN CheapSkate: EXIT SUB

SCREEN 7, 0, 4, 0: CLS : COLOR , 0

FOR nonamevar = 1 TO 50

xag = INT(RND(1) * 3) + 1: IF xag > 3 THEN xag = 3

IF xag = 1 THEN COLOR 15

IF xag = 2 THEN COLOR 7

IF xag = 3 THEN COLOR 8

PSET (INT(RND(1) * 319), INT(RND(1) * 199)): NEXT

PCOPY 4, 0: delay 4: PALETTE 15, 7: PALETTE 7, 8

PALETTE 8, 0: delay 2: PALETTE 15, 8: PALETTE 0, 1

delay 2: PALETTE 0, 9: PALETTE 15, 1: PALETTE 7, 1

PALETTE 8, 9: delay 4: SCREEN 7, 0, 0, 0: CLS

SCREEN 7, 0, 4, 0: CLS : PALETTE 0, 0: PALETTE 7, 7

PALETTE 8, 8: PALETTE 15, 15: PALETTE 11, 1: PALETTE 2, 8

PALETTE 10, 0: COLOR 11, 0: FOR waha = 100 TO 50 STEP -1

LINE (0, 0)-(319, 50), , BF: CIRCLE (160, waha), 25, 14

PAINT (160, waha), 14: LINE (0, 51)-(319, 199), 2, BF

cntr = 1: FOR lookreal = 50 TO 199: cntr = cntr + 1

LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF

lookreal = lookreal + cntr: NEXT: delay .1: PCOPY 4, 0

IF waha = 75 THEN PALETTE 10, 2: PALETTE 11, 9: PALETTE 2, 8

NEXT: FOR ohjeez = 15 TO 1 STEP -1: PALETTE ohjeez, ohjeez: NEXT

cntr = 0: COLOR 14: FOR lookreal = 51 TO 76: cntr = cntr + 1

LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)

lookreal = lookreal + cntr: NEXT: PCOPY 4, 0: delay 4

FOR rstrit = 1 TO 3: curhp(rstrit) = charstat(rstrit, 1): NEXT

curmp = charstat(2, 2): curgold = curgold - 50

CLS : SCREEN 7, 0, 2, 0

END SUB



FUNCTION Surrounding% (ttlf$) STATIC

ok = 0: IF MID$(curmap$(py), px + 1, 1) = ttlf$ THEN ok = 1

IF MID$(curmap$(py + 1), px, 1) = ttlf$ THEN ok = 1

IF MID$(curmap$(py - 1), px, 1) = ttlf$ THEN ok = 1

IF MID$(curmap$(py), px - 1, 1) = ttlf$ THEN ok = 1

Surrounding% = ok

END FUNCTION



SUB TargetChar (sabro) STATIC

tgt = 1: DIM ep(3, 2): ep(1, 1) = 280: ep(1, 2) = 60

ep(2, 1) = 280: ep(2, 2) = 85: ep(3, 1) = 280: ep(3, 2) = 110

COLOR 12: DO: PCOPY 4, 6: whassis$ = INKEY$

CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20

LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)

LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)

SELECT CASE whassis$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

IF tgt = 1 THEN tgt = 3 ELSE tgt = tgt - 1

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

IF tgt = 3 THEN tgt = 1 ELSE tgt = tgt + 1

CASE CHR$(13):

chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB

CASE CHR$(27): erlvl = 1: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB

END SELECT

PCOPY 6, 0: LOOP

END SUB



SUB TargetEnemy1 (sabro) STATIC

tgt = 0: DIM ep(4, 2)

ep(1, 1) = 35: ep(1, 2) = 110: ep(2, 1) = 110: ep(2, 2) = 110

ep(3, 1) = 35: ep(3, 2) = 60: ep(4, 1) = 110: ep(4, 2) = 60

FOR abga = 1 TO 4

IF enemyat(abga) > 0 AND tgt = 0 THEN tgt = abga

NEXT

COLOR 12: DO: PCOPY 4, 6: whassis$ = INKEY$

CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20

LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)

LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)

SELECT CASE whassis$

CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):

IF tgt = 1 THEN tgt = 4 ELSE tgt = tgt - 1

ghaflag = 0: FOR whoa = tgt TO 1 STEP -1

IF enemyat(whoa) > 0 THEN tgt = whoa: ghaflag = 1: whoa = 0

NEXT

IF ghaflag = 0 THEN

FOR whoa = 4 TO tgt STEP -1

IF enemyat(whoa) > 0 THEN tgt = whoa: whoa = 0

NEXT

END IF

CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):

IF tgt = 4 THEN tgt = 1 ELSE tgt = tgt + 1

ghaflag = 0: FOR whoa = tgt TO 4

IF enemyat(whoa) > 0 THEN

tgt = whoa: ghaflag = 1: whoa = 5

END IF

NEXT

IF ghaflag = 0 THEN

FOR whoa = 1 TO tgt

IF enemyat(whoa) > 0 THEN tgt = whoa: whoa = 5

NEXT

END IF

CASE CHR$(13):

chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB

CASE CHR$(27)

erlvl = 1: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB

END SELECT

PCOPY 6, 0: LOOP

END SUB



SUB TargetEnemy2 (sabro) STATIC

IF chosen(2, 2) = 0 THEN EXIT SUB

IF magdata(chosen(2, 2), 2) = 1 THEN EXIT SUB

pn = magdata(chosen(2, 2), 1)

IF pn = 6 OR pn = 7 OR pn = 8 THEN TargetChar sabro: EXIT SUB

TargetEnemy1 sabro

END SUB



REM $DYNAMIC

SUB TossStar (snum, et) STATIC

inven(snum) = inven(snum) - 1

DIM ex(4), ey(4): ex(1) = 35: ey(1) = 110: ex(2) = 110

ey(2) = 110: ex(3) = 35: ey(3) = 60: ex(4) = 110: ey(4) = 60

PCOPY 6, 3: LINE (210, 5)-(314, 25), 0, BF

LINE (210, 5)-(314, 25), 12, B: LOCATE 2, 29

COLOR 15: PRINT in$(snum): PCOPY 6, 0: delay 1: PCOPY 3, 0

PCOPY 3, 6: FOR yowsa = 1 TO 4: IF enemyat(et) = 0 THEN et = et + 1

IF et = 5 THEN et = 1

NEXT: DIM coverup(140): SCREEN 7, 0, 7, 0

GET (280, 110)-(299, 129), coverup: SCREEN 7, 0, 6, 0

PUT (280, 110), coverup, PSET

PUT (280, 110), Kohlem2, AND: PUT (280, 110), Kohlen2, XOR

PCOPY 6, 3: FOR az = ex(et) + 60 TO ex(et) STEP -3: PCOPY 3, 6

PUT (az, ey(et)), Shruikm, AND: PUT (az, ey(et)), Shruik1, XOR

PCOPY 6, 0: delay .05: NEXT

IF snum = 1 THEN DamageEnemy 0, 325, et

IF snum = 2 THEN DamageEnemy 0, 450, et

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies

ERASE ex, ey, coverup

END SUB



REM $STATIC

SUB TreasureChest (trnum, fght, itmnum, quan) STATIC

IF treasure(trnum) = 1 THEN EmptyChest: EXIT SUB

treasure(trnum) = 1

IF fght = 1 THEN

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "You open the treasure chest"

PRINT "and find...": PRINT "    ** MONSTER **"

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

cannotrun = 1: EnsueBattle

SCREEN 7, 0, 2, 0: COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "You look deeper into the chest"

IF itmnum = 0 THEN

PRINT "but find nothing."

ELSE

PRINT "and find "; UCASE$(in$(itmnum)); " x";

PRINT quan

inven(itmnum) = inven(itmnum) + quan

IF inven(itmnum) > 99 THEN inven(itmnum) = 99

END IF

DO: bbb$ = INKEY$: LOOP UNTIL bbb$ = ""

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

ELSE

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: LOCATE 1, 1

PRINT "Found "; UCASE$(in$(itmnum)); " x";

PRINT quan

inven(itmnum) = inven(itmnum) + quan

IF inven(itmnum) > 99 THEN inven(itmnum) = 99

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

END IF

END SUB



SUB TremorSpell (ex, ey, et) STATIC

PCOPY 7, 6

IF ex = 280 THEN

strh = curhp(et): strg = et + 5: curhp(et) = 0: PlaceEnemies

LOCATE 19 + et, 31

jnum$ = STR$(strh): knum$ = STR$(charstat(et, 1))

jnum$ = LTRIM$(jnum$): knum$ = LTRIM$(knum$)

FOR bghg = 1 TO 3: IF LEN(jnum$) < 4 THEN jnum$ = "0" + jnum$

IF LEN(knum$) < 4 THEN knum$ = "0" + knum$

NEXT: PRINT jnum$; "/"; knum$

ELSE

strg = enemyat(et): enemyat(et) = 0: PlaceEnemies

LOCATE 19 + et, 2: COLOR 15: PRINT ename$(strg)

END IF

PCOPY 6, 1: shk = 10: FOR bksh = 1 TO 20: PCOPY 1, 6

SELECT CASE strg

CASE 1, 3:

FOR xabc = 1 TO 15

CIRCLE (ex + 15, ey + 15 - shk), xabc, xabc: NEXT

CASE 2, 4:

PUT (ex, ey - shk), Batm, AND: PUT (ex, ey - shk), Bat1, XOR

CASE 5:

PUT (ex, ey - shk), Vampiram, AND: PUT (ex, ey - shk), Vampira1, XOR

CASE 6:

PUT (ex, ey - shk), Kytam, AND: PUT (ex, ey - shk), Kyta1, XOR

CASE 7:

PUT (ex, ey - shk), Glenlinm, AND: PUT (ex, ey - shk), Glenlin1, XOR

CASE 8:

PUT (ex, ey - shk), Kohlenm, AND: PUT (ex, ey - shk), Kohlen1, XOR

END SELECT

shk = -shk: IF shk > 0 THEN shk = shk - 1

PCOPY 6, 0: delay .1: NEXT

IF ex = 280 THEN curhp(et) = strh ELSE enemyat(et) = strg

IF ex = 280 AND walled(et) = 1 THEN ReflectSpell 6, et: EXIT SUB

IF ex = 280 THEN DamageChar 600, et ELSE DamageEnemy 6, 175, et

END SUB



SUB VillagerTalk (vlgnum) STATIC

COLOR 15: LINE (0, 0)-(319, 31), totalback, BF

LINE (0, 31)-(319, 31), 12: FOR ABC = 1 TO 3

LOCATE ABC, 1: PRINT Villager$(vlgnum, ABC): NEXT

LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$

END SUB



SUB WinBattle STATIC

IF totalexp = 0 THEN EXIT SUB

COLOR 15: LINE (0, 0)-(319, 31), 0, BF

LINE (0, 31)-(319, 31), 12: LOCATE 3, 40: PRINT CHR$(26)

PCOPY 6, 3: LOCATE 1, 1: PRINT "Gained"; totalexp;

PRINT "experience!": GOSUB WWinKey

FOR h = 1 TO 3

IF curhp(h) > 0 THEN curexp(h) = curexp(h) + totalexp

IF curexp(h) > 20000 THEN curexp(h) = 20000

NEXT: FOR h = 1 TO 3

IF curlev(h) < 5 THEN

IF curexp(h) >= levelup(curlev(h)) THEN

curlev(h) = curlev(h) + 1

dhp = INT(.2 * charstat(h, 1))

charstat(h, 1) = charstat(h, 1) + dhp

IF charstat(h, 1) > 9999 THEN charstat(h, 1) = 9999

curhp(h) = curhp(h) + dhp

IF curhp(h) > 9999 THEN curhp(h) = 9999

SELECT CASE h

CASE 1: PRINT "Kyta ";

CASE 2: PRINT "Glenlin ";

CASE 3: PRINT "Kohlen ";

END SELECT

PRINT "gained a level!"

IF h = 2 THEN

charstat(2, 2) = charstat(2, 2) + 50

curmp = curmp + 50

END IF

IF h = 2 AND maglearn(curlev(h)) > 0 THEN

spellsknown(maglearn(curlev(h))) = 1

PRINT "Learned "; UCASE$(mn$(maglearn(curlev(h)))); "!"

END IF

GOSUB WWinKey

END IF

END IF

NEXT: FOR gafl = 1 TO 4

IF gitm(gafl) > 0 THEN

exrt = INT(RND(1) * 100)

IF exrt < 10 THEN

inven(gitm(gafl)) = inven(gitm(gafl)) + 1

IF inven(gitm(gafl)) = 100 THEN inven(gitm(gafl)) = 99

PRINT "Found "; UCASE$(in$(gitm(gafl))); "!"

GOSUB WWinKey

END IF

END IF

NEXT: curgold = curgold + totalgold

IF curgold > 9999 THEN curgold = 9999

PRINT "Received"; totalgold; "GP!": LOCATE 3, 40

PRINT CHR$(254): GOSUB WWinKey: EXIT SUB

WWinKey:

PCOPY 6, 0: SLEEP: dm$ = INKEY$

PCOPY 3, 6: LOCATE 1, 1: RETURN

END SUB



